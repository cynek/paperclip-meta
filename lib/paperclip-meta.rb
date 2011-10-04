module Paperclip
  class Attachment
    alias :original_post_process_styles :post_process_styles
    alias :original_save :save

    # If attachment deleted - destroy meta data
    def save
      if (not @queued_for_delete.empty?) and @queued_for_write.empty?
        instance_write(:meta, ActiveSupport::Base64.encode64(Marshal.dump({}))) if instance.respond_to?(:"#{name}_meta=")
      end
      original_save
    end
      
    # If model has #{name}_meta column we getting sizes of processed
    # thumbnails and saving it to #{name}_meta column.
    def post_process_styles
      original_post_process_styles

      if instance.respond_to?(:"#{name}_meta=")
        meta # init

        @queued_for_write.each do |style, file|
          begin
            geo = Geometry.from_file file
            @meta[style] = {:width => geo.width.to_i, :height => geo.height.to_i, :size => File.size(file) }
          rescue NotIdentifiedByImageMagickError => e
            @meta[style] = {}
          end
        end

        instance_write(:meta, ActiveSupport::Base64.encode64(Marshal.dump(@meta)))
      end
    end

    # Meta access methods
    [:width, :height, :size].each do |meth|
      define_method(meth) do |*args|
        style = args.first || default_style
        meta_read(style, meth)
      end
    end

    def meta_write(meta_data)
      meta # init
      meta_data.each do |style,style_meta_data|
        @meta[style.to_sym] = style_meta_data
      end
      instance_write(:meta, ActiveSupport::Base64.encode64(Marshal.dump(@meta)))
    end

    def image_size(style = default_style)
      "#{width(style)}x#{height(style)}"
    end

    private

    def meta
      if instance.respond_to?(:"#{name}_meta") && instance_read(:meta)
        @meta ||= Marshal.load(ActiveSupport::Base64.decode64(instance_read(:meta)))
      end
      @meta ||= {}
    end

    def meta_read(style, item)
      meta
      @meta.key?(style) ? @meta[style][item].to_i : nil
    end
  end
end

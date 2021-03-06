# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{apress-paperclip-meta}
  s.version = "0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alexey Bondar"]
  s.date = %q{2010-11-30}
  s.description = %q{Add width, height and size methods to paperclip thumbnails}
  s.email = %q{y8@ya.ru}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "README.rdoc",
     "Rakefile",
     "init.rb",
     "lib/paperclip-meta.rb"
  ]
  s.homepage = %q{http://github.com/y8/paperclip-meta}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{paperclip-meta}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Thumbnail dimensions for paperclip}
  s.test_files = [
    "spec/paperclip-meta/paperclip-meta_spec.rb",
     "spec/schema.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<apress-paperclip>, [">= 0"])
    else
      s.add_dependency(%q<apress-paperclip>, [">= 0"])
    end
  else
    s.add_dependency(%q<apress-paperclip>, [">= 0"])
  end
end


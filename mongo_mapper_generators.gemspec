# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mongo_mapper_generators}
  s.version = "1.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Steve Agalloco"]
  s.date = %q{2010-02-12}
  s.description = %q{Generators for use with the MongoMapper rubygem.  Use to generate Documents, EmbeddedDocuments, and Rails initializer.}
  s.email = %q{steve.agalloco@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    "LICENSE",
     "README.rdoc",
     "Rakefile",
     "lib/mongo_mapper_generators.rb",
     "lib/mongo_mapper_generators/version.rb",
     "rails_generators/embedded_model/USAGE",
     "rails_generators/embedded_model/embedded_model_generator.rb",
     "rails_generators/embedded_model/templates/embedded_model.rb",
     "rails_generators/embedded_model/templates/factory.rb",
     "rails_generators/embedded_model/templates/unit_test.rb",
     "rails_generators/mongo_initializer/USAGE",
     "rails_generators/mongo_initializer/mongo_initializer_generator.rb",
     "rails_generators/mongo_initializer/templates/database.yml",
     "rails_generators/mongo_initializer/templates/initializer.rb",
     "rails_generators/mongo_model/USAGE",
     "rails_generators/mongo_model/mongo_model_generator.rb",
     "rails_generators/mongo_model/templates/factory.rb",
     "rails_generators/mongo_model/templates/mongo_model.rb",
     "rails_generators/mongo_model/templates/unit_test.rb",
     "rails_generators/support/generator_helper.rb",
     "test/fixtures/tmp/test.log",
     "test/helper.rb",
     "test/shoulda_macros/generator_macros.rb",
     "test/stolen_from_railties.rb",
     "test/test_mongo_mapper_generators.rb"
  ]
  s.homepage = %q{http://github.com/spagalloco/mongo_mapper_generators}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Generators for use with the MongoMapper rubygem}
  s.test_files = [
    "test/helper.rb",
     "test/shoulda_macros/generator_macros.rb",
     "test/stolen_from_railties.rb",
     "test/test_mongo_mapper_generators.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 2.10.2"])
      s.add_development_dependency(%q<cucumber>, [">= 0.4.0"])
    else
      s.add_dependency(%q<shoulda>, [">= 2.10.2"])
      s.add_dependency(%q<cucumber>, [">= 0.4.0"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 2.10.2"])
    s.add_dependency(%q<cucumber>, [">= 0.4.0"])
  end
end


require 'rubygems'
require 'rake'

$LOAD_PATH.unshift 'lib'

begin
  require 'jeweler'
  require 'mongo_mapper_generators/version'
  
  Jeweler::Tasks.new do |gem|
    gem.name = "mongo_mapper_generators"
    gem.summary = %Q{Generators for use with the MongoMapper rubygem}
    gem.description = %Q{Generators for use with the MongoMapper rubygem.  Use to generate Documents, EmbeddedDocuments, and Rails initializer.}
    gem.email = "steve.agalloco@gmail.com"
    gem.homepage = "http://github.com/spagalloco/mongo_mapper_generators"
    gem.authors = ["Steve Agalloco"]
    gem.files = FileList["[A-Z]*", "{lib,rails_generators,test}/**/*"]
    gem.version = MongoMapperGenerators::VERSION
    
    gem.add_development_dependency "shoulda", ">= 2.10.2"
    gem.add_development_dependency "cucumber", ">= 0.4.0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

begin
  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new(:features)

  task :features => :check_dependencies
rescue LoadError
  task :features do
    abort "Cucumber is not available. In order to run features, you must: sudo gem install cucumber"
  end
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "mongo_mapper_generators #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

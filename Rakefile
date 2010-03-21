require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = 'crypto64'
    gem.summary = 'Encrypt and decrypt text of arbitrary length using RSA cyphers'
    gem.authors = '[Bart Teeuwisse]'
    gem.email = '<bart.teeuwisse@thecodemill.biz>'
    gem.description = <<-END
      Encrypt and decrypt text of arbitrary length using RSA cyphers.
      Extends the RSA class from the openssl library.
    END
    gem.homepage = 'http://github.com/bartt/crypto64'
    readmes = FileList.new('*') { |list| list.exclude(/[a-z]/) }.to_a
    gem.files = FileList['lib/**/*', 'bin/*', 'test/**/*', 'Rakefile'].to_a + readmes
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

task :spec => :check_dependencies

task :default => :spec

begin
  require 'yard'
  YARD::Rake::YardocTask.new
rescue LoadError
  task :yardoc do
    abort "YARD is not available. In order to run yardoc, you must: sudo gem install yard"
  end
end

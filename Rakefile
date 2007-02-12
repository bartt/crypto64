# -*- mode: ruby -*-
require 'rubygems'
Gem::manage_gems
require 'rake/gempackagetask'

# Packaging

require 'rake/gempackagetask'

spec = Gem::Specification.new do |spec|
  spec.name = 'crypto64'
  spec.summary = 'Encrypt and decrypt text of arbitrary length using RSA cyphers'
  spec.version = File.read('VERSION').strip
  spec.author = 'Bart Teeuwisse'
  spec.email = 'bart.teeuwisse@thecodemill.biz'
  spec.description = <<-END
      Encrypt and decrypt text of arbitrary length using RSA cyphers.  
      Extends the RSA class from the openssl library.
    END
  
  readmes = FileList.new('*') { |list| list.exclude(/[a-z]/) }.to_a
  spec.files = FileList['lib/**/*', 'bin/*', 'test/**/*', 'Rakefile'].to_a + readmes
  spec.homepage = 'http://thecodemill.biz/'
  spec.has_rdoc = false
  spec.test_files = FileList['test/**/*_test.rb'].to_a
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_zip     = true
  pkg.need_tar_gz  = true
  pkg.need_tar_bz2 = true
end

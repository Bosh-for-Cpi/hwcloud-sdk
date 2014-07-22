# coding: utf-8
require File.expand_path('../lib/requests/version', __FILE__)

# Copyright (c) 2009-2013 VMware, Inc.
# Copyright (c) 2012 Piston Cloud Computing, Inc.


Gem::Specification.new do |s|
  s.name        = 'hwcloud-sdk'
  s.version     = 1.0000.0
  s.platform    = Gem::Platform::RUBY
  s.summary     = 'Huawei Cloud SDK'
  s.description = "Huawei Cloud SDK\n#{`git rev-parse HEAD`[0, 6]}"
  s.author      = 'Huawei'
  s.homepage    = 'https://github.com/cloudfoundry/bosh'
  s.license     = 'Apache 2.0'
  s.email       = 'support@cloudfoundry.com'
  s.required_ruby_version = Gem::Requirement.new('>= 1.9.3')

  s.files        = Dir.glob("lib/**/*") + %w(README.md USAGE.md)
  s.require_path = 'lib'

  s.add_dependency('builder')
  s.add_dependency('excon', '~>0.25.0')
  s.add_dependency('formatador', '~>0.2.0')
  s.add_dependency('multi_json', '~>1.0')
  s.add_dependency('mime-types')
  s.add_dependency('net-scp', '~>1.1')
  s.add_dependency('net-ssh', '>=2.1.3')
  s.add_dependency('nokogiri', '~>1.5')
  s.add_dependency('ruby-hmac')

  ## List your development dependencies here. Development dependencies are
  ## those that are only needed during development
  s.add_development_dependency('rake')
  s.add_development_dependency('rspec', '~>1.3.1')
end

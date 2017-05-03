$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'taxamo/version'

spec = Gem::Specification.new do |s|
  s.name = 'taxamo-ns'
  s.version = Taxamo::VERSION
  s.summary = 'Ruby bindings for the Taxamo API (namespaced)'
  s.description = 'Taxamo provides a real-time Software as a Service (SaaS) solution for compliance with the new 2015 EU VAT rules on the sale of e-services. http://www.taxamo.com'
  s.authors = ['Tomek Lipski']
  s.email = ['tom@taxamo.com']
  s.homepage = 'https://www.taxamo.com/apidocs/index.html'
  s.license = 'Apache'

  s.add_dependency('addressable', '~> 2')
  s.add_dependency('typhoeus', '> 0.6.0')
  s.add_dependency('require_all', '~> 1.3.2')

  s.add_development_dependency('mocha', '~> 0.13.2')
  s.add_development_dependency('shoulda', '~> 3.4.0')
  s.add_development_dependency('test-unit')
  s.add_development_dependency('rake')

  s.files = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
end
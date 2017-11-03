lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'capistrano/pimcore5/version'

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-pimcore5'
  spec.version       = Capistrano::Pimcore5::VERSION
  spec.authors       = ['Mateusz Koszutowski']
  spec.email         = ['mkoszutowski@divante.pl']

  spec.summary       = 'Pimcore5 plugin for capistrano'
  spec.description   = 'Pimcore5 plugin for capistrano'
  spec.homepage      = 'https://github.com/DivanteLtd/capistrano-pimcore5'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'capistrano-composer', '~> 0.0', '>= 0.0.6'

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.48'
end

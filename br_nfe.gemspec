# -*- encoding: utf-8 -*-
require File.expand_path('../lib/br_nfe/version', __FILE__)

Gem::Specification.new do |gem|
	gem.name          = "br_nfe"
	gem.version       = BrNfe::Version::CURRENT
	gem.license       = "MIT"
	gem.description   = %q{BrNfe é uma gem para projetos Ruby on Rails que tem como objetifo facilitar e padronizar a emissão de Notas Fiscais eletrônicas}
	gem.summary       = %q{Emissão de Notas Fiscais Eletrônicas em Ruby}
	gem.authors       = ["Bruno M. Mergen"]
	gem.email         = ["brunomergen@gmail.com"]
	gem.homepage      = "https://github.com/Brunomm/br_nfe"
	
	gem.files         = `git ls-files`.split("\n").reject{|fil| 
		fil.include?('coverage/') ||
		fil.include?('exemplos/') 
	}
	gem.test_files    = `git ls-files -- test`.split("\n")
	# gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
	gem.require_paths = ["lib"]

	gem.required_ruby_version = ['~> 2.1', '~> 2.2', '~> 2.3']

	gem.add_dependency "rake", '~> 10'
	gem.add_dependency "activesupport"
	gem.add_dependency "activemodel"
	gem.add_dependency "nokogiri"
	gem.add_dependency "savon"
	gem.add_dependency "signer"
	gem.add_dependency "slim"
	gem.add_dependency "slim-rails"
	
	gem.add_development_dependency "pry", '~> 0.10'
end
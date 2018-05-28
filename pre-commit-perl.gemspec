# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "pre-commit-perl"
  spec.version       = '0.1.0'
  spec.authors       = ["Igor Yamolov"]
  spec.email         = ["clouster@yandex.ru"]

  spec.summary       = %q{Set pre-commit checks for Perl programming language}
  spec.description   = %q{Set pre-commit checks for Perl programming language}
  spec.homepage      = "https://github.com/t3hk0d3/pre-commit-perl"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "pre-commit", '~> 0.38'

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.7"
end

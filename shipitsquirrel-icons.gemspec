require_relative "lib/shipitsquirrel/icons/version"

Gem::Specification.new do |spec|
  spec.name          = "shipitsquirrel-icons"
  spec.version       = Shipitsquirrel::Icons::VERSION
  spec.authors       = [ "Adam Howell" ]
  spec.email         = [ "adamhowell@gmail.com" ]

  spec.summary       = "Inline SVG icons for Rails — Feather + ShipItSquirrel additions, drop-in feather_icon helper."
  spec.description   = <<~DESC
    A Rails view helper for rendering inline SVG icons. Ships the
    current Feather icon set with regular updates, plus a small set
    of additions specific to the ShipItSquirrel ecosystem.

    Originally based on rails_feather by Abeid Ahmed; modernized and
    maintained as part of the ShipItSquirrel family of dev tools.
  DESC
  spec.homepage      = "https://github.com/adamhowell/shipitsquirrel-icons"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.0"

  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"]   = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.files         = Dir["lib/**/*", "compressed/**/*", "LICENSE.txt", "README.md", "CHANGELOG.md"]
  spec.require_paths = [ "lib" ]

  spec.add_dependency "actionview", ">= 6.0"

  spec.add_development_dependency "rails", ">= 6.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end

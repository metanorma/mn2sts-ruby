require_relative 'lib/mn2sts/version'

Gem::Specification.new do |spec|
  spec.name          = "mn2sts"
  spec.version       = Mn2sts::VERSION
  spec.authors       = ["Ribose Inc."]
  spec.email         = ["open.source@ribose.com"]

  spec.summary       = "mn2sts converts Metanorma XML into NISO STS XML."
  spec.description   = <<~DESCRIPTION
    mn2sts converts Metanorma XML into NISO STS XML.
    This gem is a wrapper around mn2sts.jar available from
    https://github.com/metanorma/mn2sts, with versions matching the JAR file.
  DESCRIPTION

  spec.homepage      = "https://github.com/metanorma/mn2sts-ruby"
  spec.license       = "BSD-2-Clause"

  spec.bindir        = "bin"
  spec.require_paths = ["lib"]
  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {spec}/*`.split("\n")
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end

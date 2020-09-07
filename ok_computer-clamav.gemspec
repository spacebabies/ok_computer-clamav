
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ok_computer/clamav/version"

Gem::Specification.new do |spec|
  spec.name          = "ok_computer-clamav"
  spec.version       = OkComputer::Clamav::VERSION
  spec.license       = 'MIT'
  spec.authors       = ["Joost Baaij"]
  spec.email         = ["joost@spacebabies.nl"]

  spec.summary       = 'Monitor ClamAV using OK Computer'
  spec.description   = <<-EOF
    Monitor `clamd` from the luxury of your existing OkComputer setup!
    This check will make noise when the daemon does not respond to messages. It
    makes a socket connection, sends a PING and waits for a PONG. If any of that
    does not occur, you'll know it.
  EOF
  spec.homepage      = 'https://github.com/spacebabies/ok_computer-clamav'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'okcomputer', '>= 1.0.0'

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
end

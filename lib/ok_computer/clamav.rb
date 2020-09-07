require "ok_computer/clamav/version"
require "ok_computer/clamav/clamd_check"

module OkComputer
  # Monitors ClamAV anti-virus.
  module Clamav
    class Error < StandardError; end
  end
end

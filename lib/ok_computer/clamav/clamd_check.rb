module OkComputer
  module Clamav
    # This class performs a health check on a clamd instance using the
    # {PING command}[https://linux.die.net/man/8/clamd].
    #
    class ClamdCheck < OkComputer::Check
      attr_reader :socket_path

      # `socket_path`: the Unix socket path clamd is using.
      #
      # default: /var/run/clamav/clamd.ctl (Debian/Ubuntu)
      # homebrew on macOS uses /tmp/clamd.socket
      def initialize(socket_path:'/var/run/clamav/clamd.ctl')
        @socket_path = socket_path
      end

      def check
        socket = UNIXSocket.new(socket_path)
        socket.write "nPING\n"
        clamd_status = socket.readline
        socket.close

        if clamd_status != "PONG\n"
          mark_failure
          mark_message "clamd responded to PING with #{clamd_status}"
        else
          mark_message 'clamd is running and responds to PING'
        end
      end
    end
  end
end

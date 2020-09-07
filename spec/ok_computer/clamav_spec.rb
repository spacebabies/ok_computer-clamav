require 'spec_helper'

RSpec.describe OkComputer::Clamav do
  it "has a version number" do
    expect(OkComputer::Clamav::VERSION).not_to be nil
  end

  it "expects PING PONG on Unix socket" do
    socket = instance_double("UNIXSocket", readline: "PONG\n", close: nil)
    allow(UNIXSocket).to receive(:new) { socket }
    expect(socket).to receive(:write).with("nPING\n")
    OkComputer::Clamav::ClamdCheck.new.check
  end
end

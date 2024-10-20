class ElbLogParser < Formula
  desc "Simple AWS ELB log parser which parses Classic LB and ALB logs into JSONs"
  homepage "https://github.com/simnalamburt/elb-log-parser"
  url "https://github.com/simnalamburt/elb-log-parser/archive/refs/tags/v0.2.6.tar.gz"
  sha256 "33933432ca2a0869dae5185ff5a4e3d9c3a86bd6ac798be321c2f689a2947f8b"
  license "AGPL-3.0-or-later"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    generate_completions_from_executable(bin/"elb-log-parser", "completion")
  end
end

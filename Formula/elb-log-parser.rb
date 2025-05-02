class ElbLogParser < Formula
  desc "Simple AWS ELB log parser which parses Classic LB and ALB logs into JSONs"
  homepage "https://github.com/simnalamburt/elb-log-parser"
  url "https://github.com/simnalamburt/elb-log-parser/archive/refs/tags/v0.2.7.tar.gz"
  sha256 "02d6ae02f606688b20326ef3b0bb2edafc589dc177871c973af22934b764eaca"
  license "AGPL-3.0-or-later"
  head "https://github.com/simnalamburt/elb-log-parser.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    generate_completions_from_executable(bin/"elb-log-parser", "completion")
  end
end

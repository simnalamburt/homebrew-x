class ElbLogParser < Formula
  desc "Simple AWS ELB log parser which parses Classic LB and ALB logs into JSONs"
  homepage "https://github.com/simnalamburt/elb-log-parser"
  url "https://github.com/simnalamburt/elb-log-parser/archive/v0.2.1.tar.gz"
  sha256 "8554c5f571e3f6f29514cfabb788481f61b966d6020bbcd78a1d08a3254aaf4c"
  license "AGPL-3.0-or-later"

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/elb-log-parser-0.2.1"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "0c25d30543e3a660b96b0ca70f9892241ffbab9639999637b0e7718ff826de89"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end

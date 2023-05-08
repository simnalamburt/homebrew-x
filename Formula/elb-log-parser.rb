class ElbLogParser < Formula
  desc "Simple AWS ELB log parser which parses Classic LB and ALB logs into JSONs"
  homepage "https://github.com/simnalamburt/elb-log-parser"
  url "https://github.com/simnalamburt/elb-log-parser/archive/v0.1.2.tar.gz"
  sha256 "6294869c0f59880226f90753719028a253ba9753e3ec18e13776b82c61dc4eb2"
  license "AGPL-3.0-or-later"

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/elb-log-parser-0.1.2"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "e365ed8c043a603f7fe506814aecc13c4829824fcb8ce4fa8b0f8a53b794952f"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "28f9fefda18b462bc8728ac072404aac068b680f3449965bea69c34487379a87"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end

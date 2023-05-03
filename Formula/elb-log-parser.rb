class ElbLogParser < Formula
  desc "Simple AWS ELB log parser which parses Classic LB and ALB logs into JSONs"
  homepage "https://github.com/simnalamburt/elb-log-parser"
  url "https://github.com/simnalamburt/elb-log-parser/archive/v0.1.1.tar.gz"
  sha256 "4762a8a7dd8e946699358a0a8d26ffdec88996ccf509ecdcd54ff39814820940"
  license "AGPL-3.0-or-later"

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/elb-log-parser-0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "2a061150b551859009ec4dec8cd524e62e5ef9374a215f335368165c687295c4"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "0f9b5c78422325e63cb73fbe6a4ff8b03b04f79fb748b209dd1b8c4c41598ffd"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end

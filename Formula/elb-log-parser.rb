class ElbLogParser < Formula
  desc "Simple AWS ELB log parser which parses Classic LB and ALB logs into JSONs"
  homepage "https://github.com/simnalamburt/elb-log-parser"
  url "https://github.com/simnalamburt/elb-log-parser/archive/v0.1.1.tar.gz"
  sha256 "4762a8a7dd8e946699358a0a8d26ffdec88996ccf509ecdcd54ff39814820940"
  license "AGPL-3.0-or-later"

  # bottle do
  #   root_url "https://github.com/simnalamburt/homebrew-x/releases/download/elb-log-parser-0.1.1"
  #   sha256 cellar: :any_skip_relocation, arm64_ventura:  ""
  #   sha256 cellar: :any_skip_relocation, arm64_monterey: ""
  # end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end

class ElbLogParser < Formula
  desc "Simple AWS ELB log parser which parses Classic LB and ALB logs into JSONs"
  homepage "https://github.com/simnalamburt/elb-log-parser"
  url "https://github.com/simnalamburt/elb-log-parser/archive/v0.1.0.tar.gz"
  sha256 "743d4dc6bd789dd821a05ab0b4ef94994a4b27c63802ce68b050e86319d4a301"
  license "AGPL-3.0-or-later"

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/elb-log-parser-0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "c0c9d67aa2dda4b0d79d24da66e719fd56eb2df77689873f699192fcfbafea6d"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "5a380f3e431d0b464ba0d56de4504ec7c910db9f495f987593da088ece879630"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "build", *std_cargo_args
    bin.install "target/release/elb-log-parser"
  end
end

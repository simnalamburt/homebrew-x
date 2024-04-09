class ElbLogParser < Formula
  desc "Simple AWS ELB log parser which parses Classic LB and ALB logs into JSONs"
  homepage "https://github.com/simnalamburt/elb-log-parser"
  url "https://github.com/simnalamburt/elb-log-parser/archive/v0.2.3.tar.gz"
  sha256 "0caf5b3a0d8cdaac72c4147807e34deb68ed76846a96fff962c9ea33c187c4cf"
  license "AGPL-3.0-or-later"

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/elb-log-parser-0.2.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "623c545fbf9f170bdb8d5bf9a6f14d95192c95368a716b8cc4b86138c822f6ce"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end

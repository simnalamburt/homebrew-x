class ElbLogParser < Formula
  desc "Simple AWS ELB log parser which parses Classic LB and ALB logs into JSONs"
  homepage "https://github.com/simnalamburt/elb-log-parser"
  url "https://github.com/simnalamburt/elb-log-parser/archive/v0.2.2.tar.gz"
  sha256 "6d015751667592feab0f9eb1e3b0c1cc3220fbc440434cd83ffcb6c9cc05ed4e"
  license "AGPL-3.0-or-later"

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/elb-log-parser-0.2.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "23c063a5ee0874cca0d9a4fa56391ea2b2fc2e9dcc0d8747372d7548047ac47a"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end

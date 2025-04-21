class ElbLogParser < Formula
  desc "Simple AWS ELB log parser which parses Classic LB and ALB logs into JSONs"
  homepage "https://github.com/simnalamburt/elb-log-parser"
  url "https://github.com/simnalamburt/elb-log-parser/archive/refs/tags/v0.2.6.tar.gz"
  sha256 "33933432ca2a0869dae5185ff5a4e3d9c3a86bd6ac798be321c2f689a2947f8b"
  license "AGPL-3.0-or-later"
  head "https://github.com/simnalamburt/elb-log-parser.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/elb-log-parser-0.2.6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "63e412f935ac4371bbc29bd762963973d6db9d394050db0850e25d179a050324"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "5ce7a5f86befb0836c077387ce7e472d67cdd9f7ef71254788a1202af921fa62"
    sha256 cellar: :any_skip_relocation, ventura:       "46d4c3544843936cd9dbc57e3cccb77d714279ff1c7026c6ea347ce6d2e4d420"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e3cc7ce4d5efe5cd3995e411d7f052ffcadda009f9661536a40a34a72fca2924"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    generate_completions_from_executable(bin/"elb-log-parser", "completion")
  end
end

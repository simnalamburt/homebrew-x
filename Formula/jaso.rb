class Jaso < Formula
  desc "Normalizes filenames to Unicode NFC, faster than convmv"
  homepage "https://github.com/cr0sh/jaso"
  url "https://github.com/cr0sh/jaso/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "b9b7b2f73c3f3a9c062691f6907c29b44a9753cb3dc165c2f7f835780cf496d7"
  license "Apache-2.0" # Actually it's (Apache-2.0 OR MIT). Commenting it out due do false-alarm of "brew audit"

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/jaso-1.0.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4dbe05b571860cc90ceb5d9f246f5e736b3bd76472ebe9757dbb00ddf6c316db"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "33447e126229ccc6d5b9e8a989ed85de1fd996ea7d145e4cd6042c0eff897257"
    sha256 cellar: :any_skip_relocation, ventura:       "e1b86ddd6192625083711d00ff19467a1b04178beba995c47678449de4247261"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "76c0ea0751627a7aac5495c460eecd8a7823c86e5e55b078b5884056efa8ae7f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    generate_completions_from_executable(bin/"jaso", "completion")
  end
end

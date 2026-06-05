class Totp < Formula
  desc "Simple TOTP CLI, powered by keychain of macOS"
  homepage "https://github.com/simnalamburt/macos-totp-cli"
  url "https://github.com/simnalamburt/macos-totp-cli/archive/refs/tags/v1.1.4.tar.gz"
  sha256 "c70057bfc159e79509c46ffa33af460844b7a1733765a22c4ac5faf6e20fdf10"
  license "Apache-2.0" # Actually it's (Apache-2.0 OR MIT). Commenting it out due to false-alarm of "brew audit"
  head "https://github.com/simnalamburt/macos-totp-cli.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/totp-1.1.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "16e7fc379dfd4414d09cf17e025361c6662c84a8ffea740f109fb1a1af6ab3c6"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3ea4fde237f9c44688072d0d44935b61f74354760e0a962100c3fbb27100e20e"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "54374f4ee68f6eb68eef66e33642f0377c272513d80b3cc1cc2f270e3249bac1"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")

    generate_completions_from_executable(bin/"totp", "completion")
  end
end

class Totp < Formula
  desc "Simple TOTP CLI, powered by keychain of macOS"
  homepage "https://github.com/simnalamburt/macos-totp-cli"
  url "https://github.com/simnalamburt/macos-totp-cli/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "b95ff20c80f0aa9ee7fa858ca0d85dcb2f24bfbee7940c59495b561dd04a875e"
  license "Apache-2.0" # Actually it's (Apache-2.0 OR MIT). Commenting it out due do false-alarm of "brew audit"

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/totp-1.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "efa21e36728a432fc18cdfb8d5c6b11c07d8475090011dfc93c05b2ce8acc64f"
    sha256 cellar: :any_skip_relocation, ventura:       "346a682d7d47a937e98d8464fa01b1f7f3a3c5976ac0c1c294d4fcf988b44d44"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end
end

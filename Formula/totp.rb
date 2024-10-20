class Totp < Formula
  desc "Simple TOTP CLI, powered by keychain of macOS"
  homepage "https://github.com/simnalamburt/macos-totp-cli"
  url "https://github.com/simnalamburt/macos-totp-cli/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "0ee00a72909a837ec9570672d2b30368ef16c38f62cc986675a930b608248408"
  license "Apache-2.0" # Actually it's (Apache-2.0 OR MIT). Commenting it out due do false-alarm of "brew audit"

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/totp-1.1.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "49fba7a90a7c96c5ce76e6891a5edcb917abc22ff5119c5eaf154d1efec8b5e3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "e5beb62ee873da6a56eddf74e09604836a091920c9182aa9541c937be222fe53"
    sha256 cellar: :any_skip_relocation, ventura:       "633808078ac358abf87d92727b0e7af1bf6e4340ab031d02df422a0863a8002e"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")

    generate_completions_from_executable(bin/"totp", "completion")
  end
end

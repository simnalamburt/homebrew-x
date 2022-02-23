class Totp < Formula
  desc "Simple TOTP CLI, powered by keychain of macOS"
  homepage "https://github.com/simnalamburt/macos-totp-cli"
  url "https://github.com/simnalamburt/macos-totp-cli/archive/v1.0.0.tar.gz"
  version "1.0.0"
  sha256 "afb947ac9b0cb227a302e81f6faf1f9c8bbadc169bba2445d9104cbb7200eeb2"
  license "Apache-2.0" # Actually it's (Apache-2.0 OR MIT). Commenting it out due do false-alarm of "brew audit"

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/totp-1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "9f95f6e26b5e6f53e24367d78dabf4eed989cb32f965cda4d4334e6845e0f2fe"
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "totp"
    bin.install "totp"
  end
end

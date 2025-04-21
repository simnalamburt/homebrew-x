class Totp < Formula
  desc "Simple TOTP CLI, powered by keychain of macOS"
  homepage "https://github.com/simnalamburt/macos-totp-cli"
  url "https://github.com/simnalamburt/macos-totp-cli/archive/refs/tags/v1.1.3.tar.gz"
  sha256 "62f6febc7c5d6d6892d07aa39e383c2c4a26dcf985a00f89728b27983ee27079"
  license "Apache-2.0" # Actually it's (Apache-2.0 OR MIT). Commenting it out due to false-alarm of "brew audit"

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/totp-1.1.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4290ed20ab29c41c4e5fbfd9f2309c6dcd4179155e9b3c77b9d0154d0743b502"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "058a39e379be8f7e92153cfe72f1e015481feef3226f55f6822bce24db91edc8"
    sha256 cellar: :any_skip_relocation, ventura:       "f939f2d770ab089fd15453b05a24cd89a135db87a24555298188dfb1b168c704"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")

    generate_completions_from_executable(bin/"totp", "completion")
  end
end

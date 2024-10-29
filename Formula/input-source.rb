class InputSource < Formula
  desc "Tiny input source manager for macOS"
  homepage "https://github.com/simnalamburt/macos-input-source"
  url "https://github.com/simnalamburt/macos-input-source/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "3f72241e37539676f19d4942d757a0dcf3b37a38ddfa0f0bb49fb893bc909c94"
  license "Apache-2.0" # Actually it's (Apache-2.0 OR MIT). Commenting it out due do false-alarm of "brew audit"

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/input-source-0.1.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fd589ca7e1eb3b4cd6b6e6f24a0087dfd4526ec6a1bdf832dbfcb301177ddbc2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "e84997970d24c2b9397adacfd97fde2179d87ee176af22014025d7ede4141ee0"
    sha256 cellar: :any_skip_relocation, ventura:       "a83f0215f7e03fa78812398256b4a4c23bc6dea8f5a77cd264bb5dec8e0f759b"
  end

  depends_on "zig" => :build
  depends_on :macos

  def install
    system "zig", "build"

    # Pick binary from ./zig-out/bin/input-source
    bin.install "zig-out/bin/input-source"
  end
end

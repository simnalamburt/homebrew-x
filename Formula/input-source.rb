class InputSource < Formula
  desc "Tiny input source manager for macOS"
  homepage "https://github.com/simnalamburt/macos-input-source"
  url "https://github.com/simnalamburt/macos-input-source/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "3f72241e37539676f19d4942d757a0dcf3b37a38ddfa0f0bb49fb893bc909c94"
  license "Apache-2.0" # Actually it's (Apache-2.0 OR MIT). Commenting it out due do false-alarm of "brew audit"

  depends_on "zig" => :build
  depends_on :macos

  def install
    system "zig", "build"

    # Pick binary from ./zig-out/bin/input-source
    bin.install "zig-out/bin/input-source"
  end
end

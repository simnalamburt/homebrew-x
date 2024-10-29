class InputSource < Formula
  desc "Tiny input source manager for macOS"
  homepage "https://github.com/simnalamburt/macos-input-source"
  url "https://github.com/simnalamburt/macos-input-source/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "f90e522d3f6175e50f10bafd6ae44a80624029a46c68628719393f65f87bac07"
  license "Apache-2.0" # Actually it's (Apache-2.0 OR MIT). Commenting it out due do false-alarm of "brew audit"

  depends_on "zig" => :build
  depends_on :macos

  def install
    system "zig", "build"

    # Pick binary from ./zig-out/bin/input-source
    bin.install "zig-out/bin/input-source"
  end
end

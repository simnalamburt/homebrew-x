class InputSource < Formula
  desc "Tiny input source manager for macOS"
  homepage "https://github.com/simnalamburt/macos-input-source"
  url "https://github.com/simnalamburt/macos-input-source/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "f90e522d3f6175e50f10bafd6ae44a80624029a46c68628719393f65f87bac07"
  license "Apache-2.0" # Actually it's (Apache-2.0 OR MIT). Commenting it out due to false-alarm of "brew audit"

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/input-source-0.1.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e41bd4726533a2c2e6011b155f463a978e902bb7d8f0adcf286b7a7d74d21c6e"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "a0e3bc5e3742d9884d95cb58cc37d64956f053150d97f35e208aa0077fb916d9"
    sha256 cellar: :any_skip_relocation, ventura:       "9de4c382ea183e7e529f294f5ce6a8e810363cfcd57d6c76661b688443f6c60b"
  end

  depends_on "zig" => :build
  depends_on :macos

  def install
    system "zig", "build"

    # Pick binary from ./zig-out/bin/input-source
    bin.install "zig-out/bin/input-source"
  end
end

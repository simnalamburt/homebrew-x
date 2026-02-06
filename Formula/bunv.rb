class Bunv < Formula
  desc "Corepack for Bun. PoC for implementing version management inside bun itself"
  homepage "https://github.com/aklinker1/bunv"
  url "https://github.com/aklinker1/bunv/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "71e148c9d2cede8812303fa9dd961a88ff2fcd32710134758dd0b4c6f3693e70"
  license "MIT"
  head "https://github.com/aklinker1/bunv.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "zig@0.15" => :build

  conflicts_with "oven-sh/bun/bun", because: "both install `bun` binaries"

  def install
    system "zig", "build", *std_zig_args
  end
end

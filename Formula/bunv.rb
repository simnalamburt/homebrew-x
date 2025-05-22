class Bunv < Formula
  desc "Corepack for Bun. PoC for implementing version management inside bun itself"
  homepage "https://github.com/aklinker1/bunv"
  url "https://github.com/aklinker1/bunv/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "7094392bd0c756a3de3daf07d53fa45ec96316c7328b1fe9635987da88914ffc"
  license "MIT"
  head "https://github.com/aklinker1/bunv.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/bunv-0.4.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "90353157aab6b87738ed7db9c28621481c5d02c1ee32e4f7dcd09b73b30b5fc7"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "70772742e207c02ec84489cab08dee05c4fa8e5ba392ca384d69b8c2fb712bb2"
    sha256 cellar: :any_skip_relocation, ventura:       "d68975456a00124b5ed40eab040d876dfb46cb95aa92236779ee1718ed0a062e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "9b966263fd115c7adf834c2ffa787cce14831af19fa152ed9aed7db32a6b3236"
  end

  depends_on "zig" => :build

  conflicts_with "oven-sh/bun/bun", because: "both install `bun` binaries"

  def install
    system "zig", "build", *std_zig_args
  end
end

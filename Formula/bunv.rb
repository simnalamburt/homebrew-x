class Bunv < Formula
  desc "Corepack for Bun. PoC for implementing version management inside bun itself"
  homepage "https://github.com/aklinker1/bunv"
  url "https://github.com/aklinker1/bunv/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "9d9fd565dd89ff4996522b1b10614acf09947adb729d3a0a137e1899912bf629"
  license "MIT"
  head "https://github.com/aklinker1/bunv.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/bunv-0.4.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a80f6f17cf9d17dc73da19ee007a8fcd8d695881787a13da4b6ae68f93c2ea56"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "da3ca6963fb41edc311f49a7d269e71a9aa1a2d0c1e140c17babdd542f0b9e56"
    sha256 cellar: :any_skip_relocation, ventura:       "2888ca327b46c55728c442f09b156161431284816b7101251ea9dc677260eb14"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "aef89ba145db8a9189add814bd01002b4375d150a9d58d37642b51b58923205d"
  end

  depends_on "zig" => :build

  conflicts_with "oven-sh/bun/bun", because: "both install `bun` binaries"

  def install
    system "zig", "build", *std_zig_args
  end
end

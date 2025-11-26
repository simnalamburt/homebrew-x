class Bunv < Formula
  desc "Corepack for Bun. PoC for implementing version management inside bun itself"
  homepage "https://github.com/aklinker1/bunv"
  url "https://github.com/aklinker1/bunv/archive/refs/tags/v0.4.3.tar.gz"
  sha256 "e2415221171c967607cc41160f503778257641c285510777f2655e3574b39d92"
  license "MIT"
  head "https://github.com/aklinker1/bunv.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/bunv-0.4.3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ffb33654dee1edade565ab3dff5221a47d92b76bdde962176e98dc7ee7bb935d"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "e1825503f03fde26eff14182356ee76acd6cb07bfbad038f15c4ce11387a18d3"
    sha256 cellar: :any_skip_relocation, ventura:       "f8cd8e2dd74dbefcbaf49680bc7a6544f2272b5e0b24b61b1fa38fc38e62ff24"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "960650e4e04633db4033ffd59cba7c3eb56846a1d7d33f89264422670eaedecc"
  end

  depends_on "zig@0.14" => :build

  conflicts_with "oven-sh/bun/bun", because: "both install `bun` binaries"

  def install
    system "zig", "build", *std_zig_args
  end
end

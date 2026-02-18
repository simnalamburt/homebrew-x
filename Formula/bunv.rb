class Bunv < Formula
  desc "Corepack for Bun. PoC for implementing version management inside bun itself"
  homepage "https://github.com/aklinker1/bunv"
  url "https://github.com/aklinker1/bunv/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "a9bba1e12f85055c30fb446f36fe16d6cf75e38e6a1b787e4467c5b62aa02f83"
  license "MIT"
  head "https://github.com/aklinker1/bunv.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/bunv-0.5.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "4e2a890488b688c01ba4cb21bc687039ddcf4395e6098ace97ff9c8463fe4544"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7200ec12a2114aafaa5ff98cd4bea89068ae17a3647a27d3cfdda3574f0b605c"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "fc12055f2c89aafcca9695bb349cd52e31e01879cac73665164fa97d6bd3793c"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "a16d13fecea2a1d24e541f75bc224eb24bb0f9153b7d8c14f7c9a32fb029c796"
  end

  depends_on "zig@0.15" => :build

  conflicts_with "oven-sh/bun/bun", because: "both install `bun` binaries"

  def install
    system "zig", "build", *std_zig_args
  end
end

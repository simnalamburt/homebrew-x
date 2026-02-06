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

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/bunv-0.5.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "d72b74a0fb230cdd39cb5c3e73c11648dadfe5c99398f79572d908699ebecc63"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "59dc5aabb42f87a791eebf0141002cbf8ce6141228fc4f67f15ed69ee47c2a99"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "a4450a7c8add2c8faf4fa8f9e1838be57186c7d91b491422e218a941e1b28e08"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "122c05140fb84ebdd06656a49805f2d1316cb8529dffc675db3fc89dc16972d8"
  end

  depends_on "zig@0.15" => :build

  conflicts_with "oven-sh/bun/bun", because: "both install `bun` binaries"

  def install
    system "zig", "build", *std_zig_args
  end
end

class Bunv < Formula
  desc "Corepack for Bun. PoC for implementing version management inside bun itself"
  homepage "https://github.com/aklinker1/bunv"
  url "https://github.com/aklinker1/bunv/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "9a75ecd5834c8be1d8c783934823460df745ffed359be8057f83d96b42eefd5d"
  license "MIT"

  livecheck do
    url "https://github.com/aklinker1/bunv/releases/latest"
    regex(%r{href=.*?/tag/v?(\d+(?:\.\d+)+)["' >]}i)
  end

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/bunv-0.3.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7bc3ee5a6da8a30e106680aaad5065e23308ff7b49b1f6813834bec125e0c22d"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "143a0a7e7ae2422e6b424a2e718688c698c2d1bbb69404a7db0c9d5e2a191b60"
    sha256 cellar: :any_skip_relocation, ventura:       "4ed846d14766bf60dc614cda769ff062e215f70d4eb54407943c7fff93698ee2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "4479e8bf1539562f4f296dc8e2700f71e588bc7c58931f4345e8950b8dd06d96"
  end

  depends_on "zig" => :build

  conflicts_with "oven-sh/bun/bun", because: "both install `bun` binaries"

  # NOTE: https://github.com/aklinker1/bunv/pull/13
  patch do
    url "https://github.com/aklinker1/bunv/commit/0299a0523090bcb9212999df0eb28a8902891462.patch?full_index=1"
    sha256 "cbbe18a13e24f03b7670815b17ef3a33405a3e9970ca97c659d7bcdd19b9a213"
  end

  def install
    system "zig", "build", *std_zig_args
  end

  # NOTE: https://github.com/aklinker1/bunv/issues/14
  def caveats
    <<~EOS
      You should create bunv's working directory if it doesn't exist:
        mkdir ~/.bunv
    EOS
  end
end

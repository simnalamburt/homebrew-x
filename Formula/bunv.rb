class Bunv < Formula
  desc "Corepack for Bun. PoC for implementing version management inside bun itself"
  homepage "https://github.com/aklinker1/bunv"
  url "https://github.com/aklinker1/bunv/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "9a75ecd5834c8be1d8c783934823460df745ffed359be8057f83d96b42eefd5d"
  license "MIT"

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

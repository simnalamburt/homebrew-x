class RaMultiplex < Formula
  desc "Share one rust-analyzer instance between multiple LSP clients to save resources"
  homepage "https://github.com/pr2502/ra-multiplex"
  url "https://github.com/pr2502/ra-multiplex/archive/refs/tags/v0.2.5.tar.gz"
  sha256 "c24a7e277adce9bbfb86641905d75f166e46459cf4e5b5f3aaa7456b052392dc"
  license "MIT"

  bottle do
    rebuild 1
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end

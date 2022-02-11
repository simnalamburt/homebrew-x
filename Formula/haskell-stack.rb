class HaskellStack < Formula
  desc "Cross-platform program for developing Haskell projects"
  homepage "https://haskellstack.org/"
  url "https://github.com/simnalamburt/stack/archive/refs/tags/v2.7.3-apple-silicon.tar.gz"
  version "2.7.3"
  sha256 "8ea37338dee73e5812e3ebb121d9c602fcf3936c090ecbdb603fce5997fee577"
  license "BSD-3-Clause"
  head "https://github.com/commercialhaskell/stack.git", branch: "master"

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/haskell-stack-2.7.3"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "961ceddad4eddd9612418373e3c5d4e2378788027a90781f645bbf2822914dde"
  end

  depends_on "cabal-install" => :build
  depends_on "ghc" => :build

  uses_from_macos "zlib"

  def install
    system "cabal", "v2-update"
    system "cabal", "v2-install", *std_cabal_v2_args
  end

  test do
    system bin/"stack", "new", "test"
    assert_predicate testpath/"test", :exist?
    assert_match "# test", File.read(testpath/"test/README.md")
  end
end

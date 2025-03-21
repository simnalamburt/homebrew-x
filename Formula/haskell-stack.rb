class HaskellStack < Formula
  desc "Cross-platform program for developing Haskell projects"
  homepage "https://haskellstack.org/"
  license "BSD-3-Clause"

  stable do
    url "https://github.com/commercialhaskell/stack/archive/refs/tags/v2.7.3.tar.gz"
    sha256 "37f4bc0177534782609ec3a67ec413548d3f2cabff7c4c0bc8a92a36e49c6877"

    # - Fixed building from source.
    #
    #   Due to recent update of aeson-2.0.0.0, stack can no longer be built
    #   with cabal-install. So I patched stack to freeze cabal dependencies
    #   using stackage 17.15 LTS.
    #
    # - Add Apple Silicon support.
    #
    #   HEAD version of stack has already been patched to support Apple
    #   Silicon. However, the next release containing that patch hasn't
    #   release yet. So I manually patched stack v2.7.3 to support Apple
    #   Silicon.
    #
    # Reference:
    #   https://github.com/commercialhaskell/stack/pull/5562
    #   https://github.com/commercialhaskell/stack/pull/5677
    patch do
      url "https://github.com/commercialhaskell/stack/compare/7927a3ae..32b80476.patch?full_index=1"
      sha256 "8e87e3f3409cf1427b46124586536c91f94dde4c27d2708764604c24c4ea98d7"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/haskell-stack-2.7.3"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_monterey: "ccab992d98a6403da04ce780fbcea33195ef50afccf527d419f16b817f873700"
    sha256 cellar: :any_skip_relocation, big_sur:        "5e9185c5fb43ee4aa892bd5e9460fba19874c741df8cb0791af25ec7dab40575"
    sha256 cellar: :any_skip_relocation, catalina:       "eff4da14356490588c31bbdf4d327605c5209957956d2964eb42e65bb9f687ba"
    sha256 cellar: :any_skip_relocation, mojave:         "f57fdcf4118acc46b507b6e091f8898f9f1200f5041d20460ac97cc57fe21364"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "1c0e6d39df1e8c28c0ed815df4a2f02a3e302a758fb9dade1aaf3d13212ce5ad"
  end

  head do
    url "https://github.com/commercialhaskell/stack.git", branch: "master"

    # Due to aeson-2.0.0.0 update, stack can no longer be built with cabal.
    # Dependencies freezing is required to build stack with cabal.
    #
    # Reference: https://github.com/commercialhaskell/stack/pull/5677
    patch do
      url "https://github.com/commercialhaskell/stack/commit/b2a2e56c.patch?full_index=1"
      sha256 "43c59b4af52e372cf4af14514f1c89b62bc450171eed344aeed46e2d9d9c0d96"
    end
  end

  disable! date: "2025-03-21", because: "is no longer needed due to official upstream support for Apple Silicon", \
    replacement: "haskell-stack"

  depends_on "cabal-install" => :build
  depends_on "ghc" => :build
  # GHC 8.10.7 user manual recommend use LLVM 9 through 12
  # https://downloads.haskell.org/~ghc/8.10.7/docs/html/users_guide/8.10.7-notes.html
  # and we met some unknown issue w/ LLVM 13 before https://gitlab.haskell.org/ghc/ghc/-/issues/20559
  # so conservatively use LLVM 12 here
  depends_on "llvm@12" if Hardware::CPU.arm?

  uses_from_macos "zlib"

  def install
    system "cabal", "v2-update"
    system "cabal", "v2-install", *std_cabal_v2_args

    bin.env_script_all_files libexec, PATH: "${PATH}:#{Formula["llvm@12"].opt_bin}" if Hardware::CPU.arm?
  end

  test do
    system bin/"stack", "new", "test"
    assert_path_exists testpath/"test"
    assert_match "# test", File.read(testpath/"test/README.md")
  end
end

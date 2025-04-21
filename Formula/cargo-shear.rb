class CargoShear < Formula
  desc "Detect and remove unused dependencies from `Cargo.toml` in Rust projects"
  homepage "https://github.com/Boshen/cargo-shear"
  url "https://github.com/Boshen/cargo-shear/archive/refs/tags/v1.2.4.tar.gz"
  sha256 "18d5ae6f2c1f85d0604e764eb1d1802c82c5657176bf54388ee7d65e2ee904c4"
  license "MIT"
  head "https://github.com/Boshen/cargo-shear.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/cargo-shear-1.2.4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "809002f344643ffd9ccb90b3f70dde0a6b8644e3bc9fbc7828aed9d24d8dd63c"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "a3a26db96a04e958c5ce9a991507c97b951d71428919741dc718aa9a74f5f684"
    sha256 cellar: :any_skip_relocation, ventura:       "feba090a0c2decc1e9fc7c841628bb22882f9258513106582ce81a686377a5e6"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "1e5a8c6d29e924efc3543ebf0aaacd678095114d70005e9c227b5cfc6d59ab6e"
  end

  depends_on "rust" => :build
  depends_on "rustup" => :test

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    # Show that we can use a different toolchain than the one provided by the `rust` formula.
    # https://github.com/Homebrew/homebrew-core/pull/134074#pullrequestreview-1484979359
    ENV.prepend_path "PATH", Formula["rustup"].bin
    system "rustup", "set", "profile", "minimal"
    system "rustup", "default", "beta"

    crate = testpath/"demo-crate"
    mkdir crate do
      (crate/"Cargo.toml").write <<~TOML
        [package]
        name = "demo-crate"
        version = "0.1.0"

        [lib]
        path = "lib.rs"

        [dependencies]
        libc = "0.1"
        bear = "0.2"
      TOML

      (crate/"lib.rs").write "use libc;"

      output = shell_output("cargo shear", 1)
      # bear is unused
      assert_match <<~OUTPUT, output
        demo-crate -- Cargo.toml:
          bear
      OUTPUT
    end
  end
end

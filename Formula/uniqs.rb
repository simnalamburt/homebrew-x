class Uniqs < Formula
  desc "Rust uniq(1) alternative with streaming support"
  homepage "https://github.com/simnalamburt/uniqs"
  url "https://github.com/simnalamburt/uniqs/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "8738f3eadfd708152d398a9ae7ba7a0a259eb3101d4986638eaa3b24ec4382c0"
  license "Apache-2.0" # Actually it's (Apache-2.0 OR MIT) but `brew audit` doesn't support dual licensing
  head "https://github.com/simnalamburt/uniqs.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/uniqs-0.1.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a68b33aa6b5b44f7321ac05f0a38b8e679660d97c5cb93bd895fe08c1e0f8e8c"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "430745ff5b357684d59ba7fc69deb78fa245651259b102649cc15661d183512b"
    sha256 cellar: :any_skip_relocation, ventura:       "14d7ff1bb55c58899798f1250e2749f62635efdb18417eb08c7d5b6661e843c9"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "d1a0b5810383c31e276f4df925bf9c59e996130f8e4565cc59cbe0b9e48698b6"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    generate_completions_from_executable(bin/"uniqs", "completion")
  end
end

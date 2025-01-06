class Uniqs < Formula
  desc "Rust uniq(1) alternative with streaming support"
  homepage "https://github.com/simnalamburt/uniqs"
  url "https://github.com/simnalamburt/uniqs/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "8738f3eadfd708152d398a9ae7ba7a0a259eb3101d4986638eaa3b24ec4382c0"
  license "Apache-2.0" # Actually it's (Apache-2.0 OR MIT) but `brew audit` doesn't support dual licensing

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    generate_completions_from_executable(bin/"uniqs", "completion")
  end
end

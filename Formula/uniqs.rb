class Uniqs < Formula
  desc "Rust uniq(1) alternative with streaming support"
  homepage "https://github.com/simnalamburt/uniqs"
  url "https://github.com/simnalamburt/uniqs/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "0721253f5585621071c8e621ff0b30901373e19ff18f8c1220ad4f1338c1fe08"
  license "Apache-2.0" # Actually it's (Apache-2.0 OR MIT) but `brew audit` doesn't support dual licensing

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    generate_completions_from_executable(bin/"uniqs", "completion")
  end
end

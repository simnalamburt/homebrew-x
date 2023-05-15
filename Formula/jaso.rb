class Jaso < Formula
  desc "Normalizes filenames into Unicode NFC form"
  homepage "https://github.com/cr0sh/jaso"
  url "https://github.com/cr0sh/jaso/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "b253bbc0f1a17cf91fe4f3aba96a4554e28921b3e1988d1af3d8adfe65f0e18a"

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/jaso-0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "9c223a68947f0d69d3c737f49ecb3ce1093c1de834bb9bb5812701186148953f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end

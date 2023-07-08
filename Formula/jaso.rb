class Jaso < Formula
  desc "Normalizes filenames into Unicode NFC form"
  homepage "https://github.com/cr0sh/jaso"
  url "https://github.com/cr0sh/jaso/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "72815436bb7a440ac53b3f79509756807e369be6082788aae40b4a00a92ad283"

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/jaso-1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "a473df6b23b17146133971b0277a49f5ad21cd0703eeeb9b02e503e3a844c005"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end

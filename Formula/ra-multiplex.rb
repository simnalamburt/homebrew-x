class RaMultiplex < Formula
  desc "Share one rust-analyzer instance between multiple LSP clients to save resources"
  homepage "https://github.com/pr2502/ra-multiplex"
  url "https://github.com/pr2502/ra-multiplex/archive/refs/tags/v0.2.5.tar.gz"
  sha256 "c24a7e277adce9bbfb86641905d75f166e46459cf4e5b5f3aaa7456b052392dc"
  license "MIT"

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/ra-multiplex-0.2.5"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b73507838ad700a5b7641f19d0252b330a83a84ec4ee088801b727ad2e505bb6"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "36ad6bf261a3343336cf687c8569ddfd4fe625d53c4ca490e05c3e418133bbb3"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end

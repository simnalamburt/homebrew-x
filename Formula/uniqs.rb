class Uniqs < Formula
  desc "`uniq(1)` alternative with streaming support"
  homepage "https://github.com/simnalamburt/uniqs"
  url "https://github.com/simnalamburt/uniqs/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "cf2e4768d3d558d8f5f26cdd28dd654b8699d9b7718ba7339f3b86ef97683d88"
  license "Apache-2.0" # Actually it's (Apache-2.0 OR MIT) but `brew audit` doesn't support dual licensing

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/uniqs-0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "01c6029435ecb21b3c33add3442a59a7d37926ee929689c8a2dcd29b3f322bc7"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end

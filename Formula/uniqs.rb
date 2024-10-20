class Uniqs < Formula
  desc "Rust uniq(1) alternative with streaming support"
  homepage "https://github.com/simnalamburt/uniqs"
  url "https://github.com/simnalamburt/uniqs/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "0721253f5585621071c8e621ff0b30901373e19ff18f8c1220ad4f1338c1fe08"
  license "Apache-2.0" # Actually it's (Apache-2.0 OR MIT) but `brew audit` doesn't support dual licensing

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/uniqs-0.1.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "60e0d0be9742e43b82e9693e0c2d3289323b8a2865376962fb79d3d48e850256"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "6d17cb9bed5dae57bbb975a279182a52ec73a6c91bfaa261c14ed9681ff80ced"
    sha256 cellar: :any_skip_relocation, ventura:       "47b5b17c7ec2c5e4d451fb8d922757e5d9ef1057eb82c2d8757da3593bf955cf"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "61f5c29d05ad2eba7853453760e67822dffcfb306319cffcd45a92636b7eb083"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    generate_completions_from_executable(bin/"uniqs", "completion")
  end
end

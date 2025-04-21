class CargoCriterion < Formula
  # NOTE: cargo-criterion is not being actively maintained, so I'm not going to
  # submit it to homebrew-core.
  desc "Cargo plugin which handles analyzing and reporting on Criterion-rs benchmarks"
  homepage "https://github.com/bheisler/cargo-criterion"
  url "https://github.com/bheisler/cargo-criterion/archive/refs/tags/1.1.0.tar.gz"
  sha256 "fe156bf7b360874419f7a97349c9f2fa94ab5fd6dc2c06b0070053f9d5596445"
  license "Apache-2.0" # Actually it's (Apache-2.0 OR MIT). Commenting it out due to false-alarm of "brew audit"
  head "https://github.com/bheisler/cargo-criterion.git", branch: "main"

  livecheck do
    url :stable
    strategy :git
  end

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/cargo-criterion-1.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "05b4abdc05168d24a4e1f8a2b65f12a6c630da959a4b89fc7b1fbc70c7bdb67f"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "e0a178ce2953a4c733fcf777faf55eb7f275ce8425a490bffa7ab69e45f7d074"
    sha256 cellar: :any_skip_relocation, ventura:       "30f3970ef5a08515cfbb5b4777b1314d77428eb3f9a4a552406b3edc2332946b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "0183a3c7a2b5d330ffd37fad343103a24f04bbc8da7bab706a46ff3a53be792f"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end

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

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end

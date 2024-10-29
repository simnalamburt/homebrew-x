class Jaso < Formula
  desc "Normalizes filenames to Unicode NFC, faster than convmv"
  homepage "https://github.com/cr0sh/jaso"
  url "https://github.com/cr0sh/jaso/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "b9b7b2f73c3f3a9c062691f6907c29b44a9753cb3dc165c2f7f835780cf496d7"
  license "Apache-2.0" # Actually it's (Apache-2.0 OR MIT). Commenting it out due do false-alarm of "brew audit"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    generate_completions_from_executable(bin/"jaso", "completion")
  end
end

class Jaso < Formula
  desc "Normalizes filenames to Unicode NFC, faster than convmv"
  homepage "https://github.com/cr0sh/jaso"
  url "https://github.com/cr0sh/jaso/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "72815436bb7a440ac53b3f79509756807e369be6082788aae40b4a00a92ad283"
  license "Apache-2.0" # Actually it's (Apache-2.0 OR MIT). Commenting it out due do false-alarm of "brew audit"

  bottle do
    root_url "https://github.com/simnalamburt/homebrew-x/releases/download/jaso-1.0.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1d86d89af805e4cf017d98327743845e3eb8384a347f391f3affe843641911da"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "5e935a0ae3e5bc313958b539c189fbc9011ecc13317ea5b1adc436fa57b3c4cd"
    sha256 cellar: :any_skip_relocation, ventura:       "1b7130049ad249b875ffe21463af4cf767acdfaf0f93f972462ebd436e7245a6"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "c5d99b4a17be15c0acd4125ca11a263cfd56f9d5167a50cdac11e620a9369233"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end
end

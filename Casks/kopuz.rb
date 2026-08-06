cask "kopuz" do
  version "0.14.0"
  sha256 "dd38a2639e1f36183f528aead64039c4aaf515abec69da78fe2f2dc1ffcafec7"

  url "https://github.com/Kopuz-org/kopuz/releases/download/v#{version}/Kopuz_#{version}_aarch64.dmg"
  name "Kopuz"
  desc "Fast, lightweight music player for everyday listening"
  homepage "https://kopuz.moe/"

  livecheck do
    url "https://github.com/Kopuz-org/kopuz"
    strategy :github_latest
  end

  depends_on macos: :big_sur
  depends_on arch: :arm64

  app "Kopuz.app"

  zap trash: [
    "~/Library/Application Support/com.temidaradev.kopuz",
    "~/Library/Caches/com.temidaradev.kopuz",
    "~/Library/HTTPStorages/com.temidaradev.kopuz",
    "~/Library/Preferences/com.temidaradev.kopuz.plist",
    "~/Library/Saved Application State/com.temidaradev.kopuz.savedState",
    "~/Library/WebKit/com.temidaradev.kopuz",
  ]

  caveats <<~EOS
    Upstream ships an ad-hoc signed, un-notarized app, so macOS Gatekeeper
    will block the first launch. To allow it, either right-click the app and
    choose Open, or remove the quarantine attribute with:
      xattr -dr com.apple.quarantine /Applications/Kopuz.app
  EOS
end

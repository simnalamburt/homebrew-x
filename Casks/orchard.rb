cask "orchard" do
  version "1.7.1"
  sha256 "04862789d4467548a998701da5f7a9a09401ff5d467600f4111c754d715e3f4f"

  url "https://github.com/andrew-waters/orchard/releases/download/v#{version}/Orchard-#{version}.dmg"
  name "Orchard"
  desc "A GUI for Apple Containers, written in swift"
  homepage "https://github.com/andrew-waters/orchard"

  depends_on macos: ">= :tahoe"

  app "Orchard.app"

  zap trash: [
    ## TODO
    #"~/Library/Caches/orchard",
    #"~/Library/Preferences/orchard",
    #"~/Library/Preferences/com.example.orchard.plist",
    #"~/Library/Saved Application State/com.example.orchard.savedState",
  ]
end

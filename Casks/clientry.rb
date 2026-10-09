cask "clientry" do
  version "1.5"
  sha256 "bdb97d648589ec097554bbcbd81a5e30fd0bef67e81d5b5f2ef75140ba7c8477"

  url "https://clientry.dmalson.com/releases/Clientry-#{version}.zip"
  name "Clientry"
  desc "Project management for freelancers and solo professionals"
  homepage "https://clientry.dmalson.com/"

  depends_on macos: :sonoma

  app "Clientry.app"

  zap trash: "~/Library/Preferences/com.clientry.app.plist"
end

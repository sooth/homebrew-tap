cask "clientry" do
  version "1.0"
  sha256 "df3b47e4311b6343a089f835a8a2377209a282793919501b51b4bfbe25682e67"

  url "https://clientry.dmalson.com/releases/Clientry-#{version}.zip"
  name "Clientry"
  desc "Project management for freelancers and solo professionals"
  homepage "https://clientry.dmalson.com/"

  depends_on macos: :sonoma

  app "Clientry.app"

  zap trash: "~/Library/Preferences/com.clientry.app.plist"
end

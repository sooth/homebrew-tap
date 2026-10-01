cask "clientry" do
  version "1.3"
  sha256 "ac8e164bad3ea90e3d8a77949a6e497ea61757a36eadfa87e37bd53a460a56d2"

  url "https://clientry.dmalson.com/releases/Clientry-#{version}.zip"
  name "Clientry"
  desc "Project management for freelancers and solo professionals"
  homepage "https://clientry.dmalson.com/"

  depends_on macos: :sonoma

  app "Clientry.app"

  zap trash: "~/Library/Preferences/com.clientry.app.plist"
end

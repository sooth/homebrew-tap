cask "clientry" do
  version "1.5.1"
  sha256 "8dbfe3364026fb6faa870fea70a3e6608cd961f86aee0cdc9e7dc051f65aa951"

  url "https://clientry.dmalson.com/releases/Clientry-#{version}.zip"
  name "Clientry"
  desc "Project management for freelancers and solo professionals"
  homepage "https://clientry.dmalson.com/"

  depends_on macos: :sonoma

  app "Clientry.app"

  zap trash: "~/Library/Preferences/com.clientry.app.plist"
end

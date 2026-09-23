cask "clientry" do
  version "1.2"
  sha256 "2f6b1b9dfc99e0cd5938d8b8ff80de7c9767111c2d1df1bd1eb8e716d7d92bfc"

  url "https://clientry.dmalson.com/releases/Clientry-#{version}.zip"
  name "Clientry"
  desc "Project management for freelancers and solo professionals"
  homepage "https://clientry.dmalson.com/"

  depends_on macos: :sonoma

  app "Clientry.app"

  zap trash: "~/Library/Preferences/com.clientry.app.plist"
end

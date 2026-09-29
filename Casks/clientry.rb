cask "clientry" do
  version "1.2.1"
  sha256 "cb2becbfc75f7aeedb3e93add2ba4d224f5b8b531324f34f5826fff0c863c9e6"

  url "https://clientry.dmalson.com/releases/Clientry-#{version}.zip"
  name "Clientry"
  desc "Project management for freelancers and solo professionals"
  homepage "https://clientry.dmalson.com/"

  depends_on macos: :sonoma

  app "Clientry.app"

  zap trash: "~/Library/Preferences/com.clientry.app.plist"
end

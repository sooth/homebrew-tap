cask "clientry" do
  version "1.4"
  sha256 "d23a139bb83369f7ebb544904364545d47cd367e69c83cb0d5a19c516e6e08c7"

  url "https://clientry.dmalson.com/releases/Clientry-#{version}.zip"
  name "Clientry"
  desc "Project management for freelancers and solo professionals"
  homepage "https://clientry.dmalson.com/"

  depends_on macos: :sonoma

  app "Clientry.app"

  zap trash: "~/Library/Preferences/com.clientry.app.plist"
end

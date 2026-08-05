cask "calsync" do
  version "1.21.2"
  sha256 "9f67fc240da64e167af346e27b70acdf6560ceeb7d26814054cf468dab6f417f"

  url "https://sync365cal.com/releases/CalSync-#{version}.zip"
  name "CalSync"
  desc "Menu bar client that syncs Outlook calendar to Google Calendar"
  homepage "https://sync365cal.com/"

  livecheck do
    url "https://sync365cal.com/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :ventura
  depends_on arch: :arm64

  app "CalSync.app"

  zap trash: "~/Library/Preferences/com.calsync.menubar.plist"
end

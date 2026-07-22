cask "calsync" do
  version "1.21.0"
  sha256 "19f1fdf6df0ef5605063f0f970fa1a0b9772540e9466494d09a4e528f077dc8a"

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

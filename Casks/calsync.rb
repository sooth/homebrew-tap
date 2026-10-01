cask "calsync" do
  version "1.21.4"
  sha256 "af1703b4dbd343310e6ed7bf9ddb5b0c81e3b303baa1eb20ba96a1f94f57a618"

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

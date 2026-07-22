cask "calsync" do
  version "1.21.1"
  sha256 "944b91d22f6a8070ded60fc85d9e821dce045ffe438d52b642225de718db020d"

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

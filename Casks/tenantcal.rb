cask "tenantcal" do
  version "1.24.2"
  sha256 "f18cf4dbf80c994d8bd09135f9c04f6be8c71f5b3afc1822ce2f442c9b8d98cb"

  url "https://sync365cal.com/releases/CalSync-#{version}.zip"
  name "TenantCal"
  desc "Mirror private Busy blocks across Microsoft 365 calendars"
  homepage "https://sync365cal.com/"

  livecheck do
    url "https://sync365cal.com/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "CalSync.app"

  zap trash: "~/Library/Preferences/com.calsync.menubar.plist"
end

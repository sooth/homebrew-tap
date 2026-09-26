cask "tenantcal" do
  version "1.21.3"
  sha256 "6cd01eb57510584c52c2bc2426fce727e29e6d3f9c409e27517743f7645ec308"

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

cask "tenantcal" do
  version "1.22.1"
  sha256 "199838b9df0321ee00a139935b6b4400bd7a8ab54fa3518145803a2922ff8322"

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

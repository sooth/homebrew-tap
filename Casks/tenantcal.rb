cask "tenantcal" do
  version "1.24.0"
  sha256 "92d6d45b445e788655b6d99f2714559c948f90f9e63bda057690579b6d5b21c0"

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

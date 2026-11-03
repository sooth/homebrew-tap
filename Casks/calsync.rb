cask "calsync" do
  version "1.23.0"
  sha256 "b22bcf159f6da5aced05385c5ad190124fe487684458a2e7bc6c0f91b2cec003"

  url "https://sync365cal.com/releases/CalSync-#{version}.zip"
  name "CalSync"
  desc "Menu bar client that syncs Outlook calendar to Google Calendar"
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

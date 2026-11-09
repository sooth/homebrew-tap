cask "pinghaus" do
  version "1.3.0"
  sha256 "d2804248e01d6965ae48d19c2f806e4812476c4583a25adcb1f6e588de50b120"

  url "https://pinghaus.dmalson.com/releases/Pinghaus-#{version}.zip"
  name "Pinghaus"
  desc "Self-hosted push notifications compatible with the Pushover API"
  homepage "https://pinghaus.dmalson.com/"

  depends_on macos: :tahoe
  depends_on arch: :arm64

  app "Pinghaus.app"

  # Clear a manual / non-cask install so brew can land (same .app path).
  preflight do
    app = Pathname("/Applications/Pinghaus.app")
    next unless app.exist?

    ohai "Removing existing #{app.basename} so Homebrew can install"
    FileUtils.rm_r(app)
  end

  zap trash: [
    "~/Library/Application Support/Pinghaus",
    "~/Library/Caches/com.dmalson.pushclient",
    "~/Library/Preferences/com.dmalson.pushclient.plist",
  ]
end

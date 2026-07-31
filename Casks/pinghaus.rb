cask "pinghaus" do
  version "1.2.0"
  sha256 "12e993b41154d58c79160bf60be1346da1e254ca963910820241c5a229a38f51"

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

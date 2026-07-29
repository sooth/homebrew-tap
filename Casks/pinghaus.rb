cask "pinghaus" do
  version "1.1.1"
  sha256 "0f886656e7485110c2e1b5576a640b2917a6c179213771cdede76e5b30a2dc44"

  url "https://pinghaus.dmalson.com/releases/Pinghaus-#{version}.zip"
  name "Pinghaus"
  desc "Self-hosted push notifications compatible with the Pushover API"
  homepage "https://pinghaus.dmalson.com/"

  depends_on macos: :tahoe
  depends_on arch: :arm64

  app "Pinghaus.app"

  # Manual / non-cask installs leave Pinghaus.app in /Applications; clear so brew can land.
  preflight do
    this_room = HOMEBREW_PREFIX/"Caskroom/pinghaus"
    app = Pathname("/Applications/Pinghaus.app")

    if app.exist? && !this_room.directory?
      ohai "Removing existing #{app.basename} so Homebrew can install"
      FileUtils.rm_r(app)
    end
  end

  zap trash: [
    "~/Library/Application Support/Pinghaus",
    "~/Library/Caches/com.dmalson.pushclient",
    "~/Library/Preferences/com.dmalson.pushclient.plist",
  ]
end

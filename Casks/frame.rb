cask "frame" do
  version "1.1.2"
  sha256 "a4fd15f28713f28cee23d86aa1b141c3f69d98c578cd11ba3704e95b01dea171"

  url "https://frame.dmalson.com/releases/Frame-#{version}.zip"
  name "Frame"
  desc "Keyboard and drag-to-snap window manager with per-display dead zones"
  homepage "https://frame.dmalson.com/"

  livecheck do
    url "https://frame.dmalson.com/releases/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :tahoe
  depends_on arch: :arm64

  app "Frame.app"

  # Clear a manual / non-cask install so brew can land (same .app path).
  preflight do
    app = Pathname("/Applications/Frame.app")
    next unless app.exist?

    ohai "Removing existing #{app.basename} so Homebrew can install"
    FileUtils.rm_r(app)
  end

  zap trash: [
    "~/Library/Caches/com.dmalson.Frame",
    "~/Library/Preferences/com.dmalson.Frame.plist",
  ]
end

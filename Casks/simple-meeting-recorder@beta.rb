cask "simple-meeting-recorder@beta" do
  version "1.8-beta1"
  sha256 "882a7002f71e45deb06dc94f2bd552b78f03fe176d68e6f8215e97aa2770bf42"

  url "https://github.com/sooth/simple-meeting-recorder-releases/releases/download/v#{version}/SimpleMeetingRecorder-#{version}.zip"
  name "Simple Meeting Recorder"
  desc "On-device meeting recorder and transcript for the menu bar (beta)"
  homepage "https://simplemeetingrecorder.dmalson.com/"

  # Manual bumps for prereleases; production Sparkle feed stays on stable.
  livecheck do
    skip "Beta channel — versions are bumped manually in this cask"
  end

  auto_updates true
  depends_on macos: :sequoia
  depends_on arch: :arm64

  # Same .app path as the stable cask. Auto-replace so
  #   brew install --cask sooth/tap/simple-meeting-recorder@beta
  # works without a manual uninstall (conflicts_with would force that).
  # Avoid nested `brew uninstall` (lock). Clear Caskroom + app directly.
  preflight do
    other = "simple-meeting-recorder"
    other_room = HOMEBREW_PREFIX/"Caskroom"/other
    this_room = HOMEBREW_PREFIX/"Caskroom/simple-meeting-recorder@beta"
    app = Pathname("/Applications/SimpleMeetingRecorder.app")

    if other_room.directory?
      ohai "Switching to beta: removing stable cask #{other}"
      FileUtils.rm_rf(app) if app.exist?
      FileUtils.rm_rf(other_room)
    elsif app.exist? && !this_room.directory?
      ohai "Removing existing #{app.basename} so beta can install"
      FileUtils.rm_rf(app)
    end
  end

  app "SimpleMeetingRecorder.app"

  zap trash: "~/Library/Preferences/com.davidmalson.SimpleMeetingRecorder.plist"
end

cask "simple-meeting-recorder" do
  version "1.8"
  sha256 "66253826216940a0098e4c693625fff3607e63439c1606ead151159175622e12"

  url "https://github.com/sooth/simple-meeting-recorder-releases/releases/download/v#{version}/SimpleMeetingRecorder-#{version}.zip"
  name "Simple Meeting Recorder"
  desc "On-device meeting recorder and transcript for the menu bar"
  homepage "https://simplemeetingrecorder.dmalson.com/"

  livecheck do
    url "https://simplemeetingrecorder.dmalson.com/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sequoia
  depends_on arch: :arm64

  # Same .app path as the beta cask. Auto-replace so switching back to stable
  # is a single brew install (no manual uninstall).
  preflight do
    other = "simple-meeting-recorder@beta"
    other_room = HOMEBREW_PREFIX/"Caskroom"/other
    this_room = HOMEBREW_PREFIX/"Caskroom/simple-meeting-recorder"
    app = Pathname("/Applications/SimpleMeetingRecorder.app")

    if other_room.directory?
      ohai "Switching to stable: removing beta cask #{other}"
      FileUtils.rm_rf(app) if app.exist?
      FileUtils.rm_rf(other_room)
    elsif app.exist? && !this_room.directory?
      ohai "Removing existing #{app.basename} so stable can install"
      FileUtils.rm_rf(app)
    end
  end

  app "SimpleMeetingRecorder.app"

  zap trash: "~/Library/Preferences/com.davidmalson.SimpleMeetingRecorder.plist"
end

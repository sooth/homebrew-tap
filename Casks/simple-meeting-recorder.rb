cask "simple-meeting-recorder" do
  version "1.10.1"
  sha256 "4dfb24a9afc87d47929acc8c758c1ff497f3faa63f39b1b480aa36b8bf41614e"

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

  app "SimpleMeetingRecorder.app"

  # Same .app path as the beta cask. Auto-replace so switching back to stable
  # is a single brew install (no manual uninstall).
  preflight do
    other = "simple-meeting-recorder@beta"
    other_room = HOMEBREW_PREFIX/"Caskroom"/other
    this_room = HOMEBREW_PREFIX/"Caskroom/simple-meeting-recorder"
    app = Pathname("/Applications/SimpleMeetingRecorder.app")

    if other_room.directory?
      ohai "Switching to stable: removing beta cask #{other}"
      FileUtils.rm_r(app) if app.exist?
      FileUtils.rm_r(other_room)
    elsif app.exist? && !this_room.directory?
      ohai "Removing existing #{app.basename} so stable can install"
      FileUtils.rm_r(app)
    end
  end

  zap trash: "~/Library/Preferences/com.davidmalson.SimpleMeetingRecorder.plist"
end

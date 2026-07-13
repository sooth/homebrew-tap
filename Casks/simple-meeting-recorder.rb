cask "simple-meeting-recorder" do
  version "1.7"
  sha256 "c867ce18aac4a9646b1d33df446c80ec10800c31af99aeffab47d98525f09862"

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

  zap trash: "~/Library/Preferences/com.davidmalson.SimpleMeetingRecorder.plist"
end

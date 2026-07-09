cask "simple-meeting-recorder" do
  version "1.6.1"
  sha256 "1376451868d32c4917f6284cb0e79b4aa3ae8e3f84287c4fd11a2e1046a32597"

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

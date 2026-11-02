cask "simple-meeting-recorder" do
  version "1.19.0"
  sha256 "40c15cd6d507ec339f295f402232751d6ae169bc57ef41629f1f1f7c6b8f3bac"

  url "https://github.com/sooth/simple-meeting-recorder-releases/releases/download/v#{version}/SimpleMeetingRecorder-#{version}.zip"
  name "Simple Meeting Recorder"
  desc "On-device meeting recorder and transcript for the menu bar"
  homepage "https://simplemeetingrecorder.dmalson.com/"

  livecheck do
    url "https://simplemeetingrecorder.dmalson.com/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sequoia

  # ~/Applications unless --appdir is passed or set in HOMEBREW_CASK_OPTS: no admin
  # password, and in-app updates never prompt. An explicit --appdir sticks on reinstall.
  appdir_chosen = cask.config.explicit.key?(:appdir) || cask.config.env.key?(:appdir)
  app_root = appdir_chosen ? appdir : "#{Dir.home}/Applications"
  app "SimpleMeetingRecorder.app", target: "#{app_root}/SimpleMeetingRecorder.app"

  # One SimpleMeetingRecorder.app: clear the other channel (same app) and any manual
  # copy in either Applications folder.
  preflight_steps do
    remove ["/Applications/SimpleMeetingRecorder.app", "~/Applications/SimpleMeetingRecorder.app"],
           recursive: true, sudo: :if_needed
    remove "{{HOMEBREW_PREFIX}}/Caskroom/simple-meeting-recorder@beta", recursive: true
  end

  zap trash: "~/Library/Preferences/com.davidmalson.SimpleMeetingRecorder.plist"
end

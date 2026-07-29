cask "clientry" do
  version "1.1"
  sha256 "8010a93ac5920ceff936baefe5316440642ddb4428f5aecfb099dbbc1c385511"

  url "https://clientry.dmalson.com/releases/Clientry-#{version}.zip"
  name "Clientry"
  desc "Project management for freelancers and solo professionals"
  homepage "https://clientry.dmalson.com/"

  depends_on macos: :sonoma

  app "Clientry.app"

  zap trash: "~/Library/Preferences/com.clientry.app.plist"
end

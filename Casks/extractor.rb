cask "extractor" do
  version "0.1.2"
  sha256 "7116c24b41c392654f850c1a080b093d8e51eee730dfe158844facfdd4692730"

  url "https://github.com/sooth/extractor-releases/releases/download/v#{version}/Extractor-#{version}.zip"
  name "Extractor"
  desc "Archive Outlook mail and Teams chats from a signed-in session"
  homepage "https://extractor.dmalson.com/"

  depends_on arch: :arm64
  depends_on macos: :ventura

  # ~/Applications unless --appdir is passed or set in HOMEBREW_CASK_OPTS: no admin
  # password needed. An explicit --appdir sticks on reinstall.
  appdir_chosen = cask.config.explicit.key?(:appdir) || cask.config.env.key?(:appdir)
  app_root = appdir_chosen ? appdir : "#{Dir.home}/Applications"
  app "Extractor.app", target: "#{app_root}/Extractor.app"
  binary "#{app_root}/Extractor.app/Contents/MacOS/extractor"

  # Clear a manual / non-cask copy in either Applications folder so brew can land.
  preflight_steps do
    remove ["/Applications/Extractor.app", "~/Applications/Extractor.app"], recursive: true, sudo: :if_needed
  end

  zap trash: "~/Library/Preferences/com.dmalson.Extractor.plist"

  caveats do
    <<~EOS
      Extractor is a CLI. After install:

        extractor login
        extractor whoami
        extractor mail --days 7
        extractor teams --days 7
        extractor teams-poll
        extractor teams-watch

      Mail and chat archives stay in ~/Library/Application Support/MSExtractor/
      and are not removed by brew uninstall --zap.
    EOS
  end
end

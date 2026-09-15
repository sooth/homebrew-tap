cask "extractor" do
  version "0.1.2"
  sha256 "7116c24b41c392654f850c1a080b093d8e51eee730dfe158844facfdd4692730"

  url "https://github.com/sooth/extractor-releases/releases/download/v#{version}/Extractor-#{version}.zip"
  name "Extractor"
  desc "Archive Outlook mail and Teams chats from a signed-in session"
  homepage "https://extractor.dmalson.com/"

  depends_on macos: :ventura
  depends_on arch: :arm64

  app "Extractor.app"
  binary "#{appdir}/Extractor.app/Contents/MacOS/extractor"

  # Clear a manual / non-cask install so brew can land (same .app path).
  preflight do
    app = Pathname("/Applications/Extractor.app")
    next unless app.exist?

    ohai "Removing existing #{app.basename} so Homebrew can install"
    FileUtils.rm_r(app)
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

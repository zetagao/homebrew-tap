cask "limithud" do
  version "2.3"
  sha256 "b6a1e74696f838b3b9956182733aefb44cb46deb6bd594eeb28436d24afa7065"

  url "https://github.com/zetagao/LimitHUD/releases/download/v#{version}/LimitHUD.zip"
  name "LimitHUD"
  desc "Menu-bar HUD for live Claude and Codex usage quotas"
  homepage "https://github.com/zetagao/LimitHUD"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "LimitHUD.app"

  zap trash: [
    "~/Library/HTTPStorages/com.zetagao.limithud",
    "~/Library/Preferences/com.zetagao.limithud.plist",
  ]

  caveats <<~EOS
    LimitHUD is open source and code-signed, but not Apple-notarized.
    If you installed without --no-quarantine, macOS will block the first
    launch — approve it in System Settings → Privacy & Security → "Open
    Anyway". To skip that, install with:

      brew install --no-quarantine zetagao/tap/limithud

    On first run, allow the Keychain prompt (reads your browser's cookie
    key locally) and the notification prompt.
  EOS
end

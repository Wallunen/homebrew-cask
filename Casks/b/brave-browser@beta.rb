cask "brave-browser@beta" do
  arch arm: "arm64", intel: "x64"
  folder = on_arch_conditional arm: "beta-arm64", intel: "beta"

  version "1.81.125.0"
  sha256 arm:   "ea1c7d52daae5a102f8cb26db920ef84d5c3fb9c27631869b398bf7ce8bfa8ec",
         intel: "6f51e0b7b67bf5283b197b338783793ae55d8f1aaa43d04555e67bed3ef22a89"

  url "https://updates-cdn.bravesoftware.com/sparkle/Brave-Browser/#{folder}/#{version.major_minor_patch.sub(".", "")}/Brave-Browser-Beta-#{arch}.dmg",
      verified: "updates-cdn.bravesoftware.com/sparkle/Brave-Browser/"
  name "Brave Beta"
  desc "Web browser focusing on privacy"
  homepage "https://brave.com/download-beta/"

  livecheck do
    url "https://updates.bravesoftware.com/sparkle/Brave-Browser/#{folder}/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "Brave Browser Beta.app"

  zap trash: [
        "~/Library/Application Support/BraveSoftware/Brave-Browser-Beta",
        "~/Library/Caches/BraveSoftware/Brave-Browser-Beta",
        "~/Library/Caches/com.brave.Browser.beta",
        "~/Library/HTTPStorages/com.brave.Browser.beta",
        "~/Library/Preferences/com.brave.Browser.beta.plist",
        "~/Library/Saved Application State/com.brave.Browser.beta.savedState",
      ],
      rmdir: [
        "~/Library/Application Support/BraveSoftware",
        "~/Library/Caches/BraveSoftware",
      ]
end

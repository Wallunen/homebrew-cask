cask "wavebox" do
  arch arm: "macarm64", intel: "mac"

  version "10.127.10.2"
  sha256 arm:   "300dadd89a071f2aa7ad35e8a46ed5119fce7449021a7e4e8356b6297e9f7cbd",
         intel: "634adbf2cbe5fd281305d5f33f1f26dd26e67ca65e4dfc87a10e96bbdfc1e88e"

  url "https://download.wavebox.app/stable/#{arch}/Install%20Wavebox%20#{version}.dmg",
      verified: "download.wavebox.app/"
  name "Wavebox"
  desc "Web browser"
  homepage "https://wavebox.io/"

  livecheck do
    url "https://download.wavebox.app/latest/stable/mac"
    strategy :header_match
  end

  auto_updates true
  depends_on macos: ">= :sierra"

  app "Wavebox.app"

  uninstall quit: "io.wavebox.wavebox"

  zap trash: [
    "~/Library/Application Support/WaveboxApp",
    "~/Library/Caches/com.bookry.wavebox",
    "~/Library/Caches/WaveboxApp",
    "~/Library/Preferences/com.bookry.wavebox.plist",
    "~/Library/Saved Application State/com.bookry.wavebox.savedState",
  ]
end

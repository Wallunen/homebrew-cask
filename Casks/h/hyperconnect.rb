cask "hyperconnect" do
  version "1.7.2"
  sha256 "3b5faa886ede74e1cda8ff915870450ff39cc19e0ff9cdd87fd8e56b84098a43"

  url "https://cdn.cnbj1.fds.api.mi-img.com/mijia-ios-adhoc/hyperconnect/HyperConnect-#{version}.dmg",
      verified: "mi-img.com/mijia-ios-adhoc/hyperconnect/"
  name "HyperConnect"
  name "小米互联服务"
  desc "Cross-device interconnection service for the Xiaomi ecosystem"
  homepage "https://hyperos.mi.com/continuity"

  livecheck do
    url "https://cn-device.interconnect.miui.com/package/mac/checkUpdate?version=0.0.0"
    strategy :json do |json|
      json.dig("data", "versionInfo", "version")
    end
  end

  auto_updates true
  depends_on macos: ">= :monterey"

  app "小米互联服务.app"

  uninstall quit: "com.xiaomi.hyperConnect"

  zap trash: [
    "~/Documents/XiaoMiDevicePropertyCache",
    "~/Library/Caches/com.xiaomi.hyperConnect",
    "~/Library/com.xiaomi.hyperConnect",
    "~/Library/HTTPStorages/com.xiaomi.hyperConnect",
    "~/Library/OneTrack/com.xiaomi.hyperConnect.data",
    "~/Library/Preferences/com.xiaomi.hyperConnect.plist",
    "~/Library/Saved Application State/com.xiaomi.hyperConnect.savedState",
  ]
end

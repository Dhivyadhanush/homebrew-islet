cask "islet" do
  version "0.2.0"
  sha256 "652d9a94d915a1b4c3ceb8c1dfbd985709c3b4bfa7ae248f9367b12c51b938e2"

  url "https://github.com/Dhivyadhanush/islet/releases/download/v#{version}/Islet-#{version}.dmg"
  name "Islet"
  desc "Minimal dynamic island for the MacBook notch"
  homepage "https://github.com/Dhivyadhanush/islet"

  app "Islet.app"

  zap trash: [
    "~/Library/Preferences/dev.dhanuz.islet.plist",
  ]

  caveats do
    <<~EOS
      Islet is ad-hoc signed. If macOS blocks the first launch, run:
        xattr -dr com.apple.quarantine /Applications/Islet.app
    EOS
  end
end

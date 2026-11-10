cask "lost-island" do
  version "0.8.3"
  sha256 "a0e718ccb5ff6264388f2f2f8a231357b1c5f4822f69678e0bf8c9d3830e4e5c"

  url "https://github.com/Dhivyadhanush/islet/releases/download/v#{version}/lost_Island-#{version}.dmg"
  name "lost_Island"
  desc "Minimal dynamic island for the MacBook notch"
  homepage "https://github.com/Dhivyadhanush/islet"

  app "lost_Island.app"

  # Ad-hoc signed, so Gatekeeper cannot verify it. macOS 27 refuses to run a
  # quarantined copy ("Not Opened" offers to move it to the Trash), so clear
  # the download flag after install.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "/Applications/lost_Island.app"]
  end

  zap trash: [
    "~/Library/Preferences/dev.dhanuz.islet.plist",
  ]

  caveats do
    <<~EOS
      lost_Island is ad-hoc signed. The cask clears the download quarantine
      flag after install, so it opens normally.

      If an older copy is still blocked, use System Settings → Privacy &
      Security → Open Anyway, or run:
        xattr -dr com.apple.quarantine /Applications/lost_Island.app
    EOS
  end
end

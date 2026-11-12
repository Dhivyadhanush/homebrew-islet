cask "islet" do
  version "1.0.1"
  sha256 "2f27dabfea7ebda3ef13375ba5a843c3ccdee46eee0a523c3ee4c431b4318e1c"

  url "https://github.com/Dhivyadhanush/islet/releases/download/v#{version}/islet-#{version}.dmg"
  name "islet"
  desc "Minimal dynamic island for the MacBook notch"
  homepage "https://github.com/Dhivyadhanush/islet"

  app "islet.app"

  # Ad-hoc signed, so Gatekeeper cannot verify it. macOS refuses to run a
  # quarantined copy ("Not Opened" offers to move it to the Trash), so clear
  # the download flag after install.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "/Applications/islet.app"]
  end

  zap trash: [
    "~/Library/Preferences/dev.dhanuz.islet.plist",
  ]

  caveats do
    <<~EOS
      islet is ad-hoc signed. The cask clears the download quarantine flag
      after install, so it opens normally.

      If an older copy is still blocked, use System Settings → Privacy &
      Security → Open Anyway, or run:
        xattr -dr com.apple.quarantine /Applications/islet.app
    EOS
  end
end

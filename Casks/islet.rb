cask "islet" do
  version "1.0.3"
  sha256 "fb8f839d470681f66a2085a74150ff486ba0265b87f0b136691a6aa83809ba88"

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

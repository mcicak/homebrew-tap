class Matricula < Formula
  desc "Keyboard-driven console for the Matricula family knowledge graph"
  homepage "https://matricula.io/console"
  version "0.1.1"
  license "LicenseRef-Matricula-Proprietary"

  on_macos do
    on_arm do
      url "https://downloads.matricula.io/console/v0.1.1/matricula-macos-arm64.tar.gz"
      sha256 "407d3127b678858e6fc1b54e23fbff8f8ee17b5bbaaac38545e0b29ab0befb84"
    end
    on_intel do
      url "https://downloads.matricula.io/console/v0.1.1/matricula-macos-x64.tar.gz"
      sha256 "51f74783aaedd8a8b56d268675734dbc157820f8eb2bf74ddb5e03fbbfaa3753"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.matricula.io/console/v0.1.1/matricula-linux-arm64.tar.gz"
      sha256 "1a24cb4fb25f2a48d3c22ab0b0298f88076ca3c7a11187b8872492522abdaae8"
    end
    on_intel do
      url "https://downloads.matricula.io/console/v0.1.1/matricula-linux-x64.tar.gz"
      sha256 "e83e8428c8a70f714019e859070b9eeb91195df3f3efa360dcdcaf524b709f12"
    end
  end

  def install
    libexec.install Dir["*"]
    (bin/"matricula").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/matricula" "$@"
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/matricula --version")
  end
end

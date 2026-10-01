class Matricula < Formula
  desc "Keyboard-driven console for the Matricula family knowledge graph"
  homepage "https://matricula.io/console"
  version "0.1.2"
  license "LicenseRef-Matricula-Proprietary"

  on_macos do
    on_arm do
      url "https://downloads.matricula.io/console/v0.1.2/matricula-macos-arm64.tar.gz"
      sha256 "b98498908ccb71a6afdac721696fca12fcd29c92e5d6df380334ae1a16f73897"
    end
    on_intel do
      url "https://downloads.matricula.io/console/v0.1.2/matricula-macos-x64.tar.gz"
      sha256 "acf078ca92b815e869871929e48d170ec834055c59073b1a456da91af335d3bd"
    end
  end

  on_linux do
    on_arm do
      url "https://downloads.matricula.io/console/v0.1.2/matricula-linux-arm64.tar.gz"
      sha256 "509c13891887f294df06c9e9039c8064c41d4df6ba10c722c29e6b96085ffeea"
    end
    on_intel do
      url "https://downloads.matricula.io/console/v0.1.2/matricula-linux-x64.tar.gz"
      sha256 "c765ea652420315d6c4b940b45f7d2ecd6587167781d534dec557a73e08b1220"
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

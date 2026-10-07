class Geistr < Formula
  desc "Local LLM chat, model catalog and service on the geist engine (GGUF)"
  homepage "https://github.com/geisten/geist-runtime"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/geisten/geist-runtime/releases/download/v0.1.1/geistr-macos-arm64.tar.gz"
      sha256 "20d7a93ecc92df3a1e1eca7e9cb35daf7e82a5dd0208b4d6699b6ab33db1cc64"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/geisten/geist-runtime/releases/download/v0.1.1/geistr-linux-arm64.tar.gz"
      sha256 "f759f0d016125cae19aa521ca1ed824c8a523bdf313454c65c91f8c57aea54d3"
    end
    on_intel do
      url "https://github.com/geisten/geist-runtime/releases/download/v0.1.1/geistr-linux-amd64.tar.gz"
      sha256 "2e5912374ea5241a05f92529d46396f1a50cc37baaf6a626d2104e16f5c9410b"
    end
  end

  def install
    bin.install "geistr"
  end

  def caveats
    <<~EOS
      Install a model and chat:
        geistr catalog
        geistr pull smollm2-360m
        geistr chat smollm2-360m
      The OpenAI and Ollama APIs (replacing geist-serve):
        geistr serve smollm2-360m --http
    EOS
  end

  test do
    assert_match "geistr #{version}", shell_output("#{bin}/geistr --version")
  end
end

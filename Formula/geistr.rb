class Geistr < Formula
  desc "Local LLM chat, model catalog and service on the geist engine (GGUF)"
  homepage "https://github.com/geisten/geist-runtime"
  version "0.3.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://www.geisten.net/download/geistr/v0.3.4/geistr-macos-arm64.tar.gz"
      sha256 "37f7f21283a76479f3f5547e172c4b0f1c399255ff47f4f5da35d415957fa5c0"
    end
  end
  on_linux do
    on_arm do
      url "https://www.geisten.net/download/geistr/v0.3.4/geistr-linux-arm64.tar.gz"
      sha256 "8960deed677bd556e3a55d42d284e2621df96080dbf5abb4694b99eafae5f129"
    end
    on_intel do
      url "https://www.geisten.net/download/geistr/v0.3.4/geistr-linux-amd64.tar.gz"
      sha256 "38ba8b57fd85790b3b5fd37f9d1ccad4449537bf9642d02c3aac83feb16fa31b"
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

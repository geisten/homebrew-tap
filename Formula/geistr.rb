class Geistr < Formula
  desc "Local LLM chat, model catalog and service on the geist engine (GGUF)"
  homepage "https://github.com/geisten/geist-runtime"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/geisten/geist-runtime/releases/download/v0.1.2/geistr-macos-arm64.tar.gz"
      sha256 "a76694c0cb4c1538ed87ae2aae43a7b7da19c5ec5d6459dea0160d85d567c552"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/geisten/geist-runtime/releases/download/v0.1.2/geistr-linux-arm64.tar.gz"
      sha256 "33d5066087bbd4b2a35c11562335aeabeefa206befc3fdf75575cb58f98c4175"
    end
    on_intel do
      url "https://github.com/geisten/geist-runtime/releases/download/v0.1.2/geistr-linux-amd64.tar.gz"
      sha256 "6d95226c11c3e466b9034dcd6eef69bcbf8edc1f13161c4f06481f20531db29a"
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

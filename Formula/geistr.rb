class Geistr < Formula
  desc "Local LLM chat, model catalog and service on the geist engine (GGUF)"
  homepage "https://github.com/geisten/geist-runtime"
  version "0.3.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://www.geisten.net/download/geistr/v0.3.2/geistr-macos-arm64.tar.gz"
      sha256 "b9f8e5eae6b80f60bb878072a31d6ffd2d2447f42e3cd8458296255b2be51f70"
    end
  end
  on_linux do
    on_arm do
      url "https://www.geisten.net/download/geistr/v0.3.2/geistr-linux-arm64.tar.gz"
      sha256 "a18012655dd5e7fcc7e489cf6dec97d62f2d1cc0a31c63466c5958681da9d383"
    end
    on_intel do
      url "https://www.geisten.net/download/geistr/v0.3.2/geistr-linux-amd64.tar.gz"
      sha256 "75749c748215700debbbc6dcec777d374d2fdbf8cbe365975920b68145cab02d"
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

class Geistr < Formula
  desc "Local LLM chat, model catalog and service on the geist engine (GGUF)"
  homepage "https://github.com/geisten/geist-runtime"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/geisten/geist-runtime/releases/download/v0.1.0/geistr-macos-arm64.tar.gz"
      sha256 "4e0cb582dd89eae181f686c0a4e1a900e3f12c04eb0408af6fab9a023d5be6bd"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/geisten/geist-runtime/releases/download/v0.1.0/geistr-linux-arm64.tar.gz"
      sha256 "4aad69e5d4135f8d59fd73aadcf88e24ade8bf2745e7ffee3413c17677e2d212"
    end
    on_intel do
      url "https://github.com/geisten/geist-runtime/releases/download/v0.1.0/geistr-linux-amd64.tar.gz"
      sha256 "fb6b0319e4e0fae396d23cd53efe3d0fc933fda52cfcd7d4ab2b6ce7bcd07475"
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

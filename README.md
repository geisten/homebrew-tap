# geisten/homebrew-tap

Homebrew tap for [geist](https://github.com/geisten/geisten) — a CPU-first LLM
inference engine shipped as a single dependency-free binary.

```bash
brew install geisten/tap/geist
geist --version
```

Supported: macOS (Apple Silicon), Linux (ARM64, x86-64).

`Formula/geist.rb` is auto-updated by the release workflow in
[geisten/geisten](https://github.com/geisten/geisten) — don't edit it here.

## geist-serve — one model behind the Ollama and OpenAI APIs

```bash
brew install geisten/tap/geist-serve
echo /path/to/model.gguf > "$(brew --prefix)/etc/geist-serve/model"
brew services start geist-serve          # launchd, restarts at login
curl http://127.0.0.1:11434/api/tags
```

`Formula/geist-serve.rb` is written by `scripts/bump-tap.sh` in
[geisten/geist-serve](https://github.com/geisten/geist-serve) on every
release — don't edit it here. The macOS menu bar app (Geist.app) will come
as a cask once it ships signed.

#!/bin/bash


NVIM_CONFIG_REPO="https://github.com/tomheadifen/nvim-config"

detect_os() {
    if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" || -n "$WINDIR" ]]; then
        echo "windows"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    elif [[ -f /etc/os-release ]]; then
        . /etc/os-release
        echo "$ID"
    else
        echo "unknown"
    fi
}

OS=$(detect_os)

if [[ "$OS" == "windows" ]]; then
    NVIM_CONFIG_DIR="$LOCALAPPDATA/nvim"
else
    NVIM_CONFIG_DIR="$HOME/.config/nvim"
fi

install_nvim() {
    local os="$1"
    echo "Installing neovim..."
    case "$os" in
        macos)
            brew install neovim
            ;;
        ubuntu|debian|linuxmint|pop)
            sudo snap install nvim --classic
            ;;
        fedora)
            sudo dnf install -y neovim
            ;;
        arch|manjaro|endeavouros)
            sudo pacman -S --noconfirm neovim
            ;;
        windows)
            if command -v winget &>/dev/null; then
                winget install -e --id Neovim.Neovim
            elif command -v scoop &>/dev/null; then
                scoop install neovim
            elif command -v choco &>/dev/null; then
                choco install -y neovim
            else
                echo "No package manager found. Install winget, scoop, or choco, then re-run."
                exit 1
            fi
            ;;
        *)
            echo "Unsupported OS: $os. Please install neovim manually."
            exit 1
            ;;
    esac
}

install_lazygit() {
    local os="$1"
    echo "Installing lazygit..."
    case "$os" in
        macos)
            brew install lazygit
            ;;
        ubuntu|debian|linuxmint|pop|fedora|arch|manjaro|endeavouros)
            local version
            version=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name"' | sed -E 's/.*"v([^"]+)".*/\1/')
            local archive="lazygit_${version}_Linux_x86_64.tar.gz"
            curl -Lo "/tmp/$archive" "https://github.com/jesseduffield/lazygit/releases/latest/download/$archive"
            tar -xf "/tmp/$archive" -C /tmp lazygit
            sudo install /tmp/lazygit /usr/local/bin
            rm -f "/tmp/$archive" /tmp/lazygit
            ;;
        windows)
            if command -v winget &>/dev/null; then
                winget install -e --id JesseDuffield.lazygit
            elif command -v scoop &>/dev/null; then
                scoop install lazygit
            elif command -v choco &>/dev/null; then
                choco install -y lazygit
            else
                echo "No package manager found. Install winget, scoop, or choco, then re-run."
                exit 1
            fi
            ;;
        *)
            echo "Unsupported OS: $os. Please install lazygit manually."
            exit 1
            ;;
    esac
}

setup_nvim_config() {
    echo "Setting up nvim config from $NVIM_CONFIG_REPO..."

    if [[ -d "$NVIM_CONFIG_DIR" ]]; then
        echo "Backing up existing config to ${NVIM_CONFIG_DIR}.bak"
        rm -rf "${NVIM_CONFIG_DIR}.bak"
        mv "$NVIM_CONFIG_DIR" "${NVIM_CONFIG_DIR}.bak"
    fi

    git clone "$NVIM_CONFIG_REPO" "$NVIM_CONFIG_DIR"
    echo "Nvim config installed at $NVIM_CONFIG_DIR"
}

echo "Detected OS: $OS"

if ! command -v nvim &>/dev/null; then
    install_nvim "$OS"
else
    echo "Neovim already installed: $(nvim --version | head -1)"
fi

if ! command -v lazygit &>/dev/null; then
    install_lazygit "$OS"
else
    echo "Lazygit already installed: $(lazygit --version)"
fi

setup_nvim_config

echo "Done. Launch nvim to let lazy.nvim install plugins."

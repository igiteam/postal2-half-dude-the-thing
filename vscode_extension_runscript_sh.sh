#!/bin/bash
set -e

# ============================================
# Shell Script Runner VS Code Extension #
# ============================================

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}"
echo "╔═══════════════════════════════════════════════════════════════╗"
echo "║      Shell Script Runner VSCODE EXTENSION INSTALL             ║"
echo "╚═══════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

echo "This extension adds '⚙️Run .sh' command to run shell scripts with one click."
echo "Features:"
echo "- Right-click on any .sh file → '⚙️Run .sh'"
echo "- Automatic chmod +x before execution"
echo "- Runs in VS Code terminal with proper working directory"
echo ""

# Detect Codespaces early
IS_CODESPACES=0
if [ -n "$CODESPACES" ] || [ -n "$CODESPACE_NAME" ]; then
    IS_CODESPACES=1
    echo -e "${YELLOW}🔧 GitHub Codespaces detected${NC}"
    echo ""
fi

# Ask for extension name
read -p "Enter your extension folder name (default: vscode_sh-runner): " EXTNAME
EXTNAME=${EXTNAME:-vscode_sh-runner}

# Check if folder exists
if [ -d "$EXTNAME" ]; then
    read -p "Folder '$EXTNAME' already exists. Remove it? (y/N): " REMOVE
    REMOVE=${REMOVE:-N}
    if [[ "$REMOVE" == "y" || "$REMOVE" == "Y" ]]; then
        echo "Removing existing folder '$EXTNAME'..."
        rm -rf "$EXTNAME"
    else
        echo "Exiting to avoid overwriting."
        exit 1
    fi
fi

# Create folder structure
mkdir -p "$EXTNAME/src" "$EXTNAME/media" "$EXTNAME/out"
cd "$EXTNAME" || exit

# Download terminal icon
echo -e "${CYAN}📥 Downloading terminal icon...${NC}"
curl -s -o media/logo.png "https://raw.githubusercontent.com/igiteam/winejs/refs/heads/main/images/Bash_Logo_Colored.png" || \
    echo -e "${YELLOW}⚠️  Icon download failed, continuing without icon${NC}"

# Create package.json
cat <<EOL > package.json
{
  "name": "sh-runner",
  "displayName": "Shell Script Runner",
  "description": "One-click runner for shell scripts with auto chmod",
  "repository": "https://github.com/igiteam/sh-runner",
  "publisher": "songdropltd",
  "icon": "media/logo.png",
  "version": "1.0.0",
  "engines": {
    "vscode": "^1.81.0"
  },
  "categories": [
    "Other"
  ],
  "activationEvents": [
    "onStartupFinished",
    "onCommand:shrunner.runShellScript"
  ],
  "main": "./out/extension.js",
  "contributes": {
    "commands": [
      {
        "command": "shrunner.runShellScript",
        "title": "⚙️Run .sh",
        "category": "Shell"
      }
    ],
    "menus": {
      "explorer/context": [
        {
          "command": "shrunner.runShellScript",
          "group": "navigation"
        }
      ],
      "editor/title": [
        {
          "command": "shrunner.runShellScript",
          "group": "navigation"
        }
      ]
    }
  },
  "scripts": {
    "vscode:prepublish": "npm run compile",
    "compile": "tsc -p ./",
    "watch": "tsc -watch -p ./"
  },
  "devDependencies": {
    "@types/node": "20.x",
    "@types/vscode": "^1.81.0",
    "typescript": "^5.7.2"
  },
  "dependencies": {}
}
EOL

# Create tsconfig.json
cat <<EOL > tsconfig.json
{
	"compilerOptions": {
		"module": "Node16",
		"target": "ES2022",
		"outDir": "out",
		"lib": [
			"ES2022"
		],
		"sourceMap": true,
		"rootDir": "src",
		"strict": true
	}
}
EOL

# Create extension.ts (Codespaces-compatible)
cat <<'EOL' > src/extension.ts
import * as vscode from 'vscode';
import * as fs from 'fs';
import * as path from 'path';

export function activate(context: vscode.ExtensionContext) {
    console.log('✅ Shell Script Runner activated!');

    const disposable = vscode.commands.registerCommand('shrunner.runShellScript', async (resource?: vscode.Uri) => {
        // Resolve target: URI passed by the menu, or the active editor's file
        let scriptPath: string | undefined;

        if (resource && resource.fsPath) {
            scriptPath = resource.fsPath;
        } else {
            const editor = vscode.window.activeTextEditor;
            if (editor && editor.document.uri.scheme === 'file') {
                scriptPath = editor.document.uri.fsPath;
            }
        }

        if (!scriptPath) {
            vscode.window.showWarningMessage('Please select a shell script file (.sh) to run');
            return;
        }

        // Enforce .sh extension ourselves (menu no longer filters by "when")
        if (path.extname(scriptPath).toLowerCase() !== '.sh') {
            vscode.window.showWarningMessage('Selected file is not a shell script (.sh)');
            return;
        }

        const scriptDir = path.dirname(scriptPath);
        const scriptName = path.basename(scriptPath);

        try {
            // Try chmod, but don't block execution if it fails (Codespaces may be read-only)
            try {
                const stats = fs.statSync(scriptPath);
                if (!(stats.mode & 0o111)) {
                    fs.chmodSync(scriptPath, '755');
                    vscode.window.showInformationMessage(`✅ Made ${scriptName} executable`);
                }
            } catch (chmodError: any) {
                console.warn('chmod failed, will try running anyway:', chmodError.message);
                vscode.window.showWarningMessage(`Could not chmod ${scriptName}, trying to run anyway...`);
            }

            // Create terminal and run (invoke via bash so no execute bit is needed)
            const terminal = vscode.window.createTerminal({
                name: `Run ${scriptName}`,
                cwd: scriptDir
            });
            terminal.show();
            terminal.sendText(`cd "${scriptDir}" && chmod +x "${scriptName}" 2>/dev/null; bash "${scriptName}"`);
        } catch (error: any) {
            vscode.window.showErrorMessage(`Failed to run script: ${error.message}`);
            console.error('Script runner error:', error);
        }
    });

    context.subscriptions.push(disposable);
}

export function deactivate() {}
EOL

# Create .vscodeignore
cat <<EOL > .vscodeignore
.vscode
src
*.ts
*.map
.git
.gitignore
*.sh
EOL

# Create README.md
cat <<EOL > README.md
# Shell Script Runner

One-click runner for shell scripts with automatic chmod.

## Features

- Right-click any .sh file → "⚙️Run .sh"
- Automatic chmod +x before execution
- Runs in VS Code terminal with proper working directory
- Editor title menu support

## Usage

- Right-click any .sh file in explorer → "⚙️Run .sh"
- Click "⚙️Run .sh" in editor title when editing .sh files
- Command Palette → "⚙️Run .sh"

## What it does

1. Makes the script executable (chmod +x)
2. Opens a terminal in the script's directory
3. Runs the script with bash scriptname.sh
4. Shows progress notifications

## Requirements

- VS Code 1.81.0 or higher
- Unix-like system (Linux, macOS) for chmod support
EOL

echo -e "${GREEN}✅ Extension scaffold created in '$EXTNAME'${NC}"

# -----------------------------
# Create LICENSE.md (MIT License)
# -----------------------------
cat <<EOL > LICENSE.md
MIT License

Copyright (c) $(date +%Y) Gabriel Majorsky

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
EOL

# ===============================================
# Build and Install Extension
# ===============================================

echo -e "${CYAN}🔨 Building and installing extension...${NC}"

# Load nvm if present (non-fatal)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
export NODE_OPTIONS=--openssl-legacy-provider

echo -e "${YELLOW}Node: $(node -v 2>/dev/null || echo 'not found') | npm: $(npm -v 2>/dev/null || echo 'not found')${NC}"

if ! command -v npm &> /dev/null; then
    echo -e "${RED}❌ npm not found. Please install Node.js first.${NC}"
    exit 1
fi

# Install dependencies
if [ ! -d "node_modules" ]; then
    echo -e "${CYAN}📦 Installing Node dependencies...${NC}"
    npm install
fi

# Compile TypeScript
echo -e "${CYAN}🔨 Compiling TypeScript...${NC}"
npm run compile

# Package extension
echo -e "${CYAN}📦 Packaging extension...${NC}"

if ! command -v vsce &> /dev/null; then
    echo -e "${YELLOW}Installing vsce...${NC}"
    npm install -g vsce
fi

vsce package --allow-missing-repository

VSIX_FILE=$(ls sh-runner-*.vsix 2>/dev/null | head -n1)

if [ ! -f "$VSIX_FILE" ]; then
    echo -e "${RED}❌ Failed to package extension${NC}"
    exit 1
fi

VSIX_ABS="$(pwd)/$VSIX_FILE"
echo -e "${GREEN}✅ Extension packaged: $VSIX_ABS${NC}"

# ===============================================
# Install extension (Codespaces-aware)
# ===============================================
echo -e "${CYAN}📥 Installing extension...${NC}"

INSTALLED=0

if [ "$IS_CODESPACES" -eq 1 ]; then
    # Codespaces: try the remote CLI, but always fall back to manual instructions
    CS_CLI=$(ls ~/.vscode-remote/bin/*/bin/remote-cli/code 2>/dev/null | head -n1)
    if [ -n "$CS_CLI" ]; then
        echo -e "${YELLOW}🔧 Using Codespaces CLI: $CS_CLI${NC}"
        if "$CS_CLI" --install-extension "$VSIX_FILE" --force; then
            INSTALLED=1
        fi
    fi
    if [ "$INSTALLED" -eq 0 ]; then
        echo ""
        echo -e "${YELLOW}⚠️  Automatic install not available in this Codespace.${NC}"
        echo -e "${CYAN}👉 Install manually (REQUIRED in Codespaces):${NC}"
        echo "   1. In the Explorer panel, locate: $VSIX_ABS"
        echo "   2. Right-click the file → 'Install Extension VSIX...'"
        echo "      (or Ctrl+Shift+P → 'Extensions: Install from VSIX...')"
        echo "   3. Reload the window (Ctrl+Shift+P → 'Developer: Reload Window')"
        echo ""
    fi
else
    # Regular VS Code / code-server
    if command -v code &> /dev/null; then
        code --install-extension "$VSIX_FILE" --force && INSTALLED=1
    elif command -v code-server &> /dev/null; then
        code-server --install-extension "$VSIX_FILE" --force && INSTALLED=1
    fi
    if [ "$INSTALLED" -eq 0 ]; then
        echo -e "${YELLOW}⚠️  VS Code CLI not found.${NC}"
        echo -e "${CYAN}👉 Install manually from VSIX: $VSIX_ABS${NC}"
    fi
fi

if [ "$INSTALLED" -eq 1 ]; then
    echo -e "${GREEN}✅ Shell Script Runner installed successfully!${NC}"
    echo -e "${YELLOW}👉 Reload the window to activate: Ctrl+Shift+P → 'Developer: Reload Window'${NC}"
fi

# Show usage instructions
echo ""
echo -e "${CYAN}⚙️  How to use:${NC}"
echo "1. Find any .sh file in your project"
echo "2. Right-click on it → '⚙️Run .sh'"
echo "3. Or click '⚙️Run .sh' in editor title when editing .sh files"
echo ""
echo -e "${GREEN}🎉 Ready to use! Right-click any .sh file → '⚙️Run .sh'${NC}"
echo ""

# ============================================
# Optional: clean up the build folder
# ============================================
read -p "Delete the build folder '$EXTNAME' now? (y/N): " CLEANUP
CLEANUP=${CLEANUP:-N}
if [[ "$CLEANUP" == "y" || "$CLEANUP" == "Y" ]]; then
    echo -e "${YELLOW}Removing build folder '$EXTNAME'...${NC}"
    cd ..
    rm -rf "$EXTNAME"
    echo -e "${GREEN}✅ Build folder removed.${NC}"
else
    echo -e "${CYAN}Keeping build folder at: $(pwd)/$EXTNAME${NC}"
fi

# Notes:
#   ✅ activationEvents includes onStartupFinished → command registers reliably
#   ✅ Menu items have NO "when" clause → they always show; .sh check is done in code
#   ✅ Works whether the command is invoked from the menu (URI) or the palette (active editor)
#   ✅ Codespaces-aware install with explicit manual VSIX fallback
#   ✅ Robust chmod handling (failure doesn't abort execution)
#   ✅ Uses `bash script.sh` so execute bit isn't strictly required
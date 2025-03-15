# ferhatkorkmaz11 dotfiles

## Terminal Customization
- **Terminal:** Iterm2
- **Color Scheme:** Import `fk11.itermcolors` as a custom scheme.
- **Font:** _Geist Mono Nerd Font_
- **Prompt:** Starship (use provided `starship.toml`)

---

## Neovim Customization
Use the provided `nvim` folder as your Neovim configuration. Neovim, Iterm2, and Starship will share the same unified color scheme.

### Neovim Keyboard Shortcuts

#### **General Keybindings**
| Keybinding | Action |
|------------|--------|
| `<Leader>e` | Toggle NvimTree |
| `<Leader>fe` | Focus on NvimTree |
| `<Leader>fr` | Find current file in NvimTree |
| `<Leader>ff` | Find files (Telescope) |
| `<Leader>fg` | Live grep (Telescope) |
| `<Leader>ft` | List buffers (Telescope) |
| `<Tab>` | Next buffer (Bufferline) |
| `<S-Tab>` | Previous buffer (Bufferline) |
| `<Leader>bd` | Close current buffer |
| `<Leader>fm` | Format buffer (Conform) |
| `<Leader>ca` | LSP Code Action |
| `gd` | Go to Definition (LSP) |
| `gr` | References (Trouble/LSP) |
| `<Leader>q` | Close quickfix list |

---

#### **NvimTree**
| Keybinding | Action |
|------------|--------|
| `t` | Open file in a new tab |
| `<Leader>e` | Toggle NvimTree |
| `<Leader>fe` | Focus NvimTree |
| `<Leader>fr` | Locate current file |

---

#### **Telescope**
| Keybinding | Action |
|------------|--------|
| `<Leader>ff` | Find files |
| `<Leader>fg` | Live grep |
| `<Leader>ft` | Buffers list |
| `<CR>` | Select & center |
| `<C-t>` | Open in new tab |

---

#### **Bufferline**
| Keybinding | Action |
|------------|--------|
| `<Tab>` | Next buffer |
| `<S-Tab>` | Previous buffer |
| `<Leader>bd` | Delete buffer |

---

#### **Copilot**
| Keybinding | Action |
|------------|--------|
| `<CR>` | Accept suggestion |
| `<M-CR>` | Open Copilot panel |
| `<Tab>` | Accept suggestion |
| `<M-]>` | Next suggestion |
| `<M-[>` | Previous suggestion |
| `<C-]>` | Dismiss suggestion |
| `gr` | Refresh Copilot panel |
| `[[` | Previous suggestion |
| `]]` | Next suggestion |
| `<Leader>ce` | Enable Copilot |
| `<Leader>cd` | Disable Copilot |

---

#### **Trouble**
| Keybinding | Action |
|------------|--------|
| `<Leader>xx` | Toggle diagnostics (Workspace) |
| `<Leader>xX` | Toggle diagnostics (Buffer) |
| `<Leader>xL` | Toggle location list |
| `<Leader>xQ` | Toggle quickfix list |
| `<Leader>cl` | LSP diagnostics panel (right) |
| `<Leader>cs` | Symbols panel |
| `gr` | LSP references panel (bottom) |

---

#### **Git (Neogit, Gitsigns & Diffview)**
| Keybinding | Action |
|------------|--------|
| `<Leader>gg` | Open Neogit |
| `]c` | Next Git hunk |
| `[c` | Previous Git hunk |
| `<Leader>gp` | Preview Git hunk |
| `<Leader>gh` | Reset Git hunk |
| `<Leader>do` | Open Diffview |
| `<Leader>dc` | Close Diffview |
| `<Leader>df` | File history (Diffview) |

---

#### **Which-Key**
`which-key.nvim` is configured to provide helpful visual hints when pressing the `<Leader>` key, improving shortcut discoverability.

---

#### **Lualine**
Displays mode, branch, diagnostics, encoding, file format, filetype, and cursor position. No custom shortcuts required.

---

#### **LSP (Mason & LSPConfig)**
| Keybinding | Action |
|------------|--------|
| `<Leader>ca` | Code actions |
| `gd` | Go to definition |
| `gr` | References |

---

#### **Conform (Formatter)**
| Keybinding | Action |
|------------|--------|
| `<Leader>fm` | Format current buffer |



# ferhatkorkmaz11 dotfiles

## Terminal customization
- Iterm2 is used as my terminal of choice. In order to customize it with custom colors utilize `fk11.itermcolors` by importing it as a custom color scheme. 
- The font that I use is _Geist Mono Nerd Font_. 
- To have nice and clean powerline setup install starship and use `starship.toml`

## Neovim customization
- Just use the nvim folder as your NeoVim configuration. At the end of the day Neovim, terminal, and Starship will all use the same color scheme.

### Neovim Keyboard Shortcuts

#### **General Keybindings**
| Keybinding | Action |
|------------|--------|
| `<Leader>e` | Toggle NvimTree (`:NvimTreeToggle`) |
| `<Leader>fe` | Focus on NvimTree (`:NvimTreeFocus`) |
| `<Leader>fr` | Find the current file in NvimTree (`:NvimTreeFindFile`) |
| `<Leader>ff` | Find files using Telescope (`:Telescope find_files`) |
| `<Leader>fg` | Live grep using Telescope (`:Telescope live_grep`) |
| `<Leader>ft` | List open buffers using Telescope (`:Telescope buffers`) |
| `<Tab>` | Cycle to the next buffer (`:BufferLineCycleNext`) |
| `<S-Tab>` | Cycle to the previous buffer (`:BufferLineCyclePrev`) |
| `<Leader>bd` | Close the current buffer (`:bdelete`) |
| `<Leader>fm` | Format the current buffer (`require("conform").format()`) |
| `<Leader>ca` | Trigger LSP code actions (`vim.lsp.buf.code_action`) |
| `gd` | Go to definition (`vim.lsp.buf.definition`) |
| `gr` | Find references (`vim.lsp.buf.references`) |
| `<Leader>q` | Close quickfix list (`:cclose`) |

---

#### **NvimTree**
| Keybinding | Action |
|------------|--------|
| `t` | Open file in a new tab |
| `<Leader>e` | Toggle NvimTree |
| `<Leader>fe` | Focus on NvimTree |
| `<Leader>fr` | Locate the current file in NvimTree |

---

#### **Telescope**
| Keybinding | Action |
|------------|--------|
| `<Leader>ff` | Find files |
| `<Leader>fg` | Live grep |
| `<Leader>ft` | Open buffers list |
| `<CR>` | Select the default action and center the preview |
| `<C-t>` | Open selection in a new tab |

---

#### **Bufferline**
| Keybinding | Action |
|------------|--------|
| `<Tab>` | Cycle to the next buffer |
| `<S-Tab>` | Cycle to the previous buffer |
| `<Leader>bd` | Delete the current buffer |

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
| `[[` | Jump to the previous suggestion |
| `]]` | Jump to the next suggestion |

---

#### **Lualine**
| Keybinding | Action |
|------------|--------|
| `N/A` | Displays mode, branch, diagnostics, encoding, file format, filetype, and cursor position |

---

#### **LSP (Mason & LSPConfig)**
| Keybinding | Action |
|------------|--------|
| `<Leader>ca` | Show code actions |
| `gd` | Go to definition |
| `gr` | Show references |

---

#### **Conform (Formatter)**
| Keybinding | Action |
|------------|--------|
| `<Leader>fm` | Format the current buffer |

---



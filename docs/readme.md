# segfault's home-manager config

## Apply
```bash
home-manager switch --flake .#segfault -b backup
```

## Neovim Keybinds

Leader = Space

### General

| Keybind | Action |
|---|---|
| `<leader>w` | Save file |
| `<leader>q` | Quit |
| `<Esc>` | Clear search highlight |

### Files

| Keybind | Action |
|---|---|
| `<leader>e` | Toggle file tree |
| `<leader>o` | Open Oil file manager |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Show open buffers |
| `<leader>fh` | Help tags |

### Git

| Keybind | Action |
|---|---|
| `<leader>gg` | Open Fugitive Git |
| `<leader>gd` | Open Diffview |
| `<leader>gc` | Close Diffview |

### Diagnostics / TODO

| Keybind | Action |
|---|---|
| `<leader>xx` | Toggle diagnostics |
| `<leader>xt` | Show TODOs |

### LSP

| Keybind | Action |
|---|---|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Show references |
| `K` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |

### Formatting

| Keybind | Action |
|---|---|
| `<leader>f` | Format current file |

### Buffers

| Keybind | Action |
|---|---|
| `<S-l>` | Next buffer |
| `<S-h>` | Previous buffer |
| `<leader>bd` | Delete buffer |

### Markdown

| Keybind | Action |
|---|---|
| `<leader>mp` | Toggle Markdown preview |
| `<leader>ms` | Stop Markdown preview |

### Dashboard

| Keybind | Action |
|---|---|
| `f` | Find file |
| `g` | Find text |
| `r` | Recent files |
| `e` | File tree |
| `o` | Oil file manager |
| `s` | Git status |
| `h` | Home Manager switch |
| `q` | Quit |

### For more Keybinds just type `:WhichKey`

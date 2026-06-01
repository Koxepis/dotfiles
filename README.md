<div align="center">

<pre align="center">
─────────────────────────────────────
             ~/.dotfiles             
─────────────────────────────────────
</pre>

[Oxocarbon]-tuned terminal stack.
**kitty** · **zsh / p10k** · **neovim** · **claude code** · **goose**

<br/>

</div>

---

## Stack

| Layer    | Tool                                       | Notes                                            |
| -------- | ------------------------------------------ | ------------------------------------------------ |
| Terminal | [kitty]                                    | `separator` tab bar, Oxocarbon palette           |
| Shell    | [zsh] + [oh-my-zsh] + [powerlevel10k]      | Lean + Frame multiline prompt                    |
| Editor   | [Neovim] + [LazyVim]                       | Lualine _bubbles_ statusline with live HMS clock |
| AI CLI   | [Claude Code] + [ccstatusline] + [tweakcc] | `dark-ansi` theme reads kitty palette            |
| AI CLI   | [Goose]                                    | Custom skills bundle                             |
| Font     | Maple Mono NF                              | Nerd Font patched, supports PUA glyphs           |

---

## Palette — Oxocarbon Dark

|                                                   | Hex       | Role                                 |
| ------------------------------------------------- | --------- | ------------------------------------ |
| ![](https://placehold.co/20x20/161616/161616.png) | `#161616` | Background                           |
| ![](https://placehold.co/20x20/262626/262626.png) | `#262626` | Chrome — p10k frame, kitty tab strip |
| ![](https://placehold.co/20x20/DDE1E6/DDE1E6.png) | `#DDE1E6` | Foreground                           |
| ![](https://placehold.co/20x20/6F6F6F/6F6F6F.png) | `#6F6F6F` | Foreground dim                       |
| ![](https://placehold.co/20x20/33B1FF/33B1FF.png) | `#33B1FF` | Blue — normal mode, active accent    |
| ![](https://placehold.co/20x20/42BE65/42BE65.png) | `#42BE65` | Green — insert, success              |
| ![](https://placehold.co/20x20/3DDBD9/3DDBD9.png) | `#3DDBD9` | Cyan — visual                        |
| ![](https://placehold.co/20x20/FF7EB6/FF7EB6.png) | `#FF7EB6` | Magenta — replace                    |
| ![](https://placehold.co/20x20/FFE97B/FFE97B.png) | `#FFE97B` | Yellow — command, warning            |
| ![](https://placehold.co/20x20/EE5396/EE5396.png) | `#EE5396` | Red — error, removed                 |

All four tools (kitty, p10k, nvim, Claude Code) reach for the same ANSI palette indices, so changing one swatch propagates everywhere.

---

## kitty

Tab bar in `separator` style. Titles centered inside an 18-column slot, separated by a thin `│` rule. Active tab tinted dark blue (`#15293D`, 15 % mix of `#33B1FF` into bg); inactive tab in `#262626` so it blends with the chrome strip.

<img src="./screenshots/kitty-tab.png" alt="kitty tab bar with active blue-tinted pill and italic inactive tabs" width="820"/>

```
kitty/
├── kitty.conf          tab bar + window + keybindings
├── colors.conf         Oxocarbon palette
├── paste_image.sh      cmd+shift+i → paste clipboard image
└── themes/             extra colorschemes (gruvbox, eldritch, …)
```

---

## zsh + powerlevel10k

Lean + Frame prompt, two lines, corner-framed. Directory truncated to the last segment. Right side carries exit status, command duration, and the clock.

<img src="./screenshots/p10k.png" alt="powerlevel10k Lean+Frame prompt" width="820"/>

> Lives in `$HOME`, not in this repo. Symlink or source from here.

---

## neovim

LazyVim base; a single custom plugin file overrides lualine into a _bubbles_ layout that mirrors the kitty active tab pill.

<img src="./screenshots/nvim.png" alt="LazyVim dashboard inside kitty, Oxocarbon-tuned" width="820"/>
<br/>
<img src="./screenshots/nvim-status-line.png" alt="lualine bubbles statusline in NORMAL, INSERT and VISUAL modes" width="820"/>

- Mode pill recolors per mode — blue / green / cyan / magenta / yellow.
- Branch + diff + diagnostics + filetype + progress + ticking HMS clock + cursor location.
- Clock ticks every second via `vim.uv.new_timer` + `redrawstatus`.

```
nvim/
├── init.lua
├── lazy-lock.json
├── lazyvim.json
├── lua/
│   ├── config/         LazyVim overrides
│   └── plugins/
│       ├── lualine.lua       bubbles, Oxocarbon-tuned
│       ├── colorscheme.lua
│       └── …
└── .prettierrc.json
```

---

## claude code

`dark-ansi` theme pulls every color from the terminal's ANSI palette, so Claude Code automatically inherits Oxocarbon from kitty. `ccstatusline` drives the per-session statusline (jj-root-dir · git-branch · git-changes · free-memory).

<img src="./screenshots/claude-code.png" alt="Claude Code welcome screen with Oxocarbon palette and ccstatusline" width="820"/>

Files:

- `~/.claude/settings.json` — `theme: dark-ansi`, statusline command
- `ccstatusline/settings.json` — widget layout
- `~/.tweakcc/` — backup binary + JS patches (used to tune diff colors)

A pre-tweakcc snapshot of the Claude binary lives at `~/.claude-tweakcc-backup/` (see `RESTORE.md` inside).

---

<div align="center">

<pre align="center">─────────────────────────────────────</pre>

Built around Oxocarbon. Tuned by hand.

<pre align="center">─────────────────────────────────────</pre>

</div>

[Oxocarbon]: https://github.com/nyoom-engineering/oxocarbon.nvim
[kitty]: https://sw.kovidgoyal.net/kitty/
[zsh]: https://www.zsh.org/
[oh-my-zsh]: https://ohmyz.sh/
[powerlevel10k]: https://github.com/romkatv/powerlevel10k
[Neovim]: https://neovim.io/
[LazyVim]: https://www.lazyvim.org/
[Claude Code]: https://docs.anthropic.com/en/docs/claude-code
[ccstatusline]: https://github.com/sirmalloc/ccstatusline
[tweakcc]: https://github.com/Piebald-AI/tweakcc
[Goose]: https://github.com/block/goose

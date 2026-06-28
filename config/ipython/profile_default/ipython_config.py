import subprocess

from prompt_toolkit.styles import Style, merge_styles

from IPython.terminal.interactiveshell import TerminalInteractiveShell

c = get_config()  # noqa: F821

# Emit 24-bit color escapes instead of 256-color palette indices. Without this
# prompt_toolkit approximates colors to the xterm-256 palette, and the default
# completion menu's black text (#000000) collapses onto palette index 16 — which
# the tokyonight kitty theme remaps to orange (#ff9e64). That remap is why the
# completion menu showed up orange. Truecolor sidesteps the palette entirely.
c.TerminalInteractiveShell.true_color = True


def _is_light_mode():
    """True when macOS is in Light appearance.

    This is the same upstream signal `dark-notify` watches to swap the kitty /
    lazygit / delta themes, so the completion menu stays in sync with everything
    else. The `AppleInterfaceStyle` global default is "Dark" in dark mode and
    absent (non-zero exit) in light mode. Default to dark on any failure.
    """
    try:
        result = subprocess.run(
            ["defaults", "read", "-g", "AppleInterfaceStyle"],
            capture_output=True,
            text=True,
            timeout=1,
        )
    except Exception:
        return False
    return result.returncode != 0 or "dark" not in result.stdout.lower()


# Tokyonight-flavored completion menu, matched to the active light/dark theme.
#
# In IPython 9 + prompt_toolkit 3 the completion menu is styled by prompt_toolkit
# *class* names ("completion-menu.completion", ...), NOT by pygments tokens. So
# the documented `highlighting_style_overrides` (a pygments-token dict, mapped to
# "pygments.*" classes) can never reach the menu. The only injection point is the
# prompt_toolkit Style itself, which IPython exposes via `self._style` (read live
# through a DynamicStyle). `refresh_style()` is the single chokepoint that rebuilds
# it — on startup and on every theme change — so we wrap it and merge our classes
# on top each time.
_TOKYONIGHT_STORM_MENU = {  # dark
    "completion-menu": "bg:#1a1b26 #c0caf5",
    "completion-menu.completion": "bg:#1a1b26 #c0caf5",
    "completion-menu.completion.current": "bg:#7aa2f7 #1a1b26",
    "completion-menu.meta.completion": "bg:#16161e #565f89",
    "completion-menu.meta.completion.current": "bg:#7aa2f7 #1a1b26",
    "scrollbar.background": "bg:#292e42",
    "scrollbar.button": "bg:#7aa2f7",
}

_TOKYONIGHT_DAY_MENU = {  # light
    "completion-menu": "bg:#c4c8da #3760bf",
    "completion-menu.completion": "bg:#c4c8da #3760bf",
    "completion-menu.completion.current": "bg:#2e7de9 #e1e2e7",
    "completion-menu.meta.completion": "bg:#b6bbd1 #6172b0",
    "completion-menu.meta.completion.current": "bg:#2e7de9 #e1e2e7",
    "scrollbar.background": "bg:#b6bbd1",
    "scrollbar.button": "bg:#2e7de9",
}

# Mode is resolved once at startup (when this config loads). Switching macOS
# appearance mid-session won't repaint a running prompt — same as the rest of
# the tooling, which reloads on theme switch rather than live-updating.
_COMPLETION_MENU_STYLE = Style.from_dict(
    _TOKYONIGHT_DAY_MENU if _is_light_mode() else _TOKYONIGHT_STORM_MENU
)

_original_refresh_style = TerminalInteractiveShell.refresh_style


def _refresh_style_with_tokyonight_menu(self):
    _original_refresh_style(self)
    self._style = merge_styles([self._style, _COMPLETION_MENU_STYLE])


TerminalInteractiveShell.refresh_style = _refresh_style_with_tokyonight_menu

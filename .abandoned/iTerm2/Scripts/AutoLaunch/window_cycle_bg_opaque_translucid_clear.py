#!/usr/bin/env python3

import iterm2

async def main(connection):
    app = await iterm2.async_get_app(connection)

    @iterm2.RPC
    async def window_cycle_bg_opaque_translucid_clear():
        window = app.current_window
        if window is not None:
            profile = await window.current_tab.current_session.async_get_profile()

            if profile.transparency == 0.0:
                await profile.async_set_transparency(0.15)
                await profile.async_set_blur(False)
                await profile.async_set_blur_radius(0)
            elif profile.transparency == 0.15:
                await profile.async_set_transparency(0.35)
            elif profile.transparency == 0.35:
                await profile.async_set_transparency(1.0)
            elif profile.transparency == 1.0:
                await profile.async_set_transparency(0.0)
            else:
                await profile.async_set_transparency(1.0)

        else:
            print("No current window")

    await window_cycle_bg_opaque_translucid_clear.async_register(connection)

iterm2.run_forever(main)

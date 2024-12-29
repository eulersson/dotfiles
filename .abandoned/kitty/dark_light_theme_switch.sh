#!/bin/bash

if [[ "$DARKMODE" -eq 1 ]]; then
	/usr/local/bin/kitty +kitten themes --reload-in=all Tokyo Night Storm
fi

if [[ "$DARKMODE" -eq 0 ]]; then
	/usr/local/bin/kitty +kitten themes --reload-in=all Tokyo Night Day
fi

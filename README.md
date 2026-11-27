# KOReader, calm, on the Libra Colour

A small bundle that installs KOReader beside Kobo's own reader,
set up quietly.
Nothing here replaces the Kobo software; both stay.

## What's in `kobo/`

The folder mirrors the Kobo's own drive, so installing is a copy.

- `.adds/nm/koreader` adds a KOReader item to NickelMenu.
- `.adds/koreader/settings.reader.lua` sets the calm starting points.
- `.adds/koreader/fonts/` holds Atkinson Hyperlegible, calm's body face.
- `.adds/koreader/styletweaks/calm.css` is one optional tweak: ragged-right, soft paragraph gaps, quieter headings.

## Install

This uses the NickelMenu route.
It survives Kobo firmware updates, which the KFMon route doesn't.

1. Plug the Kobo in and let it mount.
2. Download NickelMenu's [KoboRoot.tgz](https://github.com/pgaskin/NickelMenu/releases/latest/download/KoboRoot.tgz) into the Kobo's `.kobo/` folder.
3. Download `koreader-kobo-*.zip` from [KOReader releases](https://github.com/koreader/koreader/releases) and extract its `koreader` folder into `.adds/` on the Kobo.
4. Copy this bundle's `kobo/.adds/` over the Kobo's `.adds/`, merging.
5. In `.kobo/Kobo/Kobo eReader.conf`, under `[FeatureSettings]`, make sure this line is there, so the Kobo doesn't index KOReader's own files as books:

```ini
ExcludeSyncFolders=(\\.(?!kobo|adobe).+|([^.][^/]*/)+\\..+)
```

6. Eject and unplug. The Kobo restarts once; KOReader then sits in the main menu.

## Settings to tap once

These live in tables KOReader builds itself, so they're safer set by hand.

- Status bar: tap the bottom bar until only one item shows, or long-press it and keep just "pages left in chapter". Turn off the clock and battery if they pull at you.
- Screen, E-ink: switch on "avoid mandatory black flashes in UI".
- Top menu, the gear, Taps and gestures: keep the page-turn buttons as they are; they work out of the box.
- Book menu, Style tweaks: tick "calm" under user style tweaks if you like it.
- Night reading: the warmth slider in the frontlight panel, rather than night mode, is gentler on colour e-ink.

## Books on both sides

Every book on the Kobo shows up in both readers; they read the same files.
What doesn't cross over is where you're up to, highlights, and calibre's shelves.
Each reader keeps its own.

## Undo

Delete `.adds/koreader` and `.adds/nm/koreader`.
To remove NickelMenu too, create an empty file named `.adds/nm/uninstall` and restart.

## Licence

MIT for this bundle.
Atkinson Hyperlegible is the Braille Institute's, under the SIL Open Font License; its licence sits beside the font.

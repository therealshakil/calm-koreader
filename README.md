# KOReader, calm, on the Libra Colour

A small bundle that installs KOReader beside Kobo's own reader,
set up quietly.
Nothing here replaces the Kobo software; both stay.

## What's in `kobo/`

The folder mirrors the Kobo's own drive, so installing is a copy.

- `.adds/nm/koreader` adds a KOReader item to NickelMenu.
- `.adds/koreader/settings.reader.lua` sets the starting points, close to the Kobo reader's own look.
- `.adds/koreader/fonts/libron/` holds Libron, a book serif made for e-ink, used when a book has no fonts of its own.
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

## Plugins

Each goes in `.adds/koreader/plugins/`, from its latest release zip.

- [Bookshelf](https://github.com/AndyHazz/bookshelf.koplugin) is the library: shelves of covers, with the current book on top.
  It needs Cover Browser on, and can't run alongside Project: Title or other library plugins.
  Make a shelf from each collection to see the calibre shelves as cover shelves.
- [bookends](https://github.com/AndyHazz/bookends.koplugin) lays out the lines above and below the page.
- [appstore](https://github.com/omer-faruq/appstore.koplugin) installs and updates plugins on the Kobo itself.
- [Menu customizer](https://github.com/JoeBumm/Koreader-Menu-customizer) hides menu items you don't use.
- [kobo.koplugin](https://github.com/OGKevin/kobo.koplugin) keeps reading progress in step with the Kobo reader.
  Its three `2-*.lua` patches go in `.adds/koreader/patches/`.
  It writes progress into the Kobo's own database, so back up `.kobo/KoboReader.sqlite` first.

- [Ink Away](https://github.com/EmirErtorer/ink-away.koplugin) is for writing with the pen: notebooks, drawings, and ink on any book that follows the text.
  Palm rejection needs KOReader 2026.07 or newer. Use one pen plugin at a time.

More fonts: the core set from [ebook-fonts](https://github.com/nicoverbruggen/ebook-fonts) (the `other-core-fonts` zip, not the `kobo` one) goes in `.adds/koreader/fonts/`.

## Settings to tap once

These live in tables KOReader builds itself, so they're safer set by hand.

- Screen, E-ink: switch on "avoid mandatory black flashes in UI".
- Physical buttons: match the page-turn direction to the Kobo reader's.
- Book menu, Style tweaks: tick "calm" under user style tweaks if you like it.
- Night reading: the warmth slider in the frontlight panel, rather than night mode, is gentler on colour e-ink.

## Books on both sides

Every book on the Kobo shows up in both readers; they read the same files.
The calibre skill's `koreader` mode makes KOReader follow calibre's shelves, and kobo.koplugin carries reading progress across.
Highlights stay with the reader they were made in.

## Why USB, not wireless

KOReader can take books from calibre over Wi-Fi, but calibre sends them as plain EPUB.
Over USB, calibre sends KEPUB, which both readers handle well, and shelves arrive straight away.
So USB is the one route here: the right format in both readers, and nothing listening on the network.

## Undo

Delete `.adds/koreader` and `.adds/nm/koreader`.
To remove NickelMenu too, create an empty file named `.adds/nm/uninstall` and restart.

## Licence

MIT for this bundle.
Libron is Nico Verbruggen's, based on Newsreader, under the SIL Open Font License; its licence sits beside the font.

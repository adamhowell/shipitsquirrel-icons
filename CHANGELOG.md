# Changelog

## [0.1.0] — 2026-04-25

Initial release as the maintained successor to `rails_feather`.

- Forked from `rails_feather` 0.1.0 (Abeid Ahmed, MIT).
- Renamed gem to `shipitsquirrel-icons`; module is
  `Shipitsquirrel::Icons` (helper kept as `feather_icon` for
  drop-in compatibility).
- Reorganized icon storage into `compressed/feather/` and
  `icons/feather/` so future packs (Heroicons, Lucide, Tabler) can
  sit alongside.
- Required Ruby bumped to `>= 3.0`.
- Railtie modernized to use `ActiveSupport.on_load(:action_view)`.
- `bin/compress` rewritten to walk multiple packs.
- 287 icons (vs 286 in `rails_feather` 0.1.0 — adds `table`).
- Test suite ported to the new namespace.

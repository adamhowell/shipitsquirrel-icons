# Changelog

## [0.1.0] — Unreleased

Initial release as the maintained successor to `rails_feather`.

- Forked from `rails_feather` 0.1.0 (Abeid Ahmed, MIT).
- Renamed gem to `shipitsquirrel-icons` and module to
  `Shipitsquirrel::Icons` (helper kept as `feather_icon`).
- Reorganized icon storage into `compressed/feather/` to leave
  room for additional packs in future versions.
- Updated `required_ruby_version` to `>= 3.0`.
- Modernized Railtie to use `ActiveSupport.on_load(:action_view)`.
- Same 286 icons as `rails_feather` 0.1.0; refresh against the
  current upstream Feather release will follow as 0.2.0.

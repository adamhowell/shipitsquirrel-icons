# shipitsquirrel-icons

Inline SVG icons for Rails. Drop-in `feather_icon` view helper with the
current Feather icon set, kept up to date.

A modernized successor to [`rails_feather`](https://github.com/abeidahmed/rails_feather)
(unmaintained since 2021) — same helper API, fresh icons, room to add
other packs (Heroicons, Lucide, Tabler) in future versions.

Part of the [ShipItSquirrel](https://github.com/adamhowell?tab=repositories&q=shipitsquirrel)
family of dev tools.

## Install

```ruby
# Gemfile
gem "shipitsquirrel-icons"
```

```bash
bundle install
```

That's it — the helper auto-loads via Railtie.

## Usage

```erb
<%= feather_icon "table" %>
<%= feather_icon "activity", size: 20 %>
<%= feather_icon "mail", class: "w-5 h-5", aria: { label: "Inbox" } %>
<%= feather_icon "bell", stroke_width: 1.5, class: "text-red-500" %>
```

The first arg is the icon name (matches the SVG filename — see
[feathericons.com](https://feathericons.com) for the full set, or
`compressed/feather/` in this repo).

### Options

| Option         | Default | Notes                                              |
| -------------- | ------- | -------------------------------------------------- |
| `size:`        | `24`    | Sets `width` and `height` on the `<svg>`.          |
| `stroke_width:`| `2`     | Sets `stroke-width` on the `<svg>`.                |
| any other kwarg|         | Forwarded to the `<svg>` (class, style, data, aria)|

### Accessibility

If you don't pass `aria-label` (or `aria: { label: "..." }`), the icon
is treated as decorative — `aria-hidden="true"` is set automatically.
If you do, `role="img"` is set so assistive tech announces it.

## Why this gem instead of `rails_feather`

`rails_feather` last shipped in 2021 and is missing icons that have
since been added upstream (`table`, `tablet-landscape`, `git-pull-request-arrow`,
etc.). This gem is a drop-in replacement with:

- The current Feather icon set (re-synced periodically — see CHANGELOG).
- An icon-pack subdirectory layout so we can add other libraries
  later (`compressed/feather/`, room for `compressed/heroicons/`, etc.).
- Active maintenance.

## Contributing

PRs welcome — especially for missing icons (drop in the SVG, run the
README icon-list updater) or new helpers for additional icon packs.

## License

MIT — see `LICENSE.txt`. Original `rails_feather` work © Abeid Ahmed
(2021); ShipItSquirrel modernization © Adam Howell (2026). Feather
icon SVGs themselves © Cole Bemis (MIT).

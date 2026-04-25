require "action_view"

module Shipitsquirrel
  module Icons
    # ActionView helpers exposed automatically when this gem is
    # loaded into a Rails app (via Railtie). Single helper for now
    # — `feather_icon`. Future siblings (`heroicon`, `lucide_icon`)
    # will sit alongside as separate methods.
    module Helper
      # Render a Feather icon by name.
      #
      #   <%= feather_icon "table" %>
      #   <%= feather_icon "activity", size: 20 %>
      #   <%= feather_icon "mail", class: "w-5 h-5", aria: { label: "Inbox" } %>
      #
      # See https://feathericons.com for the full icon set. Available
      # names match the SVG filenames bundled in compressed/feather/.
      #
      # Defaults: size 24, stroke-width 2. Override via the `size:`
      # and `stroke_width:` keyword args. Any other keyword/HTML
      # attribute (class, style, data: { ... }, aria: { ... }) is
      # passed through to the wrapping <svg>.
      def feather_icon(icon_name, **options)
        icon = Shipitsquirrel::Icons::Feather.new(icon_name, **options)
        content_tag(:svg, icon.svg_path.html_safe, icon.options)
      end
    end
  end
end

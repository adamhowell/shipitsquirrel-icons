module Shipitsquirrel
  module Icons
    # Renders a single feather icon as an inline SVG. Reads the bundled
    # SVG file from the gem's `compressed/feather/` directory and
    # decorates it with the standard feather attributes plus any
    # caller-supplied HTML attributes.
    #
    # Constructed indirectly via the `feather_icon` view helper —
    # callers don't normally instantiate this class.
    class Feather
      attr_reader :options

      def initialize(icon, size: 24, stroke_width: 2, **options)
        @icon = icon.to_s
        @options = options

        @options.merge!(a11y)
        @options.merge!(
          fill: "none",
          stroke: "currentColor",
          viewBox: "0 0 24 24",
          version: 1.1,
          width: size,
          height: size,
          "stroke-width": stroke_width,
          "stroke-linecap": "round",
          "stroke-linejoin": "round"
        )
      end

      # Returns the inner content of the SVG (path/circle/etc. nodes
      # only, not the wrapping <svg>). Raises a clear error if the
      # icon name doesn't match a bundled SVG.
      def svg_path
        file_path = "#{Icons.icon_path}/#{@icon}.svg"
        raise "Couldn't find icon for #{@icon}" unless File.exist?(file_path)

        File.read(file_path)
      end

      private

      # If the caller didn't supply an aria-label, the icon is
      # decorative — hide it from assistive tech. If they did, treat
      # it as meaningful imagery (role="img").
      def a11y
        accessible = {}

        if @options[:"aria-label"].nil? && @options["aria-label"].nil? && @options.dig(:aria, :label).nil?
          accessible[:"aria-hidden"] = "true"
        else
          accessible[:role] = "img"
        end

        accessible
      end
    end
  end
end

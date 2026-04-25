require_relative "shipitsquirrel/icons/version"
require_relative "shipitsquirrel/icons/feather"
require_relative "shipitsquirrel/icons/railtie" if defined?(Rails)

module Shipitsquirrel
  module Icons
    # Where the bundled SVG icons live. Currently a single pack
    # (Feather). Future packs (Heroicons, Lucide, Tabler) will sit
    # in sibling subdirectories under compressed/.
    def self.icon_path
      File.expand_path(File.join(__dir__, "..", "compressed", "feather"))
    end
  end
end

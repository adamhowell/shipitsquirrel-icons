require_relative "helper"

module Shipitsquirrel
  module Icons
    class Railtie < Rails::Railtie
      # Make `feather_icon` available in every view automatically.
      # If we ever add a configuration option to opt out, this is
      # where it would live.
      initializer "shipitsquirrel_icons.helper" do
        ActiveSupport.on_load(:action_view) do
          include Shipitsquirrel::Icons::Helper
        end
      end
    end
  end
end

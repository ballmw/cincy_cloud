require 'refinerycms-base'

module Refinery
  module TwitterStreams

    class << self
      attr_accessor :root
      def root
        @root ||= Pathname.new(File.expand_path('../../', __FILE__))
      end
    end

    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "twitter_streams"
          plugin.pathname = root
          plugin.activity = {
            :class => TwitterStream,
            :title => 'username'
          }
        end
      end
    end
  end
end

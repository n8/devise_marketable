require "devise"
require "devise_marketable/version"

Devise.add_module :marketable, :model => 'devise_marketable/model', controller: :registrations

module DeviseMarketable

  module Controller
    extend ActiveSupport::Concern
    
    included do
      before_filter :set_tracking_cookies
    end

    def set_tracking_cookies
      cookies[:referring_url] = { :value => request.env['HTTP_REFERER'], :expires => 90.days.from_now } if cookies[:referring_url].blank?
      cookies[:landing_url] = { :value => request.url, :expires => 90.days.from_now } if cookies[:landing_url].blank?
    end
  end

  module RegistrationsController
    extend ActiveSupport::Concern

    included do
      alias :devise_build_resource :build_resource
      def build_resource(hash = nil); custom_build_resource(hash); end
    end

    def custom_build_resource(hash = nil)
      devise_build_resource(hash)

      if devise_mapping.marketable?
        add_marketing_bits
      end

      return self.resource
    end

    def add_marketing_bits
      self.resource.referring_url = cookies[:referring_url]
      self.resource.landing_url = cookies[:landing_url]
    end
  end

  class Engine < ::Rails::Engine

    ActiveSupport.on_load(:action_controller) do
      include DeviseMarketable::Controller
    end

    config.to_prepare do
      Devise::RegistrationsController.send :include, DeviseMarketable::RegistrationsController
    end
  end

end


module ActionView
  module Helpers
    module FormTagHelper

      # Uses Javascript 'document.write' to insert the authenticity token and hopefully make it a little more difficult for script kiddies
      # Add 'require 'javascript_auth_token' to the controllers that should use this method
      def token_tag
        unless protect_against_forgery?
          ''
        else
          auth_tag = tag(:input, :type => "hidden", :name => request_forgery_protection_token.to_s, :value => form_authenticity_token)
          '<!-- JS Auth Token -->' + javascript_tag("document.write('"  + auth_tag + "');")
        end
      end

    end
  end
end


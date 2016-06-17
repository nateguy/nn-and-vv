module Shared::ControllerMixins
  module WithPageIdClassDataHelpers
    module Errors
      DoubleBodyIdSetting = Class.new(RuntimeError)
    end

    module Concern
      def self.included(base)
        base.class_eval do
          helper_method :set_body_id
          helper_method :body_id
        end
      end

      private

      # Set body ID (for each page and mail template)
      def set_body_id(dom_id_string)
        raise Errors::DoubleBodyIdSetting if @template_body_id.present?
        @template_body_id = dom_id_string.to_s
      end

      # Read body ID
      def body_id
        @template_body_id
      end
    end
  end
end

module Shared::ControllerMixins
  module WithLocale
    LOCALE_SEPARATOR = '-'.freeze

    module Concern

      def self.included(base)
        base.class_eval do
          before_action :_set_locale_for_this_request
          after_action :_set_last_used_locale_for_this_request
          helper_method :valid_locale_from_params
        end
      end

      private

      def _set_locale_for_this_request
        # This will not set I18n.locale globally
        # since each controller resides in the forked thread/process
        # Not the main one
        I18n.config.locale = valid_locale_from_params
      end

      def _set_last_used_locale_for_this_request
        # This will not set I18n.locale globally
        # since each controller resides in the forked thread/process
        # Not the main one
        session[:_last_used_locale] = I18n.locale
      end

      def valid_locale_from_params
        @valid_locale_from_params ||= begin
          locale_from_params = params[:locale]
          if locale_from_params
            locale_from_params
          elsif valid_locale_from_session
            valid_locale_from_session
          else
            I18n.default_locale
          end.to_sym
        end
      end

      def valid_locale_from_session
        if ::I18n.config.available_locales.map(&:to_s).include?(locale_from_session.to_s)
          return session[:_last_used_locale]
        end

        nil
      end

      def locale_from_session
        session[:_last_used_locale]
      end
      
      def locale_with_correct_case
        @locale_with_correct_case ||= begin
          return nil if params[:locale].blank?

          original_locale_from_param = params[:locale]
          locale_parts = original_locale_from_param.split(LOCALE_SEPARATOR)

          if locale_parts.length <= 1
            # if it's zero still fine, will be considered as invalid locale in caller `valid_internal_locale_from_params`
            return original_locale_from_param
          elsif locale_parts.length > 2
            raise NotImplementedError
          end

          # locale_parts.length == 2
          if locale_parts.last == locale_parts.last.downcase
            "#{locale_parts.first}#{LOCALE_SEPARATOR}#{locale_parts.last.upcase}"
          else
            original_locale_from_param
          end
        end
      end
    end
  end
end

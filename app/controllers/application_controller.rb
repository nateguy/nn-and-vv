class ApplicationController < ActionController::Base
  include ::Shared::ControllerMixins::WithPageIdClassDataHelpers::Concern
  include ::Shared::ControllerMixins::WithLocale::Concern
  protect_from_forgery with: :exception
end

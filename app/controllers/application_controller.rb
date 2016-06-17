class ApplicationController < ActionController::Base
  include ::Shared::ControllerMixins::WithPageIdClassDataHelpers::Concern
  protect_from_forgery with: :exception
end

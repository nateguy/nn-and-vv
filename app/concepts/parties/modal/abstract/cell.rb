require "abstract_class"
require "action_view"

class Parties::Modal::Abstract::Cell < ApplicationConceptCell
  extend AbstractClass
  include ActionView::RecordIdentifier
  include ActionView::Helpers::FormHelper
  include SimpleForm::ActionViewExtensions::FormHelper
  include Cell::Haml

  def party
    @party ||= Party.new
  end
end

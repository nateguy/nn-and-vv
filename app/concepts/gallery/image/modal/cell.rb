class Gallery::Image::Modal::Cell < ApplicationConceptCell
  include ActionView::Helpers::AssetTagHelper

  def show
    render
  end

  attr_reader :image_path

end

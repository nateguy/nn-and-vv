class Gallery::Default::Cell < ApplicationConceptCell
  include ActionView::Helpers::AssetTagHelper

  def show
    render
  end

  private

  attr_reader :photo_links
  attr_reader :photo_links_thumbails

end

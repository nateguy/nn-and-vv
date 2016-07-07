class Gallery::Party::Cell < ApplicationConceptCell
  include ActionView::Helpers::AssetTagHelper

  def show
    render
  end

  private

  def wedding_party_team
    t("views.templates.wedding.the_team")
  end

  def groomsmen
    wedding_party_team[0,5]
  end

  def bridesmaids
    wedding_party_team[5,5]
  end
end

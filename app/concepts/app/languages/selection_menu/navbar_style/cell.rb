
class App::Languages::SelectionMenu::NavbarStyle::Cell < ::ApplicationConceptCell

  def show
    render
  end

  attr_reader :valid_locale_from_params

  private

  def current_url_for_locale(locale)
    url_for(params.merge({
        only_path: true,
        locale: locale.to_s,
    }))
  end
end

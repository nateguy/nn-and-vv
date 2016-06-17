class AppConfig < Settingslogic
  source Rails.root.join('config', 'app_config.yml')
  namespace Rails.env
end

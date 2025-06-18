require 'capybara/cucumber'
require 'selenium-webdriver'
require 'capybara-screenshot/cucumber'
require_relative '../pages/products_page'
require_relative '../pages/login_page'
require_relative '../pages/cart_page'

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new

  # ⚠️ Asegúrate de NO usar modo headless si quieres ver la ejecución
  # options.add_argument('--headless') # ❌ NO ACTIVES ESTO

  # ✅ Argumentos que mejoran compatibilidad visual y evitan interrupciones
  options.add_argument('--disable-features=PasswordLeakDetection')
  options.add_argument('--no-default-browser-check')
  options.add_argument('--no-first-run')
  options.add_argument('--disable-popup-blocking')
  options.add_argument('--disable-extensions')
  options.add_argument('--disable-notifications')
  options.add_argument('--incognito')
  options.add_argument('--start-maximized')

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

# ✅ Usamos el driver de Chrome visual
Capybara.default_driver = :chrome

# ✅ Host base
Capybara.app_host = 'https://www.saucedemo.com'

# ⏱️ Tiempo máximo de espera para elementos (puedes ajustar si es lento)
Capybara.default_max_wait_time = 5

# 📸 Captura automática si falla un test
Capybara::Screenshot.autosave_on_failure = true
Capybara::Screenshot.prune_strategy = :keep_last_run
Capybara.save_path = "./screenshots"  # crea una carpeta si no existe
Capybara::Screenshot.register_driver(:chrome) do |driver, path|
  driver.browser.save_screenshot(path)
end




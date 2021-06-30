class HomePage
  include Capybara::DSL

  def access_menu(menu)
    find(:xpath, "(//div[text()='#{menu}'])[1]").click
  end
end

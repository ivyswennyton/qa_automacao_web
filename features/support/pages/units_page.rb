class UnitsPage 
  include Capybara::DSL

  def open_facilities_filter
    find(:xpath, "//div[@id='checkoox-select-facilities']/div").click
  end

  def select_facilities(facilities)
    find(:xpath, "//input[@value='#{facilities}']/../..//label[text()='#{facilities}']").click
  end

  def facilities_first_card
    find(:xpath, "(//div[@class='unit-cellcomponentstyle__UnitCellStyled-sc-1rcmx1c-0 juXfhN'])[1]/div[1]/div").text
  end

  def name_first_unit
    find(:xpath, "(//h1)[1]").text
  end

  def view_details
    find(:xpath, "(//div[text()='Ver detalhes'])[1]").click
  end
end

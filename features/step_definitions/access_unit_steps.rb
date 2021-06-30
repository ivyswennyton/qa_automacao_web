Dado('que o usuario acessa o menu {string}') do |menu|
  visit '/'
  @page.call(HomePage).access_menu(menu)
end

Quando('selecionar {string} facilidade') do |opcoes|
  facilities = opcoes.split(', ')
  @page.call(UnitsPage).open_facilities_filter
  facilities.each do |f|
    @page.call(UnitsPage).select_facilities(f)
    expect(@page.call(UnitsPage).facilities_first_card).to include(f)
  end
  @page.call(UnitsPage).view_details
end

Então('devera visualizar o nome da unidade {string} na tela de detalhes') do |unit|
  expect(@page.call(UnitsPage).name_first_unit).to eql unit
end

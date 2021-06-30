Before do
  window = Capybara.current_session.current_window
  window.maximize

  @page = lambda do |klass|
    klass.new
  end
end

After do |snc|
  snc_name = snc.name.gsub(/\s+/, '').tr('/', '')
  if snc.failed?
    screenshot(snc_name.downcase!, 'falhou')
  else
    screenshot(snc_name.downcase!, 'passou')
  end
end

at_exit do
  @infos = {
    'Browser' => Capybara.default_driver.to_s.capitalize,
    'Data do Teste' => Time.now.strftime('%d/%B/%Y'),
    'Hora do Teste' => Time.now.strftime('%HH%MM%SS')
  }
  ReportBuilder.configure do |config|
    config.input_path = 'report/report.json'
    config.report_path = 'report/report'
    config.report_types = [:html]
    config.include_images = true
    config.report_title = '[Fleury] - QA Automação Web'
    config.additional_info = @infos
    config.color = 'indigo'
  end
  ReportBuilder.build_report
end

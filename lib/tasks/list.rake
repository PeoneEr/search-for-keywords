namespace :list do

  desc 'update zakupki'
  task :zakupki_dov => :environment do
    require Rails.root.join('lib/parsers/zakupki_gov.rb')
    a = ZakupkiGov.new
    a.parse
  end
end

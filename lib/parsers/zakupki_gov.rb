require 'open-uri'

class ZakupkiGov
  def parse
    url = 'http://zakupki.gov.ru/epz/order/quicksearch/update.html?placeOfSearch=FZ_44&_placeOfSearch=on&placeOfSearch=FZ_223&_placeOfSearch=on&_placeOfSearch=on&priceFrom=0&priceTo=200+000+000+000&publishDateFrom=&publishDateTo=&updateDateFrom=&updateDateTo=&orderStages=AF&_orderStages=on&orderStages=CA&_orderStages=on&_orderStages=on&_orderStages=on&sortDirection=false&sortBy=UPDATE_DATE&recordsPerPage=_50&pageNo=1&searchString=&strictEqual=false&morphology=false&showLotsInfo=false&isPaging=false&isHeaderClick=&checkIds='

    data = Nokogiri.HTML(open(url))
    data.css('.registerBox').each do |box|
      table = box.css('.descriptTenderTd')
      uid = table.css('dt a').text
      uid = uid.gsub(/[\r\n\u0084\u0096 ]/, '')[1..-1]
      p uid
      dt = table.css('dl dd').last
      info = dt.css('a').text
      Finder.create(uid: uid, content: info, source: 'zakupki.gov.ru')
    end
  end
end

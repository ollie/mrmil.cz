xml.instruct! :xml, :version => '1.0'
xml.rss :version => '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do
  xml.channel do
    xml.title 'Mrmil.cz'
    xml.description 'Nesmyslný zápisník'
    xml.language 'cs'
    xml.copyright "Copyright © #{ Time.now.year } Oldřich Vetešník"
    xml.lastBuildDate time_rss(Time.now)
    xml.link 'http://www.mrmil.cz/'
    xml.tag! 'atom:link', :rel => 'self', :href => 'http://www.mrmil.cz/stranky.rss', :type => 'application/rss+xml'

    @articles.each do |article|
      xml.item do
        xml.title article.name
        xml.link with_host(article.url)

        o = []
        o << "<p><em>#{ article.info }</em></p>"
        o << article.body

        xml.description o.join("\r\n")
        xml.author 'vetesnik@mrmil.cz (Oldřich Vetešník)'
        xml.guid with_host(article.url)
        xml.pubDate time_rss(article.date)
      end
    end
  end
end

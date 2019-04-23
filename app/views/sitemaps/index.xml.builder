xml.instruct! :xml, version: '1.0'
xml.tag! 'sitemapindex', 'xmlns' => "http://www.sitemaps.org/schemas/sitemap/0.9" do

  xml.tag! 'url' do
    xml.tag! 'home', root_url
  end

  xml.tag! 'gallery' do
    xml.tag! 'gallery', gallery_url
  end

  xml.tag! 'url' do
    xml.tag! 'wedding', wedding_url
  end

  xml.tag! 'url' do
    xml.tag! 'about', about_url
  end

  xml.tag! 'url' do
    xml.tag! 'contact', contact_url
  end

  @films.each do |film|
    xml.tag! 'url' do
      xml.tag! 'loc', film_url(film)
      xml.lastmod film.updated_at.strftime("%F")
    end
  end

end

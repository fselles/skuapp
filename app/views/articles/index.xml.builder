xml.instruct! :xml, :version=>"1.0", :encoding=>"utf8", :standalone=>"no" 
xml.ZALSMAN {
	@articles.each { |article|
		xml.SKU :name => article.name.to_s, :duplex => article.duplex.to_s, :media => article.media.to_s, :papiertype => article.papiertype.to_s, :inslag_staand => article.inslag_staand.to_s, :inslag_liggend => article.inslag_liggend.to_s, :kleur => article.kleur.to_s, :aantal_drukvel => article.aantal_drukvel.to_s
	}
}

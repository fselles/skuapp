json.array!(@articles) do |article|
  json.extract! article, :id, :name, :duplex, :media, :inslag_staand, :inslag_liggend, :kleur, :aantal_drukvel
  json.url article_url(article, format: :json)
end

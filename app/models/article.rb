class Article < ActiveRecord::Base

PAPIERTYPEN= ['coated', 'uncoated']
KLEUR= ['full color', 'zwart']
DUPLEX= ['yes', 'no']

validates_presence_of :name, :duplex, :media, :papiertype, :inslag_staand, :inslag_liggend, :kleur, :aantal_drukvel
validates_uniqueness_of :name


def self.to_csv(options = {})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |article|
      csv << article.attributes.values_at(*column_names)
    end
  end
end

# Hier nog aanpassing doen ivm afvangen foutmelding bij validation errors. Hoe terug geven aan controller en instance variabele gebruiken voor afdrukken fouten op scherm
def self.import(file)
	import_attributes = ["name", "duplex", "media", "papiertype", "inslag_staand", "inslag_liggend", "kleur", "aantal_drukvel"]
	CSV.foreach(file.path, headers: true) do |row|
		article = find_by_id(row["id"]) || new
		article.attributes = (row.to_hash.slice(*import_attributes))
		article.save!
		end
	end


def self.search(search)
	  where("name LIKE ?", "%#{search}%") 
	end


end

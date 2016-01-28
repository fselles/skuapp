class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :duplex
      t.string :media
      t.string :inslag_staand
      t.string :inslag_liggend
      t.string :kleur
      t.integer :aantal_drukvel

      t.timestamps null: false
    end
  end
end

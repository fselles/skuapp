class AddPapiertypeToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :papiertype, :string
  end
end

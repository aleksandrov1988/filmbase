class CreateFilms < ActiveRecord::Migration
  def self.up
    create_table :films do |t|
      t.string :name
      t.string :origin_name
      t.text :slogan
      t.integer :country_id
      t.integer :genre_id
      t.integer :director
      t.integer :length

      t.timestamps
    end
  end

  def self.down
    drop_table :films
  end
end

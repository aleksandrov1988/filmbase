class CreateFilmsPeople < ActiveRecord::Migration
  def self.up
    create_table :films_people,:id=>false do |t|
      t.integer :film_id
      t.integer :person_id
    end
  end

  def self.down
    drop_table :films_people
  end
end

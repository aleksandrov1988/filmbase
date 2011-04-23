class AddCoverAndTrailerFieldsToFilms < ActiveRecord::Migration
  def self.up
    add_column :films, :cover_file_name,    :string
    add_column :films, :cover_content_type, :string
    add_column :films, :cover_file_size,    :integer
    add_column :films, :cover_updated_at,   :datetime

    add_column :films, :trailer_url,    :string
  end

  def self.down
    remove_columns :films,:cover_file_name,:cover_content_type,:cover_file_size,:cover_updated_at,
                   :trailer_url
  end
end

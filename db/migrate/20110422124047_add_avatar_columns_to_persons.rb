class AddAvatarColumnsToPersons < ActiveRecord::Migration
  def self.up
       add_column :people, :avatar_file_name,    :string
    add_column :people, :avatar_content_type, :string
    add_column :people, :avatar_file_size,    :integer
    add_column :people, :avatar_updated_at,   :datetime
  end

  def self.down
    remove_column :people,:avatar_file_name,:avatar_content_type,:avatar_file_size,:avatar_updated_at
  end
end

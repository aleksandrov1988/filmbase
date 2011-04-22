class Country < ActiveRecord::Base
  default_scope order(:name)

  has_many :films,:order=>'name'  

  validates :name,:presence => true,:uniqueness => true
end

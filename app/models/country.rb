class Country < ActiveRecord::Base
  default_scope order(:name)
  validates :name,:presence => true,:uniqueness => true
end

class Genre < ActiveRecord::Base

  has_many :films,:order=>'name'

  default_scope order('name')
  
  validates :name,:presence => true,:uniqueness => true

  def can_be_edited?(user)
    user && user.admin?
  end
end

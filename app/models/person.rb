class Person < ActiveRecord::Base
  has_many :genres,:through => :films,:order => 'name'
  has_many :director_films,:class_name => "Film",:foreign_key => "director_id"
  has_and_belongs_to_many :films,:order=>'year'
  has_attached_file :avatar, :styles => { :medium => "150x", :thumb => "64x" }

  validates_attachment_content_type :avatar,:content_type=>/^image\/(gif|png|x\-png|jpeg|jpg|pjpeg)$/
  validates :name,:presence => true,:length=>{:minimum => 3}



  def sex
    male? ? 'мужской' : 'женский'
  end

  def human_sex
    male? ? 'мужчина' : 'женщина'
  end

  def can_be_edited?(user)
    user && user.admin?
  end
end

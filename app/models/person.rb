class Person < ActiveRecord::Base

  has_attached_file :avatar, :styles => { :medium => "128x128>", :thumb => "32x32>" }

  validates :name,:presence => true,:length=>{:minimum => 3}
  validates :male,:presence=>true


  def sex
    male? ? 'мужской' : 'женский'
  end

  def human_sex
    male? ? 'мужчина' : 'женщина'
  end
end

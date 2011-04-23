class Film < ActiveRecord::Base

  scope :full_load, includes(:genre, :country, :director, :people)

  belongs_to :country
  belongs_to :director,:class_name => "Person"
  belongs_to :genre
  has_and_belongs_to_many :people,:order => 'name'
  has_attached_file :cover, :styles => { :medium => "200x", :thumb => "64x" }

  validates_attachment_content_type :cover,:content_type=>/^image\/(gif|png|x\-png|jpeg|jpg|pjpeg)$/

  validates :name,:presence=>true
  validates :country_id,:presence => true
  validates :genre_id,:presence => true
  validates :length,:numericality => {:only_integer=>true,:greater_than=>0},:allow_blank => true
  validates :year,:numericality => {:only_integer=>true,:greater_than=>1900},:allow_blank => true
  validates :trailer_url,:format => /\w+/i,:allow_blank => true
  attr_reader :person_tokens

  def person_tokens=(ids)
    self.person_ids = ids.split(",")
  end

  def can_be_edited?(user)
    user && user.admin?
  end

  def title
    res=name
    res+=" (#{year})" if year
    res
  end
end

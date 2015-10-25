class Page < ActiveRecord::Base

  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :editors, :class_name => "AdminUser"

  validates_presence_of :name
  validates_length_of :name , :maximum => 255
  validates_presence_of :permalink
  validates_length_of :permalink, :within => 3..255
  validates_uniqueness_of :permalink #go into the DB and check if permalink is unique

  # I created a name "editors" for AdminUser class, just for easy-understanding.
  # This is called configurations, and make sure you have that :class_name=>"AdminUser" there,
  # or Rails would think that editors as your model

  scope :visible, lambda{ where :visible => true}
  scope :invisible, lambda { where :visible => false}
  scope :newest_first, lambda { order ("pages.position ASC")}
  scope :sorted, lambda { order ("pages.created_at DESC")}


end

class Section < ActiveRecord::Base

  has_many :section_edits
  belongs_to :page
  has_many :editors, :class_name => "AdminUser" , :through => :section_edits


  CONTENT_TYPES = ['text', 'HTML']

  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  validates_inclusion_of :content_type, :in => CONTENT_TYPES,
                         :message => "Must be one of :#{CONTENT_TYPES.join(', ')}"
  validates_presence_of :content

  scope :visible, lambda{ where :visible => true}
  scope :invisible, lambda { where :visible => false}
  scope :newest_first, lambda { order ("sections.position ASC")}
  scope :sorted, lambda { order ("sections.created_at DESC")}


end

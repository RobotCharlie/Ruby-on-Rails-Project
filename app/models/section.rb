class Section < ActiveRecord::Base

  has_many :section_edits
  belongs_to :page
  has_many :editors, :class_name => "AdminUser" , :through => :section_edits


  scope :visible, lambda{ where :visible => true}
  scope :invisible, lambda { where :visible => false}
  scope :newest_first, lambda { order ("sections.position ASC")}
  scope :sorted, lambda { order ("sections.created_at DESC")}


end

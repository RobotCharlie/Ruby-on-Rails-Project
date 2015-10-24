class Subject < ActiveRecord::Base

  has_many :pages

  validates_presence_of :name

  scope :visible, lambda{ where :visible => true}
  scope :invisible, lambda { where :visible => false}
  scope :newest_first, lambda { order ("subjects.position ASC")}
  scope :sorted, lambda { order ("subjects.created_at ASC")}
  scope :search, lambda { |words|
               where( ["name LIKE ?", "%#{words}%" ])
               }
end

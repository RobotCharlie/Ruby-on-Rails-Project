class AdminUser < ActiveRecord::Base

  # To configure a different table name
  #self.table_name = "admin_users"

  has_and_belongs_to_many :pages , :join_table => "admin_users_pages" # the later half syntax just
  # for customized join table, you can specified the join table that you customized.
  has_many :section_edits
  has_many :sections, :through => :section_edits
end
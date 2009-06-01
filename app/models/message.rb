class Message < ActiveRecord::Base
  acts_as_nested_set

  named_scope :recent, proc{
    { :order => "#{table_name}.created_at DESC",
      :limit => 10 }
  }

  named_scope :since, proc{ |id|
    { :conditions => ["id > ?", id],
      :order => "id ASC" }
  }

  named_scope :id_asc, proc{
    { :order => "id ASC"}
  }

  def self.tree(id)
    part = self.find(id)
    part.root.self_and_descendants.id_asc
  end
end

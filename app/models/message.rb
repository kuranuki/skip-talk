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
end

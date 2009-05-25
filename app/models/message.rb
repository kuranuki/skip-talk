class Message < ActiveRecord::Base

  named_scope :recent, proc{
    { :order => "#{table_name}.created_at DESC",
      :limit => 20 }
  }
end

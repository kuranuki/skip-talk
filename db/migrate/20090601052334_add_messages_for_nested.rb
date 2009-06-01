class AddMessagesForNested < ActiveRecord::Migration
  def self.up
    change_table :messages do |t|
      t.integer :parent_id, :lft, :rgt
    end
  end

  def self.down
    change_table :messages do |t|
      t.remove :parent_id, :lft, :rgt
    end
  end
end

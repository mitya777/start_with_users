class AddCurrentQuestsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :current_quests, :text
  end

  def self.down
    remove_column :users, :current_quests
  end
end

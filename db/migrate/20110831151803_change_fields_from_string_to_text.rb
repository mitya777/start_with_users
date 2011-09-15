class ChangeFieldsFromStringToText < ActiveRecord::Migration
  def self.up
    change_column :answers, :content, :text
    change_column :quests, :inspiration, :text
    change_column :quests, :question, :text
    change_column :urls, :address, :text
  end

  def self.down
    change_column :answers, :content, :string
    change_column :quests, :inspiration, :string
    change_column :quests, :question, :string
    change_column :urls, :address, :string
  end
end

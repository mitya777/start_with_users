class CreateQuestFeeds < ActiveRecord::Migration
  def self.up
    create_table :quest_feeds do |t|
      t.integer :user_id
      t.text :feed

      t.timestamps
    end
  end

  def self.down
    drop_table :quest_feeds
  end
end

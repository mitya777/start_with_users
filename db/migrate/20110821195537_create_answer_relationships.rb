class CreateAnswerRelationships < ActiveRecord::Migration
  def self.up
    create_table :answer_relationships do |t|
      t.integer :quest_id
      t.integer :answer_id

      t.timestamps
    end
  end

  def self.down
    drop_table :answer_relationships
  end
end

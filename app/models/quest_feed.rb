class QuestFeed < ActiveRecord::Base
  belongs_to :user

  serialize :feed

  def set_current_quest(quest)
    feed.delete({:id => quest.id, :question => quest.question})
    feed.push({:id => quest.id, :question => quest.question})
  end

  def get_current_quests(first, total)
    feed.slice(first, total)
  end
                      


end

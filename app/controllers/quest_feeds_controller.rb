class QuestFeedsController < ApplicationController

  def set(quest)
    current_user.quest_feed.set_current_quest
  end

  def get
    range = current_user.quest_feed.get_current_quests(params[:first].to_i, params[:total].to_i)
    render :json => { :quest_feed => range.to_json }
  end
end

class QuestsController < ApplicationController
  before_filter :authenticate

  def index
    @title = "#{current_user.name}'s Quests"
    @quests = current_user.quests.paginate :page => params[:page],
                                           :per_page => 10, :order => "created_at DESC"
  end

  def create
    @quest = current_user.quests.build params[:quest]
    @quest.save!
    current_quest = @quest
    respond_to do |format|
      format.json {render :text => @quest.to_json}
    end
  end
end

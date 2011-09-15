class QuestsController < ApplicationController
  before_filter :authenticate

  def index
    @title = "#{current_user.name}'s Quests"
    @quests = current_user.quests.paginate :page => params[:page],
                                           :per_page => 10, :order => "created_at DESC"
  end

  def create
    @quest = current_user.quests.build params[:quest]
    set_current_quest @quest if @quest.save!
    Rails.logger.debug "CURRENT QUEST(controller): #{cookies[:quest_token] unless cookies[:quest_token].blank?}"
    respond_to do |format|
      format.json {render :json => @quest.to_json}
    end
  end

  def update
    @quest = Quest.find(params[:id])
    if @quest.update_attributes(params[:quest])
      render :json => @quest.to_json, :include => "answers"
    else
      render :json => {:quest => nil}
    end
  end

  def current
    Rails.logger.debug "CURRENT QUEST(current): #{cookies[:quest_token] unless cookies[:quest_token].blank?}"
    if current_quest? 
      render :json => current_quest.to_json
    else
      render :json => {:quest => nil}
    end
  end

  def clear_current
    clear_current_quest
    respond_to do |format|
      format.json do
        if !current_quest?
          render :json => {:result => :success}
        else
          render :json => {:result => :fail}
        end
      end
    end
  end
end

class MessagesController < ApplicationController
  before_action:set_request_from
  def index

  end
  def profile
    me =  current_user.profile.id
    who = params[:id]
    @whoProfile = Profile.find(who)
    @relation = Relation.where('profile_id':me,'target_profile_id':who)
    if @whoProfile.check_relation_status(me) != 'matching'
      redirect_to profiles_path
    end
    @messages = Message.where(from_id: me, to_id: who).or(Message.where(from_id: who, to_id: me)).page(params[:page]).per(5)
  
    # from_id = me and to_id = who
    # or
    # from_id = who and to_id = me    
    @message = Message.new
  end
  def new
    
  end
  
  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to :action => "profile", :id => @message.to_id
    else
    
    end     
  end
  def destroy
      @message = Message.find(params[:id])
      @message.destroy
     redirect_to :action => "profile", :id => @message.to_id
  end
  private
  def message_params
    params.require(:message).permit(:from_id,:to_id,:body)
  end 
  
  def set_request_from
    if session[:request_from]
      @request_from = session[:request_from]
    end
    # 現在のURLを保存しておく
    session[:request_from] = request.original_url
  end  
  def return_back
    if request.referer
      redirect_to :back and return true
    elsif @request_from
      redirect_to @request_from and return true
    end
  end  
end

class RelationsController < ApplicationController
  before_action:set_relation
  def new
  end
  def create
    # 過去に同じ相手とのリレーションがあった場合は削除
    old_relation = Relation.where('profile_id':params['relation']['profile_id'],'target_profile_id':params['relation']['target_profile_id'])
    if old_relation.size > 0
      old_relation.destroy_all
    end
  
    relation = Relation.new
    relation.profile_id = params['relation']['profile_id']
    relation.target_profile_id = params['relation']['target_profile_id']
    relation.status = params['relation']['status']
    relation.save
    status = Profile.find(params['relation']['target_profile_id']).check_relation_status(params['relation']['profile_id'])
  
    result = {'status' => status}
    render :json => result

  end
  def destroy_ajax
    if request.xhr?
      relation = Relation.where('profile_id':params['relation']['profile_id'],'target_profile_id':params['relation']['target_profile_id'])
      relation[0].destroy
      status = Profile.find(params['relation']['target_profile_id']).check_relation_status(params['relation']['profile_id'])
    
      result = {'status' => status}
      render :json => result
    else
    
    end
  end
  def destroy
  end
  private
    def relation_params
    params.require(:profile).permit(:profile_id,:target_id,:status)
  end
  def set_relation
    
  end
end
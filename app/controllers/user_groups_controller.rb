class UserGroupsController < ApplicationController

  def create
    user_group = current_user.user_groups.build(group_id: params[:group_id])
    user_group.save
    redirect_to groups_path
  end

  def destroy
    user_group = UserGroup.find_by(group_id: params[:group_id], user_id: current_user.id)
    user_group.destroy
    redirect_to groups_path
  end

end

class GroupsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @groups = Group.all
    @new_group = Group.new
    @user = current_user
  end

  def show
    @group = Group.find(params[:id])
    @users = @group.users
    @list = List.new
  end

  def new
    @group = Group.new
  end

  def create
    @user = current_user
    @group = @user.groups.new(group_params)
    if @user.save
      redirect_to groups_path
    else
      redirect_to new_group_path
    end
  end


  private
    def group_params
      params.require(:group).permit(:title, :color)
    end
end

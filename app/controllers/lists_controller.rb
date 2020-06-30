class ListsController < ApplicationController

  def index
  end

  def create
    @list = List.new(list_params)
    @group = Group.find(params[:group_id])
    @list.group_id = @group.id
    @list.save
    redirect_to groups_path
  end

  def show
  end

  def edit
  end

  private
    def list_params
      params.require(:list).permit(:title, :color)
    end
end

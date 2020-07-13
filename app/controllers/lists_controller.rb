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
    @list = List.find(params[:id])
    @group = @list.group
    @tasks = @list.tasks
  end

  def edit
  end

  def switch
    # todoリストに表示するか否かの関数
    @list = List.find(params[:id])
    if @list.indication == 0
      @list.indication = 1
    else
      @list.indication = 0
    end
    @list.save
    redirect_to groups_path
  end

  private
    def list_params
      params.require(:list).permit(:title, :color)
    end
end

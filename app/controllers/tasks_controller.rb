class TasksController < ApplicationController
  def index
  end

  def show
  end

  def create
    @user = current_user
    @task = @user.tasks.new(task_params)
    @list = List.find(params[:list_id])
    @task.list_id = @list.id
    @task.todo = 0
    @task.save
    # pathのために生成
    @group = Group.find(params[:group_id])
    redirect_to group_list_path(@group, @list)
  end

  def destroy
    # @group = Group.find(params[:group_id])
    # @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to groups_path
  end

  # todo,doing,doneを移動させる関数
  def change
    # @group = Group.find(params[:group_id])
    # @list = List.find(params[:list_id])
    @task = Task.find(params[:id])
    if @task.todo == 0
      @task.todo = 1
      @task.save
      redirect_to groups_path
    elsif @task.todo == 1
      @task.todo = 2
      @task.save
      redirect_to groups_path
    # elsif @task.todo == 2
    #   @task.delete  # destroyは親も死ぬ
    #   redirect_to groups_path
    end
  end

  private
    def task_params
      params.require(:task).permit(:title, :body, :target_date)
    end
end

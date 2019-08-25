class TasksController < ApplicationController
 before_action :require_user_logged_in
 before_action :correct_user, only: [:edit, :show, :update, :destroy]
  def index
     if logged_in?
       @tasks = current_user.tasks.order(id: :desc).page(params[:page])
     end
  end  
  
  def new
     @task = Task.new
  end  
  
  
  def create
      @task = current_user.tasks.build(task_params)
      if @task.save
          flash[:success] = 'Task が正常に入力されました'
          redirect_to root_url
      else
        @tasks = current_user.tasks.order(id: :desc).page(params[:page])
          flash.now[:danger] = 'Task が入力されませんでした'
          render :new
      end      
  end
  
  def show
  end  
  
  def edit
  end   


  def update
      if @task.update(task_params)
          flash[:success] = 'Task は正常に更新されました'
          redirect_to @task
      else
          flash.now[:danger] = 'Task は更新されませんでした'
          render :edit
      end      
  end

  def destroy
      @task.destroy
      flash[:success] = 'Task は正常に削除されました'
      redirect_back(fallback_location: root_path)
      
  end
  
  private
  

  
  def task_params
      params.require(:task).permit(:status, :content)
  end 
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end 
end  

class TasksController < ApplicationController
  
  def index
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_params)
    
    if @task.save 
      flash[:success] = '正常に登録できました'
      redirect_to @task
    else
      flash[:danger] = '登録に失敗しました'
      render :new
    end
  end

  def new
    @task = Task.new
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = 'タスクは正常に更新されました'
      redirect_to task_path
    else
      flash[:danger] = 'タスクの更新に失敗しました'
      render :edit
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = '削除が完了しました'
    redirect_to tasks_url
  end
  
  #Strong Parameter
  def task_params
    params.require(:task).permit(:content)
  end
end

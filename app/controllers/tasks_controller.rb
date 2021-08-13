class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy]

  def index
    if params[:sort_expired]
      @tasks = Task.all.order(expired_at: :desc).page(params[:page])
    elsif params[:sort_priority]
      @tasks = Task.all.order(priority: :desc).page(params[:page])
    elsif
      @tasks = Task.all.order(created_at: :desc).page(params[:page])
    end

    if params[:search_title].present? && params[:search_status].present?
      @tasks = Task.all.search_title(params[:search_title]).search_status(params[:search_status]).page(params[:page])
    elsif params[:search_title].present?
      @tasks = Task.all.search_title(params[:search_title]).page(params[:page])
    elsif params[:search_status].present?
      @tasks = Task.all.search_status(params[:search_status]).page(params[:page])
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if params[:back]
      render :new
    else
      if @task.save
        redirect_to tasks_path, notice: "登録しました！"
      else
        render :new
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to new_task_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to  tasks_path
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end
  def task_params
    params.require(:task).permit(:task, :title, :content, :expired_at, :status, :priority)
  end
end

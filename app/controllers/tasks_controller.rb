class TasksController < ApplicationController
  def index
    @tasks = Tasks.all
  end

  def new
    @task = Task.new
  end

  def create
  end

  def show
  end

  def edit
  end
end

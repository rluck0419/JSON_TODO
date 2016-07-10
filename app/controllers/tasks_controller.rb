class TasksController < ApplicationController
  def index
    render json: Task.all, status: 200
  end

  def completed
    completed = []
    Task.all.each do |task|
      if task.completed
        completed << task
      end
    end
    render json: completed, status: 200
  end

  def incomplete
    incomplete = []
    Task.all.each do |task|
      unless task.completed
        incomplete << task
      end
    end
    render json: incomplete, status: 200
  end

  def show
    if Task.exists?(params[:id])
      render json: Task.find(params[:id]), status: 200
    else
      render json: { message: "Task not found." }, status: 404
    end
  end

  def create
    task = Task.new(body: params[:body], list_id: params[:list_id], completed: params[:completed])
    if task.save
      render json: task.to_json, status: 200
    else
      render json: task.errors.to_json, status: :unprocessable_entity
    end
  end

  def update
    task = Task.find(params[:id])
    if task.update(body: params[:body], list_id: params[:list_id], completed: params[:completed])
      render json: task.to_json, status: 200
    else
      render json: task.errors.to_json, status: :unprocessable_entity
    end
  end

  def destroy
    if Task.exists?(params[:id])
      Task.destroy(params[:id])
      render json: { message: "Task destroyed." }, status: 200
    else
      render json: { message: "Task not found." }, status: 404
    end
  end
end

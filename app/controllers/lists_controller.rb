class ListsController < ApplicationController
  def index
    render json: List.all, status: 200
  end

  def show
    if List.exists?(params[:id])
      render json: List.find(params[:id]), status: 200
    else
      render json: { message: "List not found." }, status: 404
    end
  end

  def create
    list = List.new(title: params[:title])
    if list.save
      render json: list.to_json, status: 200
    else
      render json: list.errors.to_json, status: :unprocessable_entity
    end
  end

  def update
    list = List.find(params[:id])
    if list.update(title: params[:title])
      render json: list.to_json, status: 200
    else
      render json: list.errors.to_json, status: :unprocessable_entity
    end
  end

  def destroy
    if List.exists?(params[:id])
      List.destroy(params[:id])
      render json: { message: "List destroyed." }, status: 200
    else
      render json: { message: "List not found." }, status: 404
    end
  end
end

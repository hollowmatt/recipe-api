class TodosController < ApplicationController

  def tasks
    @todos = Todo.all
    render json: @todos
  end

  def create
    @todo = Todo.new(user_params)
    if @todo.save
      render json: @todo
    else
      render nothing: true, status: :bad_request
    end
  end

  def update
    task_id = params[:todo][:id]
    @todo = Todo.find(task_id.to_i)
    if @todo.update_attributes(user_params)
      render json: @todo
    else
      render nothing: true, status: :bad_request
    end
  end

  def destroy
    task_id = params[:todo][:id]
    @todo = Todo.find(task_id.to_i)
    if @todo.destroy
      render json: {status: 200, message: task_id + ': removed'}
    else
      render nothing: true, status: :bad_request
    end
  end

  private

  def user_params
    params.require(:todo).permit(:title, :text, :completed)
  end
end
                                                                                                                                                 5
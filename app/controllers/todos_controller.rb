class TodosController < ApplicationController
  def index
    # find all todos
    @todos = Todo.all
    render json: {todos: @todos}
  end

  def show
    # find a single todo
    @todo = Todo.find(params[:id])
    render json: {todo: @todo}
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: {todo: @todo}
    else
      render json: { error: "Could not create todo!"}
    end
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      render json: {todo: @todo}
    else
      render json: { error: "Could not update todo!"}
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    render json: { message: "Successfully Deleted Todo!"}
  end

  private
  # only allow a list of trusted parameters through
  def todo_params
    params.require(:todo).permit(:name, :description)
  end
end

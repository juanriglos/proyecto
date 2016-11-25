class TareasController < ApplicationController
before_action :set_todo_list

def create
  @tarea = @list.tareas.create(tarea_params)
  redirect_to @list
end

private

  def set_todo_list
    @list = List.friendly.find(params[:list_id])
  end

  def tarea_params
		params.require(:tarea).permit(:description, :type, :priority, :state)
	end

end

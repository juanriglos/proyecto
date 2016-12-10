class TareasController < ApplicationController
before_action :set_todo_list

def create
  @tarea = @list.tareas.create(tarea_params)
  respond_to do |format|
     if @tarea.save
       format.html { redirect_to @list, notice: 'Tarea satisfactoriamente creada.'}
     else
       format.html { redirect_to @list, notice: 'La Tarea no se pudo crear.'}
     end
   end
end


def edit
  @tarea=@list.tareas.find(params[:id])
end

def update
    @tarea=@list.tareas.find(params[:id])
    cambia_estado @tarea
    respond_to do |format|
    if @tarea.update(tarea_params_to_update)
      format.html { redirect_to @list, notice: 'Tarea  modificada.'}
    else
      format.html { redirect_to @list, notice: 'La Tarea no se pudo modificar.'}
    end
  end
end


def destroy
  @tarea = @list.tareas.find(params[:id])
  respond_to do |format|
  if @tarea.destroy
    format.html { redirect_to @list, notice: 'Tarea Eliminada.'}
  else
    format.html { redirect_to @list, notice: 'La Tarea no se pudo eliminar.'}
  end
end
end


private
  def cambia_estado tarea
    if tarea.end_time< Date.today
      tarea.state = 'Expirada'
    end
  end

  def tarea_params_to_update
      tarea_params.permit(:description,:priority,:state,:percentage,:begin_time,:end_time)
  end

  def set_todo_list
    @list = List.friendly.find(params[:list_id])
  end

  def tarea_params
		params.require(:tarea).permit(:description, :type, :priority, :state,:begin_time, :end_time, :percentage)
	end

end

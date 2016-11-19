class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
    @list.tareas.build
  end

  def show
    @list=List.friendly.find(params[:id])
  end


  def destroy
    List.friendly.find(params[:id]).destroy
    redirect_to lists_url
  end

  def edit
    @list=List.friendly.find(params[:id])
    @tareas=@list.tareas.all
  end

  def update
    @list=List.friendly.find(params[:id])
    @list.update(list_params_to_update)
		redirect_to edit_list_path
  end

  def agregar id_lista
    if cookies[:user_lists].nil?
      cookies[:user_lists]=Array.new
      cookies[:user_lists].push(id_lista)
    else
      # en caso de ser necesario .gsub('+', ' ')
      arreglo = cookies[:user_lists].split("&")
      Rails.logger.debug arreglo
      arreglo.push(id_lista)
      cookies[:user_lists] = arreglo
    end
  end

  def create

    @list = List.new(list_params)

    Rails.logger.debug list_params[:URL]
    agregar list_params[:URL]
    #en caso de crear con tarea @list.tareas.new(tarea_params)

   respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'Lista satisfactoriamente creada.' }
      else
        format.html { redirect_to @list, notice: 'El nombre de la lista ya existe' }
      end
    end
  end


  private

    def list_params_to_update
		    list_params.permit(:name)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:created_at, :updated_at, :name, :URL)
    end

    def tarea_params
		params.require(:tareas).permit(:type, :description)
	end
end

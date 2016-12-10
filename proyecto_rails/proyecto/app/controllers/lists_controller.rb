class ListsController < ApplicationController
  def index
    if cookies[:user_lists].nil?
      @lists = List.none
    #  if @lists.size > 5
    #    @lists= @lists.last(5)
    #  end
    else
      ids = cookies[:user_lists].split("&")
      @lists = List.all.find(ids).last(5).reverse
    #  Rails.logger.debug @Lists
    end
    @list = List.new
  end

  def show
    @list=List.friendly.find(params[:id])
    @tareas=@list.tareas.all

  end


  def destroy
    @list=List.friendly.find(params[:id])
    eliminar @list.id
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

  def create
    @list = List.new(list_params)
    #en caso de crear con tarea @list.tareas.new(tarea_params)
   respond_to do |format|
      if @list.save
        agregar @list.id
        format.html { redirect_to @list, notice: 'Lista satisfactoriamente creada.' }
      else
        format.html { redirect_to @list, notice: 'La lista no se pudo crear' }
      end
    end
  end

  private

    def list_params_to_update
		    list_params.permit(:URL)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:created_at, :updated_at, :name, :URL)
    end

    def tarea_params
		    params.require(:tarea).permit(:description)
	  end

    def agregar id_lista
      if cookies[:user_lists].nil?
        cookies[:user_lists]=Array.new
        cookies[:user_lists].push(id_lista)
      else
      # en caso de ser necesario .gsub('+', ' ')
        arreglo = cookies[:user_lists].split("&")
        arreglo.push(id_lista)
        cookies[:user_lists] = arreglo
      end
    end

    def eliminar id_lista
      arreglo = cookies[:user_lists].split("&")
      Rails.logger.debug arreglo
      Rails.logger.debug 'DESPUES DE ARREGLO'
      arreglo.delete(id_lista.to_s)
      Rails.logger.debug arreglo
      cookies[:user_lists] = arreglo
    end

end

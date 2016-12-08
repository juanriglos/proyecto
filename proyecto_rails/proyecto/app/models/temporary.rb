class Temporary < Tarea
 validates :fecha_es_posible? ,  presence: true

  def fecha_es_posible?
    if end_time < begin_time
      Rails.logger.debug "FALSO"
       return false
    else
      Rails.logger.debug "VERDADERO"
       return true

    end
  end
end

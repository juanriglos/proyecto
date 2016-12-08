class Temporary < Tarea
 validates :fecha_es_posible? ,  presence: true

  def fecha_es_posible?
    if end_time < begin_time
       return false
    else
       return true
    end
  end
end

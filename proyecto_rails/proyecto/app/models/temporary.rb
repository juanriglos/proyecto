class Temporary < Tarea
 validate :fecha_es_posible?

  def fecha_es_posible?
    if end_time < begin_time
       return false
    else
       return true
    end
  end
end

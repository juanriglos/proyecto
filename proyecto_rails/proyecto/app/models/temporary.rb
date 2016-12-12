class Temporary < Tarea

  validates :end_time, presence:true
  validates :begin_time, presence:true
 validates :fecha_es_posible? ,  presence: true

  def fecha_es_posible?
    if end_time && begin_time
        if end_time < begin_time
           return false
        else
           return true
        end
    end
  end

end

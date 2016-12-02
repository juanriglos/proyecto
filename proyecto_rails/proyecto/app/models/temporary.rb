class Temporary < Tarea
validate :fecha_es_posible?
  def fecha_es_posible?
    Rails.logger.debug @end_time

      Rails.logger.debug 'ESTOY EN EL MEDIO'
      Rails.logger.debug @begin_time
    if end_time < begin_time
      Rails.logger.debug 'ENTRA'
      errors[:end_time] << "Error message"
      return false
    else
      Rails.logger.debug 'NO ENTRA'

      return true
    end
  end
end

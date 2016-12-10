class Long < Tarea
# validates :percentage, :numericality => { :less_than_or_equal_to => 100, :greater_than_or_equal_to => 0,
# :only_integer => true}, :presence => true

validates :porcentaje? ,  presence: true

 def porcentaje?
   if  percentage <= 100 && percentage >= 0
      return true
   else
      return false
   end
 end

  # validates_numericality_of :percentage,
  #   :less_than_or_equal_to => 100,
  #   :greater_than_or_equal_to => 0,
  #   :only_integer => true
end

class Long < Tarea

  validates_numericality_of :percentage,
    :less_than_or_equal_to => 100,
    :greater_than_or_equal_to => 0,
    :only_integer => true
end

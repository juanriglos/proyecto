# require 'test_helper'
#
# class TareaCreateTest < ActiveSupport::TestCase
#
#
#   test "No debe guardar una tarea sin ningun dato" do
#       tarea = Tarea.new
#       assert_not tarea.save , "Se guardo una tarea sin datos MAL"
#   end
#
#   test "crear tarea datos VALIDOS, tipo y belong-to list" do
#       lista = List.new
#       lista.URL = 'la lista necesita una URL para ser valida'
#       tarea = Tarea.new
#       tarea.type=Simple
#       lista.tareas << tarea
#       assert tarea.save, "No se guardo una tarea valida"
#   end
#
#
# end

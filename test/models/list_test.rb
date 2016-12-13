require 'test_helper'

class ListTest < ActiveSupport::TestCase

  test "no debe guardar una Lista sin nombre" do
  		lista = List.new
  		assert_not lista.save,"Se guardo una Lista sin nombre"
	end

  test "No debe guardar si la URL ya existe" do
    lista_uno = List.new
    lista_uno.URL = 'prueba url'
    lista_uno.save
    lista_dos = List.new
    lista_dos.URL = 'prueba url'
    assert lista_dos.invalid?
  end

  test "Debe guardar una lista con datos de URL" do
  		lista = List.new
  		lista.URL = 'funca'
		  assert lista.save	,"El ciente valido no se ha guardado "
	end

  

end

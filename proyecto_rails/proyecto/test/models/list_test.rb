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

  test "No debe guardar una tarea sin ningun dato" do
      tarea = Tarea.new
      assert_not tarea.save , "Se guardo una tarea sin datos MAL"
  end

  test "crear tarea datos VALIDOS, tipo y belong-to list" do
      lista = List.new
      lista.URL = 'la lista necesita una URL para ser valida'
      tarea = Tarea.new
      tarea.type=Simple
      lista.tareas << tarea
      assert tarea.save, "No se guardo una tarea valida"
  end

  test "Creacion de una tarea temporal con un rango de validez VALIDO" do
      lista = List.new
      lista.URL = 'prueba'
      tarea = Tarea.create(type:'Temporary',description: 'Feed the wombat', priority: 3, begin_time: Date.today, end_time: Date.tomorrow)
      lista.tareas << tarea
      assert tarea.save , "SE GUARDO UNA TAREA CON RANGOS validos"
  end

  test "Creacion de una tarea temporal con un rango de validez invalido" do
      lista = List.new
      lista.URL = 'prueba'
      tarea = Tarea.create(type:'Temporary',description: 'Feed the wombat', priority: 3, begin_time: Date.tomorrow, end_time: Date.today)
      lista.tareas << tarea
      assert_not tarea.save , "SE GUARDO UNA TAREA CON RANGOS invalidos"
  end

  test "El pasaje de una tarea temporal a estado Expirada" do
    lista = List.new
    lista.URL = 'prueba'
    tarea = Tarea.create(type:'Temporary',description: 'Feed the wombat', priority: 3, begin_time: Date.today, end_time: Date.today, state:'Pendiente')
    tarea.update(begin_time: Date.yesterday, end_time: Date.yesterday)
    lista.tareas << tarea


    assert_equal('Expirada', tarea.state, 'anduvo bien')

  end

  test "Devuelve las tareas ordenadas por prioridad" do
    lista = List.new
    lista.URL = 'Test url'

    tarea_simple = Tarea.create(type:'Simple', description: 'Clean garage', priority: 2)
    tarea_temporaria = Tarea.create(type:'Temporary',description: 'Feed the wombat', priority: 3, begin_time: Date.today, end_time: Date.tomorrow)
    tarea_larga = Tarea.create(type:'Long',percentage: 50, description: 'Shop for groceries', priority: 1)

    [tarea_simple, tarea_larga, tarea_temporaria ].each do |task|
      lista.tareas << task
      lista.save
    end
    lista_prioridad = lista.tareas.order(priority: :asc)
    assert_equal([tarea_larga, tarea_simple, tarea_temporaria], lista_prioridad, 'Quedo mal el ORDEN')
  end

end

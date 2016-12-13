require 'test_helper'

class TareaTest < ActiveSupport::TestCase

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
      tarea = Tarea.create(type:'Temporary',description: 'algo en la descripcion', priority: 3, begin_time: Date.today, end_time: Date.tomorrow)
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
    tarea = Tarea.create(type:'Temporary',description: 'algo en la descripcion', priority: 3, begin_time: Date.today, end_time: Date.today, state:'Pendiente')
    tarea.update(begin_time: 1.month.ago, end_time: 1.month.ago)
    lista.tareas << tarea

    @controller = TareasController.new
    @controller.instance_eval{ cambia_estado tarea }
    assert_equal('Expirada', tarea.state, 'anduvo bien')

  end

  test "Devuelve las tareas ordenadas por prioridad" do
    lista = List.new
    lista.URL = 'Test url'

    tarea_simple = Tarea.create(type:'Simple', description: 'algo en la descripcion', priority: 2)
    tarea_temporaria = Tarea.create(type:'Temporary',description: 'algo en la descripcion', priority: 3, begin_time: Date.today, end_time: Date.tomorrow)
    tarea_larga = Tarea.create(type:'Long',percentage: 50, description: 'algo en la descripcion', priority: 1)

    [tarea_simple, tarea_larga, tarea_temporaria ].each do |task|
      lista.tareas << task
      lista.save
    end
    lista_prioridad = lista.tareas.order(priority: :asc)
    assert_equal([tarea_larga, tarea_simple, tarea_temporaria], lista_prioridad, 'Quedo mal el ORDEN')
  end

  test "actualizacion de una tarea larga con porcentaje dentro del rango" do
    lista = List.new
    lista.URL = 'prueba'
    tarea = Tarea.create(type:'Long',description: 'algo en la descripcion', priority: 3,percentage: 50, state:'Pendiente')
    tarea.update(percentage: 60)
    lista.tareas << tarea

    assert_equal(60, tarea.percentage, 'anduvo bien')
  end

  test "actualizacion de una tarea larga con porcentaje fuera del rango (-1)" do
    lista = List.new
    lista.URL = 'prueba'
    tarea = Tarea.create(type:'Long',description: 'holalalala', priority: 3,percentage: 50, state:'Pendiente')
    lista.tareas << tarea

     tarea.update(percentage: 110)

     tarea.percentage = -1
     assert tarea.invalid?
  end

  test "actualizacion de una tarea larga con porcentaje fuera del rango (110)" do
    lista = List.new
    lista.URL = 'prueba'
    tarea = Tarea.create(type:'Long',description: 'holalalala', priority: 3,percentage: 50, state:'Pendiente')
    lista.tareas << tarea

     tarea.update(percentage: 110)

     tarea.percentage = 110
     assert tarea.invalid?
  end

end

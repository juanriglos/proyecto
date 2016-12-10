require 'test_helper'

class ListTest < ActiveSupport::TestCase

  test "no debe guardar una Lista sin nombre" do
  		lista = List.new
  		assert_not lista.save,"Se guardo una Lista sin nombre"
	end

  test "No debe guardar si la URL ya existe" do
    lista_uno = List.new
    lista_uno.URL = 'Test title'
    lista_uno.save
    lista_dos = List.new
    lista_dos.URL = 'Test title'
    assert lista_dos.invalid?
  end

  test "Devuelve las tareas ordenadas por prioridad" do
    task_list = List.new
    task_list.URL = 'Test url'

    simple_task = Tarea.create(type:'Simple', description: 'Clean garage', priority: 2)
    temporary_task = Tarea.create(type:'Temporary',begin_time: Date.today, end_time: Date.tomorrow ,description: 'Feed the wombat', priority: 3, begin_time: Date.today, end_time: Date.tomorrow)
    long_task = Tarea.create(type:'Long',percentage: 50, description: 'Shop for groceries', priority: 1)
    #
    # task_list.tareas << simple_task
    # task_list.tareas << long_task
    # task_list.tareas << temporary_task

    [simple_task, long_task, temporary_task ].each do |task|
      task_list.tareas << task
      task_list.save
    end
    lista_prioridad = task_list.tareas.order(priority: :asc)
    assert_equal([long_task, simple_task, temporary_task], lista_prioridad, 'Wrong order!')
  end

end

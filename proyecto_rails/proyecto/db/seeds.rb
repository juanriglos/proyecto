
lista = List.create({
  URL:'Lista terminado',
  created_at:Date.today,
  updated_at:Date.today
  })

  lista.tareas.create(type:Simple, description:'soy simple',state:'Pendiente',priority:1)
  lista.tareas.create(type:Simple, description:'soy simple',state:'Pendiente',priority:3)
  lista.tareas.create(type:Temporary, description:'soy temporal',state:'Pendiente',priority:2,begin_time:Date.today,end_time:Date.tomorrow)
  lista.tareas.create(type:Temporary, description:'soy temporal',state:'Pendiente',priority:1,begin_time:Date.today,end_time:Date.tomorrow)
  lista.tareas.create(type:Long, description:'soy larga',state:'Pendiente',priority:3, percentage:50)
  lista.tareas.create(type:Long, description:'soy larga',state:'Pendiente',priority:1, percentage:25)

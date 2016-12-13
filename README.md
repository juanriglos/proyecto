#TODO List

Posicionados en el directorio proyecto ejecutar en linea de comando
```
 bundle install
 bundle exec rake db:migrate
 bundle exec rake db:seed
 bundle exec rails s
```
Para ejecutar la aplicacion ingresar en el navegador a localhost:3000

#Tests

Para testear los modelos ejecutar en linea de comando

```
 bundle exec rake test test/models/list_test.rb
 bundle exec rake test test/models/tarea_test.rb
```

#Lista

Para usar la lista por defecto

```
localhost:3000/lists/lista-0
```

#Tareas

En las listas temporales para crear no te permite crear con fecha anterior al día actual.
Al modificar se puede decrementar la fecha de comienzo y fin, permitiendo ver como cambio automaticamente
el estado a "Expirada" (marcando la tarea con rojo).
  Al modificar una tarea temporal no se puede marcar como expirada, eso se maneja automaticamente por fechas.
Al modificar una tarea y marcarla como Hecha se marcara con color verde.

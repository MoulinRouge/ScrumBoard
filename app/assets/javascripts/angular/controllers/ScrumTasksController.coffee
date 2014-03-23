###
  @desc       

  @author     Priscilla Schneider <schneider@bl-informatik.ch>
  @date       2014-03-22
  @name       ScrumTasksController
###

"use strict"
application.controller 'ScrumTasksController', ['$scope', '$rootScope', 'Task', ($scope, $rootScope, Task) ->
  $scope.tasksToDo = Task.query( { status: 0 } )
  $scope.tasksInProgress = Task.query( {status: 1 } )
  $scope.tasksDone = Task.query( {status: 2 } )

  $scope.formTask = new Task

  $scope.title = "Neuen Task erfassen"
  $scope.isUpdate = false

  ###
    @desc Diese Funktion schiebt einen Task einen Status zurück
    @date 2014-03-23
    @name taskForward
    @parms {Task} task
  ###
  $scope.taskForward = (task) ->
    task.id = task._id
    task.status = task.status + 1
    save(task)

  ###
    @desc Diese Funktion schiebt einen Task in den nächsten Status
    @date 2014-03-23
    @name taskBack
    @parms {Task} task
  ###
  $scope.taskBack = (task) ->
    task.id = task._id
    task.status = task.status - 1 
    save(task)

  ###
    @desc Diese Funktion macht einen Task editierbar
    @date 2014-03-23
    @name updateTask
    @parms {Task} task
  ###
  $scope.updateTask = (task) ->
    $scope.isUpdate = true

    #Da Angular Bidirektional gebindet ist, wird hier der editierbare Task
    #überschrieben, damit die Änderungen sowohl im Titel der Eingabemaske, wie
    #auch in der Taskliste noch nicht angepasst werden (dies verhindert, dass ein Nutzer
    #das Gefühl haben könnte, dass der Task bereits gespeichert wurde)
    $scope.title = "Task '" + task.label + "' editieren"
    $scope.formTask._id = task._id
    $scope.formTask.label = task.label
    $scope.formTask.text = task.text
    $scope.formTask.status = task.status
    $scope.formTask.effort = task.effort
    $scope.formTask.user = task.user

  ###
    @desc Diese Funktion leert die Eingabemaske für einen neuen Task
    @date 2014-03-23
    @name newTask
  ###
  $scope.newTask = () ->
    $scope.title = "Neuen Task erstellen"
    $scope.isUpdate = false
    $scope.formTask = new Task

  ###
    @desc Diese Funktion löscht einen Task
    @date 2014-03-23
    @name deleteTask
    @parms {Task} task
  ###
  $scope.deleteTask = (task) ->
    deleteObject = confirm('Are you sure?')

    if deleteObject
      task.id = task._id
      task.$delete ->
        console.log "success"
        $scope.tasksToDo = Task.query( { status: 0 } )
        $scope.tasksInProgress = Task.query( {status: 1 } )
        $scope.tasksDone = Task.query( {status: 2 } ) 
        $scope.newTask()
      , ( err ) ->
        console.log err
      

  ###
    @desc Diese Funktion erstellt einen Task und speichert ihn
    @date 2014-03-23
    @name createTask
  ###
  $scope.createTask = () ->
    $scope.formTask.id = $scope.formTask._id
    save($scope.formTask)
    $scope.formTask = new Task
    $scope.newTask()

  ###
    @desc Diese Funktion speichert einen Task in der Datenbank
    @date 2014-03-23
    @name save
    @parms {Task} task
  ###
  save = ( task ) ->
    task.$save ->
      console.log 'success'
      $scope.tasksToDo = Task.query( { status: 0 } )
      $scope.tasksInProgress = Task.query( {status: 1 } )
      $scope.tasksDone = Task.query( {status: 2 } ) 
    , ( err ) ->
      console.log err
]
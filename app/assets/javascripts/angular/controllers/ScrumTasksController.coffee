###
  @desc       

  @author     Priscilla Schneider <schneider@bl-informatik.ch>
  @date       2014-03-22
  @name       ScrumTasksController
###

"use strict"
application.controller 'ScrumTasksController', ['$scope', '$rootScope', 'Task', ($scope, $rootScope, Task) ->
  $scope.tasksToDo = Task.query( { status: 0 } )

  $scope.task = Task.get(
    { id:'532d99e9a9ddf0d786788257' }
    , ->
      console.log 'success'
      console.log $scope.task
  )
]
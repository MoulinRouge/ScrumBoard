"use strict"
application.factory "Task", ($resource) ->
    $resource "/api/tasks/:id",
    id: '@id'
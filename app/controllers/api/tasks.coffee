module.exports = ( app ) ->
  Task = app.models.task.Task
  class TasksController
    ###
      @name     index
      @author   Priscilla Schneider <schneider@bl-informatik.ch>
      @desc     
    ###
    @index = ( req, res ) ->
      Task
        .find({})
        .sort('-createdAt')
        .exec( (error, tasks) ->
          if !error
            res.json tasks
          else
            res.status 500
            res.send false
        )

    ###
      @name     show
      @author   Priscilla Schneider <schneider@bl-informatik.ch>
      @desc     
    ###
    @show = ( req, res ) ->
      res.json { error: false, message: 'GET: api/show'}

    ###
      @name     create
      @author   Priscilla Schneider <schneider@bl-informatik.ch>
      @desc     
    ###
    @create = ( req, res ) ->
      res.json { error: false, message: 'GET: api/create'}

    ###
      @name     update
      @author   Priscilla Schneider <schneider@bl-informatik.ch>
      @desc     
    ###
    @update = ( req, res ) ->
      res.json { error: false, message: 'GET: api/update'}

    ###
      @name     delete
      @author   Priscilla Schneider <schneider@bl-informatik.ch>
      @desc     
    ###
    @delete = ( req, res ) ->
      res.json { error: false, message: 'GET: api/delete'}
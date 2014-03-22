_ = require 'underscore'
module.exports = ( app ) ->
  Task = app.models.task.Task
  class TasksController
    ###
      @name     index
      @author   Priscilla Schneider <schneider@bl-informatik.ch>
      @desc     
    ###
    @index = ( req, res ) ->
      if _.contains(["0", "1", "2"], req.query.status)
        status = req.query.status
      else
        status = 0


      Task
        .find({
          status: status
          })
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
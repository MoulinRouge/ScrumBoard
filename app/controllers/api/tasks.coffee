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
      Task
        .findById(req.params.id)
        .exec( (error, task) ->
          if !error
            res.json task
          else
            res.status 404
            res.send false
        )

    ###
      @name     create
      @author   Priscilla Schneider <schneider@bl-informatik.ch>
      @desc     
    ###
    @create = ( req, res ) ->
      task = new Task

      task.label = req.body.label
      task.text = req.body.text
      task.effort = req.body.effort
      task.user = req.body.user
      task.status = 0

      task.save ( err ) ->
        if !err
          res.json task
        else
          res.status 406
          res.send false

    ###
      @name     update
      @author   Priscilla Schneider <schneider@bl-informatik.ch>
      @desc     
    ###
    @update = ( req, res ) ->

      console.log req.body
      Task.findById( req.params.id )
      .exec( ( err, task ) ->
        if not err
          task.label = req.body.label
          task.text = req.body.text
          task.user = req.body.user
          task.effort = req.body.effort
          task.status = req.body.status
          task.save ( err ) ->
            if not err
              res.redirect "/api/tasks/#{req.params.id}"
            else
              console.log err
              res.status 500
              res.json err
        else
          res.status 404
    )

    ###
      @name     delete
      @author   Priscilla Schneider <schneider@bl-informatik.ch>
      @desc     
    ###
    @delete = ( req, res ) ->
      console.log req.params
      Task.remove
        _id: req.params.id, 
        ( err ) ->
          if !err
            res.json true
          else
            res.status 500
            res.json { error: true, message: err}
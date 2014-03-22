module.exports = ( app ) ->

  app.get 		'/api/tasks',                                	app.controllers.api.tasks.index
  app.get 		'/api/tasks/:id',                            	app.controllers.api.tasks.show
  app.post 		'/api/tasks',                            	 	app.controllers.api.tasks.create
  app.put 		'/api/tasks/:id',                            	app.controllers.api.tasks.update
  app.delete 	'/api/tasks/:id',                         		app.controllers.api.tasks.delete

  # Alle anderen Routen abfangen
  app.all '/api/*', (req, res) ->
    res.status 404
    res.json { error: true, status: 404, message: 'not_found' }

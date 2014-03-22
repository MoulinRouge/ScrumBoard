mongoose = require 'mongoose'
timestamps = require 'mongoose-timestamp'

TaskSchema = new mongoose.Schema

	label:
		type: String
		required: true
	text:
		type: String
		required: true
	user:
		type: String
		required: true
	status:
		type: Number
		required: true
	effort:
		type: Number
		required: true
, 
	collection: 'tasks'

TaskSchema.plugin timestamps

module.exports = ->
	Task: mongoose.model 'Task', TaskSchema
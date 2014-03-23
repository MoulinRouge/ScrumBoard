require('jasmine-expect');


var controller = require('../../assets/javascripts/angular/controllers/ScrumTasksController');

var app = {};
app.models = {};
app.models.tasks = require('../../models/task');

var request = {};
var response = {
  viewName: "",
  data: {},
  render: function (view, viewData) {
    this.viewName = view;
    this.data = viewData;
  }
};

describe("ScrumTasks Controller", function () {
  describe("Index", function () {
    it("renders the index view", function () {
      controller.index(app, request, response);
      expect(response.viewName).toEqual("tasks/index");
    });

  });
});
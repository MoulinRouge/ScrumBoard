require('coffee-script/register');
require('jasmine-expect');


var controller = require('../../controllers/api/tasks');

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

describe("Task Controller", function () {
  describe("Index", function () {
    it("renders the index view", function () {
      controller.index(app, request, response);
      console.log(response.viewName);
      expect(response.viewName).toEqual("tasks");
    });

  });
});
require('coffee-script/register');
require('jasmine-expect');
http=require('http');

/*
Prüft die Serverantworten
*/
describe("Servr Responce", function () {
  /*
  Ruft die Index-View auf, und prüft den HTTP-Statuscode (200)
  */
  describe("Index", function () {
    it("renders the index view", function () {
      http.get('http://localhost:11111', function (response){
        expect(response.statusCode).toBe(200);
      });
    });

  });

  /*
  Ruft die Tasks-View auf, und prüft den HTTP-Statuscode (200)
  */
  describe("Tasks", function () {
    it("renders the tasks view", function () {
      http.get('http://localhost:11111/#/tasks', function (response){
        expect(response.statusCode).toBe(200);
      });
    });
  });

});
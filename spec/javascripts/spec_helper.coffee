#= require application
#= require main
#= require angular-mocks

beforeEach(module('Organizer'))

beforeEach inject (_$httpBackend_, _$compile_, $rootScope, $controller, $location, $injector, $timeout) ->
  @scope = $rootScope.$new()
  @http = _$httpBackend_
  @compile = _$compile_
  @location = $location
  @createCtrl = (ctrlName, scope) ->
     $controller(ctrlName, { $scope: scope })
  @injector = $injector
  @timeout = $timeout
  @model = (name) =>
    @injector.get(name)
  @eventLoop =
    flush: =>
  @scope.$digest()

afterEach ->
  @http.resetExpectations()
  @http.verifyNoOutstandingExpectation()
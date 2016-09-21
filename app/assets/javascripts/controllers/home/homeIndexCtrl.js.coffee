angular.module('Organizer').controller('IndexCtrl', ['$scope', 'Navbar', ($scope, Navbar) ->
  Navbar.switchTo '#home'

  $scope.title = 'Hello'
])


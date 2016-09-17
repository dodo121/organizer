angular.module('Organizer').controller('UserSessionsCtrl', ['$scope', 'Navbar', ($scope, Navbar) ->
  Navbar.switchTo('#sign-in-link')
])
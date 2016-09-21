#= require_self
#= require_tree ./templates
#= require_tree ./factories
#= require_tree ./controllers/home
#= require_tree ./controllers/notes
#= require_tree ./controllers/sessions
#= require_tree ./directives
#= require angular-cookie/angular-cookie
#= require ng-token-auth/src/ng-token-auth

Organizer = angular.module('Organizer', ['ngRoute', 'ngResource', 'ngAnimate', 'templates', 'ng-token-auth'])
  .run(['$rootScope', '$location', ($rootScope, $location) ->
    $rootScope.$on('auth:login-success', (ev, user) ->
      $location.path('#/')
    )

    $rootScope.$on('auth:login-error', (ev, reason) ->
      $rootScope.loginErrors = reason.errors.join(', ')
    )

    $rootScope.$on('auth:logout-success', (ev) ->
      $location.path('/sign_in')
    )
#    if $rootScope.user.signedIn
#      alert 'loged'
#    else
#      alert 'und'
])

Organizer.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.when('/notes', { templateUrl: 'notesIndex.html', controller: 'NotesCtrl' } )

  $routeProvider.when('/sign_in', { templateUrl: 'new.html', controller: 'UserSessionsCtrl'})

  $routeProvider.otherwise({ templateUrl: 'homeIndex.html', controller: 'IndexCtrl' } )
])
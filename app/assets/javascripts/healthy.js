var app = angular.module('healthy', ['ui.router'])

app.config(($locationProvider, $stateProvider, $urlRouterProvider) => {
  $locationProvider.html5Mode(true) //.hashPrefix("#")
  $urlRouterProvider.otherwise("/")
  $stateProvider

    .state('restaurants', {
      url: "/",
      templateUrl: "/partial/restaurants",
      controller: 'restrsCtrl'
    })
    .state('restaurant', {
      url: "/r/:id",
      templateUrl: "/partial/restaurant",
      controller: 'restrCtrl'
    })
    .state('restaurant-edit', {
      url: "/r/:id/edit",
      templateUrl: "/partial/restaurant-edit",
      controller: 'restrEditCtrl'
    })
    .state('restaurant-create', {
      url: "/rcreate",
      templateUrl: "/partial/restaurant-edit",
      controller: 'restrCreateCtrl'
    })
})

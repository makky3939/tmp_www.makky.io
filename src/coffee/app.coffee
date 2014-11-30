'use strict'

# GoogleAnalytics Tracking code
((i, s, o, g, r, a, m) ->
  i["GoogleAnalyticsObject"] = r
  i[r] = i[r] or ->
    (i[r].q = i[r].q or []).push arguments
    return
  i[r].l = 1 * new Date()
  a = s.createElement(o)
  m = s.getElementsByTagName(o)[0]
  a.async = 1
  a.src = g
  m.parentNode.insertBefore a, m
) window, document, "script", "http://www.google-analytics.com/analytics.js",
"ga"
ga "create", "UA-47562530-1", "makky.io"


# Angular App
app =
  angular.module 'makkyio', [
    'angulartics',
    'angulartics.google.analytics',
    'ui.bootstrap',
    'ui.router'
  ]

app.config ($stateProvider) ->
  $stateProvider
    .state 'index',
      url: "/"
      templateUrl: "view/index.html"
      controller: 'IndexCtrl'

  $stateProvider
    .state 'tool',
      url: "/tool"
      templateUrl: 'view/tool.html'
      controller: 'ToolCtrl'
    .state 'tool.detail',
      url: "/tool/:tool_name"
      templateUrl: 'view/tool_detail.html'
      controller: 'ToolDetailCtrl'

  $stateProvider
    .state 'portfolio',
      url: '/portfolio'
      templateUrl: 'view/portfolio.html'
      controller: 'PortfolioCtrl'
    .state 'portfolio.detail',
      url: '/portfolio/:portfolio_type/:portfolio_name'
      templateUrl: 'view/portfolio_detail.html'
      controller: 'PortfolioDetailCtrl'

  $stateProvider
    .state 'about',
      url: "/about"
      templateUrl: 'view/about.html'
      controller: 'AboutCtrl'
  return 0
# $state.go('list', { item: "Ringo" });
app.config ($urlRouterProvider) ->
  $urlRouterProvider.otherwise '/'
  return 0

app.config ($analyticsProvider) ->
  $analyticsProvider.virtualPageviews true
  return 0

app.config ($locationProvider) ->
  $locationProvider.html5Mode.enabled = true
  $locationProvider.html5Mode.requireBase = false
  return 0
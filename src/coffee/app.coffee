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
angular
  .module('makkyio',
    ['ui.router', 'angulartics', 'angulartics.google.analytics', 'ui.bootstrap']
  )
  .config(($stateProvider, $urlRouterProvider) ->
    $urlRouterProvider.otherwise "/"
    $stateProvider
      .state('/', {
        url: "/",
        templateUrl: "view/index.html"
        controller: 'IndexCtrl'
      })

      .state('/tool', {
        url: "/tool"
        templateUrl: 'view/tool.html'
        controller: 'ToolCtrl'
      })
      .state('/tool/:tool_name', {
        url: "/tool/:tool_name"
        templateUrl: 'view/tool_detail.html'
        controller: 'ToolDetailCtrl'
      })

      .state('/portfolio', {
        url: '/portfolio'
        templateUrl: 'view/portfolio.html'
        controller: 'PortfolioCtrl'
      })
      .state('/portfolio/:portfolio_type/:portfolio_name', {
        url: '/portfolio/:portfolio_type/:portfolio_name'
        templateUrl: 'view/portfolio_detail.html'
        controller: 'PortfolioDetailCtrl'
      })

      .state('/about', {
        url: "/about"
        templateUrl: 'view/about.html'
        controller: 'AboutCtrl'
      })
  )

  .config(($analyticsProvider) ->
    $analyticsProvider.virtualPageviews true
  )

# # GoogleAnalytics Tracking code
# ((i, s, o, g, r, a, m) ->
#   i["GoogleAnalyticsObject"] = r
#   i[r] = i[r] or ->
#     (i[r].q = i[r].q or []).push arguments
#     return

#   i[r].l = 1 * new Date()
#   a = s.createElement(o)
#   m = s.getElementsByTagName(o)[0]
#   a.async = 1
#   a.src = g
#   m.parentNode.insertBefore a, m
# ) window, document, "script", "http://www.google-analytics.com/analytics.js", "ga"
# ga "create", "", ""
# ga "send", "pageview"

'use strict'
angular
  .module('makkyio', [
    'ngRoute'
  ])
  .config(($routeProvider) ->
    $routeProvider
      .when('/', {
        templateUrl: 'views/index.html',
        controller: 'IndexCtrl'
      })

      .when('/tool', {
        templateUrl: 'views/tool.html',
        controller: 'ToolCtrl'
      })
      .when('/tool/:tool_name', {
        templateUrl: 'views/tool_detail.html',
        controller: 'ToolDetailCtrl'
      })

      .when('/portfolio', {
        templateUrl: 'views/portfolio.html',
        controller: 'PortfolioCtrl'
      })
      .when('/portfolio/:portfolio_type/:portfolio_name', {
        templateUrl: 'views/portfolio_detail.html',
        controller: 'PortfolioDetailCtrl'
      })

      .when('/about', {
        templateUrl: 'views/about.html',
        controller: 'AboutCtrl'
      })

      .otherwise({
        redirectTo: '/'
      });
  )

'use strict'
angular.module('makkyio')
  # Index
  .controller('IndexCtrl', ($scope) ->
  )

  # Tool
  .controller('ToolCtrl', ($scope, ToolModel) ->
    $scope.tools = ToolModel
  )

  .controller('ToolDetailCtrl', ($scope, $stateParams, ToolModel) ->
    $scope.tools = ToolModel
    $scope.tool_name = $stateParams.tool_name
    for key, val in $scope.tools
      if key.name == $scope.tool_name
        $scope.tool = key
  )

  # Portfolio
  .controller('PortfolioCtrl', ($scope, PortfolioModel) ->
    $scope.portfolios = PortfolioModel
  )

  .controller('PortfolioDetailCtrl', ($scope, $stateParams, PortfolioModel) ->
    $scope.portfolios = PortfolioModel
    $scope.portfolio_type = $stateParams.portfolio_type
    $scope.portfolio_name = $stateParams.portfolio_name 
    for key, val in $scope.portfolios[$scope.portfolio_type]
      if key.name == $scope.portfolio_name
        $scope.portfolio = key
        $scope.centerImage = $scope.portfolio.image_path[0]

    $scope.changeImage = (index) ->
      $scope.centerImage = $scope.portfolio.image_path[index]
  )

  # About
  .controller('AboutCtrl', ($scope) ->
  )
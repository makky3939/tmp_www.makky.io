app.controller 'PortfolioCtrl', ($scope, PortfolioModel) ->
  $scope.portfolios = PortfolioModel
  return 0
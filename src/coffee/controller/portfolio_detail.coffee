app.controller 'PortfolioDetailCtrl', ($scope, $stateParams, PortfolioModel) ->
  $scope.portfolios = PortfolioModel
  $scope.portfolio_type = $stateParams.portfolio_type
  $scope.portfolio_name = $stateParams.portfolio_name
  for key, val in $scope.portfolios[$scope.portfolio_type]
    if key.name == $scope.portfolio_name
      $scope.portfolio = key
      $scope.centerImage = $scope.portfolio.image_path[0]

  $scope.changeImage = (index) ->
    $scope.centerImage = $scope.portfolio.image_path[index]

  $scope.isActive = (index) ->
    return $scope.centerImage == $scope.portfolio.image_path[index]
  return 0
app.controller 'HeaderCtrl', ($scope, $location) ->
  $scope.isCollapsed = false
  $scope.activeTab = $location.$$path.split('/')[1] || 'index'
  $scope.isActive = (path) ->
    return $scope.activeTab == path

  $scope.changeTab = (path) ->
    $scope.activeTab = path
    window.scrollTo(0, 0)
    return 0
  return 0
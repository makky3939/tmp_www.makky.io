app.controller 'ScrollTopCtrl', ($scope, $window) ->
  $scope.isHide = true
  $scope.top = () ->
    window.scrollTo(0, 0)
  $(window).scroll(()->
    $scope.$apply($scope.isHide = $(document).scrollTop() < 128)
  )
  return 0
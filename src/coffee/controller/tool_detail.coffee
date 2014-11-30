app.controller 'ToolDetailCtrl', ($scope, $stateParams, ToolModel) ->
  $scope.tools = ToolModel
  $scope.tool_name = $stateParams.tool_name
  for key, val in $scope.tools
    if key.name == $scope.tool_name
      $scope.tool = key
  return 0
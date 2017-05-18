app.factory('Restaurant', (RestGen) => {
  return RestGen.gen_fns('/restaurants/')
})

app.controller('restrsCtrl', function(Restaurant, $scope){
  Restaurant.index().then(
    (d) => {
      $scope.restaurants = d.data.restaurants 
    }, (d) => {
      alert("Sorry, couldn't load restaurants!") 
    }
  )
})

app.controller('restrCtrl', function(Restaurant, $scope, $state, $stateParams){
  Restaurant.get($stateParams.id).then(
    (d) => {
      $scope.rst = d.data.restaurant
    }, (d) => {
      alert("Sorry, couldn't load restaurant!") 
    }
  )

  $scope.delete = () => {
    var conf = confirm("Are you sure you want to delete this restaurant?")
    if(conf){
      Restaurant.delete($scope.rst.id).then( () => {
        $state.go('restaurants')
      })
    }
  }
})  

app.controller('restrEditCtrl', function(Restaurant, $scope, $state, $stateParams){
  $scope.page = 'edit'
  $scope.verb = "Editing"
  Restaurant.get($stateParams.id).then(
    (d) => {
      $scope.rst = d.data.restaurant
    }, (d) => {
      alert("Sorry, couldn't load restaurant!") 
    }
  )

  $scope.save = () => {
    var resp = Restaurant.update($scope.rst.id, {restaurant: $scope.rst})
    resp.then( (d) => {
      alert("Restaurant saved!")
      $state.go('restaurant', {id: $scope.rst.id})
    }, (d) => {
      alert("Something was wrong!  I'd tell you more, but I'm running out of time to make this app.") 
    })

  }
})


app.controller('restrCreateCtrl', function(Restaurant, $scope, $state, $stateParams){
  $scope.page = 'create'
  $scope.verb = "Adding"
  $scope.rst = {}

  $scope.save = () => {
    var resp = Restaurant.create({restaurant: $scope.rst})
    resp.then( (d) => {
      alert("Restaurant saved!")
      console.log("d", d.data.restaurant, d)
      $state.go('restaurant', {id: d.data.restaurant.id})
    }, (d) => {
      alert("Something was wrong!  I'd tell you more, but I'm running out of time to make this app.") 
    })

  }
})


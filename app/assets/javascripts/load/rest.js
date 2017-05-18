app.factory('RestGen', ($http) => {
  var obj = {}
  obj.gen_fns = (base) => {
    var fact = {}
    fact.index = () => {
      return $http.get(base)
    }
    fact.get = (id) => {
      return $http.get(base + id)
    }
    fact.delete = (id) => {
      params = {authenticity_token: $("input[name='authenticity_token']").val()}
      return $http.delete(base + id, params)
    }
    fact.create = (params) => {
      params.authenticity_token = $("input[name='authenticity_token']").val()
      return $http.post(base, params)
    }
    fact.update = (id, params) => {
      params.authenticity_token = $("input[name='authenticity_token']").val()
      return $http.patch(base + id, params)
    }
    return fact
  }
  return obj
})


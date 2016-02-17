module.service('HomeService', function ($http, $q) {
  return {
    randproduct: function () {
      var deferred = $q.defer();
      var start = new Date().getTime();
      $http.jsonp(serverUrl+"/randproduct?lang="+lang+"&callback=JSON_CALLBACK", {
        cache: true
      }).success(function (data) {
        console.log('time taken for request: ' + (new Date().getTime() - start) + 'ms');
        deferred.resolve(data);
      });
      return deferred.promise;
    }
  };
});
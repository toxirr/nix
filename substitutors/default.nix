{...}: {
  nixConfig = {
    extra-substituters = [ "https://cache.xinux.uz" ];
    extra-trusted-public-keys = [ "cache.xinux.uz:BXCrtqejFjWzWEB9YuGB7X2MV4ttBur1N8BkwQRdH+0=" ];
  };
}

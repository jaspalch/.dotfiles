{config, ...}: {
  programs.git = {
    enable = true;
    userName = "Jaspal Chauhan";
    userEmail =
      if config.isWork
      then "jchauhan@cloudian.com"
      else "jaspalch95@gmail.com";
    extraConfig = {
      url."ssh://git@github.com".insteadOf = "https://github.com";
    };
  };
}

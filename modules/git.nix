{config, ...}: {
  programs.git = {
    enable = true;
    settings = [
      {
        user = {
          name = "Jaspal Chauhan";
          email =
            if config.isWork
            then "jchauhan@cloudian.com"
            else "jaspalch95@gmail.com";
        };
        url = {
          "ssh://git@github.com" = {insteadOf = "https://github.com";};
        };
      }
    ];
  };
}

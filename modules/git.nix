{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "segfaultuwu";
        email = "root@vapma.wtf";
      };

      init.defaultBranch = "main";
      pull.rebase = false;
      core.editor = "nvim";
    };
  };

  programs.gh = {
    enable = true;

    settings = {
      git_protocol = "https";
    };
  };
}

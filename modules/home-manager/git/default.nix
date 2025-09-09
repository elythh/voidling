{
  lib,
  pkgs,
  ...
}:
{
  programs = {
    git = {
      enable = true;
      userEmail = "gwen@omg.lol";
      userName = "elyth";

      ignores = [
        "*.log"
        ".envrc"
        "shell.nix"
      ];

      extraConfig = {
        url = {
          "ssh://git@gitlab.dnm.radiofrance.fr:" = {
            insteadOf = "https://gitlab.dnm.radiofrance.fr/";
          };
        };
        # Sign all commits using ssh key
        commit.gpgsign = true;
        gpg.format = "ssh";
        user.signingkey = "~/.ssh/id_default.pub";
        core = {
          editor = "nvim";
          excludesfile = "~/.config/git/ignore";
          pager = "${lib.getExe pkgs.diff-so-fancy}";
        };
        pager = {
          diff = "${lib.getExe pkgs.diff-so-fancy}";
          log = "delta";
          reflog = "delta";
          show = "delta";
        };

        credential = {
          helper = "store";
        };

        push = {
          autoSetupRemote = true;
        };

        rerere.enable = true;

        color = {
          ui = true;
          pager = true;
          diff = "auto";
          branch = {
            current = "green bold";
            local = "yellow dim";
            remove = "blue";
          };

          showBranch = "auto";
          interactive = "auto";
          grep = "auto";
          status = {
            added = "green";
            changed = "yellow";
            untracked = "red dim";
            branch = "cyan";
            header = "dim white";
            nobranch = "white";
          };
        };
      };

      aliases = {
        st = "status ";
        ci = "commit ";
        br = "branch ";
        co = "checkout ";
        df = "diff ";
        dc = "diff - -cached ";
        lg = "log - p ";
        pr = "pull - -rebase ";
        p = "push ";
        ppr = "push - -set-upstream origin ";
        lol = "log - -graph - -decorate - -pretty=oneline --abbrev-commit";
        lola = "log --graph --decorate --pretty=oneline --abbrev-commit --all";
        latest = "for-each-ref --sort=-taggerdate --format='%(refname:short)' --count=1";
        undo = "git reset --soft HEAD^";
        brd = "branch -D";
      };
    };
  };
}

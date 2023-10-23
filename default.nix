# For backwards compatibility using flake.nix
/*(import
    (
        fetchTarball {
            url = "https://github.com/edolstra/flake-compat/archive/35bb57c0c8d8b62bbfd284272c928ceb64ddbde9.tar.gz";
            sha256 = "sha256:1prd9b1xx8c0sfwnyzkspplh30m613j42l1k789s521f4kv4c2z2";
        }
    )
{ src = ./.; }).defaultNix*/
let
    ihp = builtins.fetchGit {
        url = "https://github.com/digitallyinduced/ihp.git";
        ref = "refs/tags/v0.10.0";
    };
    haskellEnv = import "${ihp}/NixSupport/default.nix" {
        ihp = ihp;
        haskellDeps = p: with p; [
            cabal-install
            base
            wai
            text
            hlint
            p.ihp
            mmark # <--------- OUR NEW PACKAGE ADDED HERE
        ];
        otherDeps = p: with p; [
            # Native dependencies, e.g. imagemagick
        ];
        projectPath = ./.;
    };
in
    haskellEnv

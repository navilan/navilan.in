let
  pkgs = import <nixpkgs> {};
  nodePkgs = import ./node-packages {};
  # claymst = pkgs.lib.overrideDerivation pkgs.haskellPackages.clay ( attrs: {
  #   # src = pkgs.fetchgit {
  #   #   url = "https://github.com/sebastiaanvisser/clay";
  #   #   rev = "a887456";
  #   #   sha256 = "1x3qhi5fvknl77nslz35zag62glg2bccjigkcrwnd3n1bmqc84hk";
  #   # };
  #   src = /home/navilan/puthir/www/clay;
  #   doCheck = false;
  # });
  hask = pkgs.haskellPackages.ghcWithPackages ( p: with p; [
    blaze-html
    hakyll
    # claymst
    clay
    MissingH
  ]);
  node = with nodePkgs; [
    live-server
    uglify-js
  ];
in
  pkgs.buildEnv {
    name = "navilan.in";
    paths = [hask] ++ node;
    ignoreCollisions = true;
  }

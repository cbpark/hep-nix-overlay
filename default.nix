
# same args as in all-packages.nix
# should this be moved into pkg/top-level/all-packages.nix ?
{ system ? builtins.currentSystem
, stdenvType ? system
, bootStdenv ? null
, noSysDirs ? true
, gccWithCC ? true
, gccWithProfiling ? true
, config ? null
# additional:
, nixpkgs ? /afs/cern.ch/user/i/ikim/repo/ext/nixpkgs
, ...
}:

let lib = import /afs/cern.ch/user/i/ikim/repo/ext/nixpkgs/lib;
    defaultScope = pkgs // pkgs.xorg;
    mainConfig = { inherit system stdenvType bootStdenv noSysDirs gccWithCC gccWithProfiling config; };
    pkgs = import nixpkgs mainConfig;
    callPackage = newScope {};
    newScope = extra: lib.callPackageWith (defaultScope // extra);

    root5 = callPackage ./packages/root5 { } ;
    
in [ root5 ]    





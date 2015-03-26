{ pkgs, ROOT6 }:

let version = ROOT6.version;
in pkgs.myEnvFun rec { 
  name = "ROOT6-${version}";

  buildInputs = with pkgs; [ ROOT6 pythonFull binutils stdenv.cc ] ++ (if stdenv.isDarwin then [darwin.sw_vers] else []);
  
  extraCmds = ''
    export NIX_CFLAGS_COMPILE="-target x86_64-apple-darwin11.4.2 $NIX_CFLAGS_COMPILE"
    export NIX_CFLAGS_LINK="-target x86_64-apple-darwin11.4.2 $NIX_CFLAGS_LINK"

    source ${ROOT6}/bin/thisroot.sh
  '';
}

{ stdenv, fetchurl, x11, libX11, file, libXpm }:
 
stdenv.mkDerivation { 
  name = "root5-34.12"; 
  src = fetchurl { 
    url = "ftp://root.cern.ch/root/root_v5.34.12.source.tar.gz";
    sha256 = "b471def39ef2ce032a820e46b4c7a699ca0a7f123f4d975a7bf151b49831e802";
  }; 
  #configureFlags = "--with-x11-libdir=${libX11}/lib --with-xpm-libdir=${libXpm}/lib";
  configureFlags = "--disable-x11 --disable-shared --disable-sqlite --disable-ssl --disable-ruby --disable-afs --disable-alien --disable-afdsmgrd --disable-asimage --disable-astiff --disable-bonjour --disable-roofit --disable-pgsql --disable-pythia6 --disable-pythia8 --disable-opengl --disable-mysql --disable-oracle --disable-python --disable-qt --disable-qtgsi --disable-rfio --disable-shadowpw --disable-tmva --disable-xml --disable-xrootd --disable-ldap --disable-gsl-shared --disable-cocoa --disable-cling --disable-cocoa --disable-gviz --enable-builtin-pcre --enable-builtin-zlib --enable-builtin-lzma --enable-builtin-ftgl --disable-krb5 --disable-genvector --disable-mathmore --disable-memstat --disable-minuit2 --disable-monalisa --disable-odbc --disable-rfio --disable-srp --disable-table --disable-unuran --disable-winrtdebug --disable-xft";
  buildInputs = [ x11 file libXpm ];
  # doCheck = true;
}

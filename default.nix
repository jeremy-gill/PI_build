{ pkgs ? import <nixpkgs> {} }: 
with pkgs.python39Packages;
buildPythonPackage rec {
  pname = "PI_build";
  version = "0.1.3-51-g24831f9";

  src = fetchGit {
    url = "ssh://git@bitbucket.org/jgill72/PI_build.git";
    rev = "24831f9e84f0d931fe8189088d70f9592a3f29c0";
    allRefs = true;
  };

  nativeBuildInputs = [
    pip
    pkgs.git
    dulwich
    psutil
  ];

  doCheck = false;

  buildInputs = [
    dulwich
    pip
    psutil
    setuptools
    pkgs.git
  ];

  propagatedBuildInputs = [
    dulwich
    psutil
  ];

  meta = with pkgs.lib; {
    description = "Parallax Innovations Build scripts";
    homepage = "http://www.parallax-innovations.com";
    license = licenses.bsd3;
    maintainers = [ "Jeremy Gill <jgill@parallax-innovations.com>" ];
  };
}

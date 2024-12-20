{
  buildPythonPackage,
  lib,
  fetchPypi,
  scipy,
}:

buildPythonPackage rec {
  pname = "rmsd";
  version = "1.6.0";
  format = "setuptools";

  propagatedBuildInputs = [ scipy ];

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-9bALeHmdw6OJGxp3aabkDfCxo4fGv2etKzpBDhmZOrI=";
  };

  pythonImportsCheck = [ "rmsd" ];

  meta = with lib; {
    description = "Calculate root-mean-square deviation (RMSD) between two sets of cartesian coordinates";
    mainProgram = "calculate_rmsd";
    homepage = "https://github.com/charnley/rmsd";
    license = licenses.bsd2;
    platforms = platforms.linux;
    maintainers = with maintainers; [
      sheepforce
      markuskowa
    ];
  };
}

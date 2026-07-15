{ ... }:
{
  nixpkgs.overlays = [
    (final: prev: {
      python3 = prev.python3.override {
        packageOverrides = pyfinal: pyprev: {
          pyiceberg = pyprev.pyiceberg.overridePythonAttrs (old: {
            pythonRelaxDeps = [ "rich" ];
          });
        };
      };
    })
  ];
}

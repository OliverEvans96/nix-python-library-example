# Nix Python Library Example

This is a simple python library packaged with nix flakes via the `buildPythonPackage` function.

To verify that it works, clone the repo and run the following command from the root:

```
nix-shell --command "python -c 'from flower_power import *; print(list_many_species())'"
```


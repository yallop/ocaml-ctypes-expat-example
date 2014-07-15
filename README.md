An example of using [ocaml-ctypes][ocaml-ctypes] to bind to [expat].

### Requirements:
* [batteries][batteries] (available on OPAM)
* libexpat

### Building:
```bash
ocamlfind opt -package batteries,ctypes.foreign expat_example.ml \
  -linkpkg -cclib -lexpat -o expat_example
```

### Running
```bash
./expat_example filename
```

[ocaml-ctypes]: https://github.com/ocamllabs/ocaml-ctypes
[expat]: http://www.libexpat.org/
[batteries]: http://batteries.forge.ocamlcore.org/
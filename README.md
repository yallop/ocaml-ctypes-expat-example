An example of using [ocaml-ctypes][ocaml-ctypes] to bind to [expat].

### Requirements:
* [ocamlfind][ocamlfind] (available on OPAM)
* [core][core] (available on OPAM)
* [ocaml-ctypes][ocaml-ctypes] (available on OPAM)
* libexpat

### Building:
```bash
ocamlfind opt -thread -package core,ctypes.foreign expat_example.ml \
  -linkpkg -cclib -lexpat -o expat_example
```

### Running
```bash
./expat_example < document.xml
```

[ocaml-ctypes]: https://github.com/ocamllabs/ocaml-ctypes
[expat]: http://www.libexpat.org/
[core]: https://github.com/janestreet/core
[ocamlfind]: projects.camlcity.org/projects/findlib.html

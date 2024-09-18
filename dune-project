(lang dune 3.17)

(name topshelf)
(source (github tjdevries/topshelf.fm))

;; Use Melange for Javascript Compilation
(using melange 0.1)

;; Set up mlx files
(dialect
 (name mlx)
 (implementation
  (extension mlx)
  (merlin_reader mlx)
  (preprocess
   (run mlx-pp %{input-file}))))

(maintainers "TJ DeVries")
(authors "teej_dv" "ThePrimeagen")

(package
 (name topshelf)
 (synopsis "TopShelf.fm by TJ DeVries")
 (description "It's a website. For a podcast. What else do you want to know?")
 (allow_empty)
 (depends 
   ocaml dune melange reason-react
   ;; podcast stuff
   xml-light fmt base ppx_deriving
   ;; `.mlx` support
   mlx ocamlmerlin-mlx
   ;; Dev Tools
   ocamlformat ocaml-lsp-server)
 (tags (meme fun)))

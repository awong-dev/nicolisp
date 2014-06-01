(* 
ocamllex.opt nicolisplexer.mll && ocamlyacc nicolispparser.mly && ocamlc -c nicolispparser.mli  nicolisplexer.ml nicolispparser.ml nicolisp.ml  && ocamlc nicolisplexer.cmo nicolispparser.cmo nicolisp.cmo -o nicolisp && ./nicolisp

This could use a real build file.
*)
let main () =
  try
    let lexbuf = Lexing.from_channel stdin in
    while true do
      Nicolispparser.expr Nicolisplexer.nicolisp_lex lexbuf
    done
  with End_of_file -> exit 0
      
let _ = Printexc.print main ()

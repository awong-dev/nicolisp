(* scanner for a toy language *)

{
  open Printf
}

let digit = ['0'-'9']
let id = ['a'-'z' 'A'-'Z'] ['a'-'z' 'A'-'Z' '0'-'9']*


rule nicolisp_lex = parse
  | digit+ as num { Nicolispparser.NUM (float_of_string num) }
  | digit+ '.' digit* as num { Nicolispparser.NUM (float_of_string num) }
  | "(" { Nicolispparser.LPAREN }
  | ")" { Nicolispparser.RPAREN }
  | id as text { Nicolispparser.IDENT(text) }
  | [' ' '\t' '\n']     { nicolisp_lex lexbuf }     (* eat up whitespace *)
  | _ as c
        { printf "Unrecognized character: %c\n" c;
          nicolisp_lex lexbuf
        }


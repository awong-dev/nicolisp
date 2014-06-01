%{
open Printf
%}

%token <float> NUM
%token <string> IDENT
%token LPAREN RPAREN

%start expr
%type <unit> expr

%% /* Grammar rules and actions follow */

expr:   /* empty */           { }
        | LPAREN arg_list RPAREN            { }
;

arg_list:  expr  { }
        | var     { printf "\tident: %s\n" $1; flush stdout }
        | literal { printf "\tliteral %.10g\n" $1; flush stdout }
;

var: IDENT  { $1 }
;

literal:  NUM { $1 }
%%


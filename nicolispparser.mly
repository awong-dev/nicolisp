%{
open Printf
%}

%token <float> NUM
%token <string> IDENT
%token LPAREN RPAREN

%start expr
%type <unit> expr

%% /* Grammar rules and actions follow */

expr:   LPAREN arg_list RPAREN            { }
;

arg_list:  /* empty */ { }
        | var arg_list { printf "\tident: %s\n" $1; flush stdout }
        | expr arg_list { }
        | literal arg_list { printf "\tnum: %.10g\n" $1; flush stdout }
;

var: IDENT  { $1 }
;

literal:  NUM { $1 }
%%


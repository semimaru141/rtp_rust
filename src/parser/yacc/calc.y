%start Expr
%left '+'
%left '*'
%%
Expr -> Result<u64, ()>:
    Expr '+' Expr { Ok($1? + $3?) }
  | Expr '*' Expr { Ok($1? * $3?) }
  | Factor { $1 }
  ;

Factor -> Result<u64, ()>:
    '(' Expr ')' { $2 }
  | 'INT'
    {
      let v = $1.map_err(|_| ())?;
      parse_int($lexer.span_str(v.span()))
    }
  ;
%%
// Any functions here are in scope for all the grammar actions above.
use rtp::parser::utils::parser::parse_int;

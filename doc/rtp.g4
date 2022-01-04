grammar rtp;

/**
 * parser
 */
prog      : blocks EOF ;

value     : value op value
          | value priOp value
          | value equalOp value
          | value boolOp value
          | MINUS value
          | EXC value
          | LBRA value RBRA
          // value [ value ]
          | value LBBRA value RBBRA
          // value ( value )
          | value LBRA args RBRA
          | value LBRA RBRA
          | STRING
          | STRING_VALUE
          | BOOL
          | NUMBER
          ;

boolOp    : ANDAND
          | OROR
          ;

equalOp   : EQUALEQUAL
          | EQUALGREATER
          | EQUALLESS
          | GREATEREQUAL
          | LESSEQUAL
          | GREATER
          | LESS
          ;

priOp     : TIMES
          | DEVIDED
          ;

op        : PLUS
          | MINUS
          ;

declare   : DECLARE_INT
          | DECLARE_STRING
          | DECLARE_BOOL
          ;

blocks    : blocks block
          | block
          ;

block     : value
          | declare STRING
          | declare STRING EQUAL value
          | STRING EQUAL value
          | IF LBRA value RBRA block
          | IF LBRA value RBRA LWBRA blocks RWBRA
          | FOR LBRA value RBRA block
          | FOR LBRA value RBRA LWBRA blocks RWBRA
          ;

args      : args COMMA value
          | value
          ;

/**
 * lexer
 */
ANDAND  : '&&' ;
OROR    : '||' ;
EQUALEQUAL : '==' ;
GREATEREQUAL : '>=' ;
LESSEQUAL : '<=' ;
EQUALGREATER : '=>';
EQUALLESS : '=<' ;
NOTEQUAL: '!=' ;
LESS    : '<' ;
GREATER : '>' ;
EXC     : '!' ;

PLUS    : '+' ;
MINUS   : '-' ;
TIMES   : '*' ;
DEVIDED : '/' ;
EQUAL   : '=' ;
LBRA    : '(' ;
RBRA    : ')' ;
LWBRA   : '{' ;
RWBRA   : '}' ;
LBBRA   : '[' ;
RBBRA   : ']' ;
COMMA   : ',' ;
FOR     : 'for' ;
IF      : 'if' ;
DECLARE_INT : 'Int' ;
DECLARE_STRING : 'String' ;
DECLARE_BOOL : 'Bool' ; 

BOOL    : ('true'|'false');
STRING_VALUE: ('"'(.*?)'"')|('\''(.*?)'\'') ;
STRING  : [a-z]+[0-9a-z_-]* ;
NUMBER  : [0-9]+ ;


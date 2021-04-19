%{
#include<stdio.h>
#define OP 1
#define Program 2
#define Specifier 3
#define Keyword 4
#define String 5
#define Punctuation 6 
#define Spaces 7
#define ID 8
#define Bracket 9 
#define Number 10
#define Comment 11
#define Print 12

%}

%%

main {printf("\n %d Classes name:%s",Program,yytext);}
"class" {printf("\n %d Starting of the program:%s",Program,yytext);}
"+"|"-"|"*"|"/" {printf("\n %d The  Operators are:%s",OP,yytext);}
"=" {printf("\n %d operator Assignment is :%s",OP,yytext);}
"<"|">"|"=="|"!=" {printf("\n %d After Comparision Operators:%s",OP,yytext);}
"&&"|"||" {printf("\n %d The Logical Operators are:%s",OP,yytext);}
[0-9]* {printf("\n %d The Digits:%s",Number,yytext);}
"."|";"|"," {printf("\n %d ThePunctuations:%s",Punctuation,yytext);}
[a-zA-Z] {printf("\n %d The Letters:%s",String,yytext);}
"/"[a-zA-Z0-9!@#.,:$%^&()_+]|"/"[a-zA-Z0-9!@#$%^&()_+]"/" {printf("\n %d Comment Done:%s",Comment,yytext);}
int|void|boolean|double|float {printf("\n %d Keywords Are:%s",Keyword,yytext);}
[ |\n|\t|" "] {printf("\n %d The Whitespaces Are:%s",Spaces,yytext);}
"("|")"|"["|"]"|"{"|"}" {printf("\n %d Brackets we have :%s",Bracket,yytext);}
"*/"

private|static {printf("\n %d Specifiers we have:%s",Specifier,yytext);}
[a-zA-Z]+[_a-zA-Z0-9]* {printf("\n %d Variable We have:%s",ID,yytext);}
if|else {printf("\n %d The Loops are:%s",Keyword,yytext);}
"System.out.println"|"System.out.print" {printf("\n %d the Printed statement are:%s",Print,yytext);}

%%

int yywrap(){}
int main()

{

  yylex();

}

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mjava.h"
#include "parser.tab.h"

int yylineno;
%}

%option noyywrap

%%
"class"                       { yylval.Mjava = new_Mjava(yytext, 0); yylval.Mjava->line = yylineno; return Class; }
"public"                      { yylval.Mjava = new_Mjava(yytext, 0); yylval.Mjava->line = yylineno; return Public; }
"static"                      { yylval.Mjava = new_Mjava(yytext, 0); yylval.Mjava->line = yylineno; return Static; }
"void"                        { yylval.Mjava = new_Mjava(yytext, 0); yylval.Mjava->line = yylineno; return Void; }
"main"                        { yylval.Mjava = new_Mjava(yytext, 0); yylval.Mjava->line = yylineno; return Main; }
"if"                          { yylval.Mjava = new_Mjava(yytext, 0); yylval.Mjava->line = yylineno; return If; }
"else"                        { yylval.Mjava = new_Mjava(yytext, 0); yylval.Mjava->line = yylineno; return Else; }
"while"                       { yylval.Mjava = new_Mjava(yytext, 0); yylval.Mjava->line = yylineno; return While; }
"extends"                     { yylval.Mjava = new_Mjava(yytext, 0); yylval.Mjava->line = yylineno; return Extends; }
"int"                         { yylval.Mjava = new_Mjava(yytext, 0); yylval.Mjava->line = yylineno; return Integer; }
"boolean"                     { yylval.Mjava = new_Mjava(yytext, 0); yylval.Mjava->line = yylineno; return Boolean; }
"String"                      { yylval.Mjava = new_Mjava(yytext, 0); yylval.Mjava->line = yylineno; return String; }
"true"                        { yylval.Mjava = new_Mjava(yytext, 0); yylval.Mjava->line = yylineno; return True; }
"false"                       { yylval.Mjava = new_Mjava(yytext, 0); yylval.Mjava->line = yylineno; return False; }
"this"                        { yylval.Mjava = new_Mjava(yytext, 0); yylval.Mjava->line = yylineno; return This; }
"new"                         { yylval.Mjava = new_Mjava(yytext, 0); yylval.Mjava->line = yylineno; return New; }
"System.out.println"          { yylval.Mjava = new_Mjava(yytext, 0); yylval.Mjava->line = yylineno; return Println; }
"length"                      { yylval.Mjava = new_Mjava(yytext, 0); yylval.Mjava->line = yylineno; return Length; }
"return"                      { yylval.Mjava = new_Mjava(yytext, 0); yylval.Mjava->line = yylineno; return Return; }
[a-zA-Z]([a-zA-Z]|[0-9]|"_")* { 
                                char *val = (char*)malloc(strlen("identifier: ")+strlen(yytext)+10);
                                sprintf(val, "identifier: %s", yytext);
                                yylval.Mjava = new_Mjava(val, 0);
                                yylval.Mjava->line = yylineno;
                                return Id;
                              }
[1-9]([0-9])*                 { 
                                char *val = (char*)malloc(strlen("IntegerIteral: ")+strlen(yytext)+10);
                                sprintf(val, "IntegerIteral: %s", yytext);
                                yylval.Mjava = new_Mjava(val, 0); 
                                yylval.Mjava->line = yylineno;
                                return IntegerIteral;
                              }
("0x"|"0X")([0-9]|[a-fA-F])+  { 
                                char *val = (char*)malloc(strlen("IntegerIteral: ")+strlen(yytext)+10);
                                sprintf(val, "IntegerIteral: %s", yytext);
                                yylval.Mjava = new_Mjava(val, 0); 
                                yylval.Mjava->line = yylineno;
                                return IntegerIteral; 
                              }
("0b"|"0B")("0"|"1")+         { 
                                char *val = (char*)malloc(strlen("IntegerIteral: ")+strlen(yytext)+10);
                                sprintf(val, "IntegerIteral: %s", yytext);
                                yylval.Mjava = new_Mjava(val, 0); 
                                yylval.Mjava->line = yylineno;
                                return IntegerIteral; 
                              }
"0"([0-8])*                   { 
                                char *val = (char*)malloc(strlen("IntegerIteral: ")+strlen(yytext)+10);
                                sprintf(val, "IntegerIteral: %s", yytext);
                                yylval.Mjava = new_Mjava(val, 0); 
                                yylval.Mjava->line = yylineno;
                                return IntegerIteral; 
                              }

"&&"  { return And; }
"."   { return '.'; }
"="   { return '='; }
"+"   { return '+'; }
"-"   { return '-'; }
"*"   { return '*'; }
"<"   { return '<'; }
"!"   { return '!'; }

"{"   { return Lbrace; }
"}"   { yylval.Mjava = new_Mjava(yytext, 0); yylval.Mjava->line = yylineno; return Rbrace; }
"["   { return Laccess; }
"]"   { yylval.Mjava = new_Mjava(yytext, 0); yylval.Mjava->line = yylineno; return Raccess; }
"("   { yylval.Mjava = new_Mjava(yytext, 0); yylval.Mjava->line = yylineno; return LBracket; }
")"   { yylval.Mjava = new_Mjava(yytext, 0); yylval.Mjava->line = yylineno; return RBracket; }
";"   { yylval.Mjava = new_Mjava(yytext, 0); yylval.Mjava->line = yylineno; return Semicolon; }
","   { yylval.Mjava = new_Mjava(yytext, 0); yylval.Mjava->line = yylineno; return Comma; }

"//".*"\n"         { yylineno++; }
"/*"(.|"\n")*"*\\" { yylineno++; }
" "|"\t"|"\r"      { /*do nothing*/ }
"\n"               { yylineno++; }
.                  { fprintf(stderr, "Unkown word."); }

%%

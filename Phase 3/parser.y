%{
#include <stdio.h>
#include "mjava.h"

extern int yylineno;

int yylex();
void yyerror(char *s);
%}

%union {
    struct Mjava* Mjava;
    double d;
}

%token <Mjava> Class Public Static Void Main If Else While Extends
%token <Mjava> Integer Boolean String True False Id IntegerIteral
%token <Mjava> And This New Println Length Return 
%token <Mjava> Rbrace Raccess LBracket RBracket
%token <Mjava> Semicolon Comma
%type <Mjava> Goal MainClass ExtendOpt Identifier Type
%type <Mjava> ClassDeclarations ClassDeclarationList ClassDeclaration
%type <Mjava> VarDeclarations VarDeclaration
%type <Mjava> MethodDeclarations MethodDeclarationList MethodDeclaration
%type <Mjava> TypeIdentifiers TypeIdentifierList TypeIdentifier
%type <Mjava> Statements StatementList Statement
%type <Mjava> Expressions ExpressionList Expression

%left Laccess Lbrace
%right '='
%left '.'
%left '*'
%left '+' '-'
%left And '<'
%right '!'

%start Goal

%%
Goal:
    MainClass ClassDeclarations 
    {
        $$ = new_Mjava("Goal", 2, $1, $2);
        $$->line = yylineno;
        //if (check($$)) 
        {
            printf("Syntax tree:\n");
            Print($$, 0);
        }
    }
    ;

MainClass:
    Class Identifier Lbrace Public Static Void Main LBracket String Laccess Raccess Identifier RBracket Lbrace Statement Rbrace Rbrace
    {
        $$ = new_Mjava("MainClass", 17, $1, $2, new_Mjava("{", 0), $4, $5,
                                       $6, $7, $8, $9, new_Mjava("[", 0), $11,
                                       $12, $13, new_Mjava("{", 0), $15, $16,
                                       $17);
        $$->line = yylineno;
    }
    ;

ClassDeclarationList:
    ClassDeclaration 
    {
        $$ = new_Mjava("ClassDeclarationList", 1, $1);
        $$->line = yylineno;
    }
|   ClassDeclarationList ClassDeclaration
    {
        $$ = new_Mjava("ClassDeclarationList", 2, $1, $2);
        $$->line = yylineno;
    }
    ;

ClassDeclarations:
    /* empty */
    {
        $$ = NULL;
    }
|   ClassDeclarationList
    {
        $$ = new_Mjava("ClassDeclarations", 1, $1);
        $$->line = yylineno;
    }
    ;

ClassDeclaration:
    Class Identifier ExtendOpt Lbrace VarDeclarations MethodDeclarations Rbrace
    {
        $$ = new_Mjava("ClassDeclaration", 7, $1, $2, $3, new_Mjava("{", 0),
                                             $5, $6, $7);
        $$->line = yylineno;
    }
    ;

ExtendOpt:
    /* empty */
    {
        $$ = NULL;
    }
|   Extends Identifier
    {
        $$ = new_Mjava("ExtendOpt", 2, $1, $2);
        $$->line = yylineno;
    }
    ;

VarDeclarations:
    /* empty */
    {
        $$ = NULL;
    }
|   VarDeclarations VarDeclaration
    {
        $$ = new_Mjava("VarDeclarations", 1, $1);
        $$->line = yylineno;
    }
    ;

VarDeclaration:
    Type Identifier Semicolon
    {
        $$ = new_Mjava("VarDeclaration", 3, $1, $2, $3);
        $$->line = yylineno;
    }
    ;

MethodDeclarations:
    /* empty */
    {
        $$ = NULL;
    }
|   MethodDeclarationList
    {
        $$ = new_Mjava("MethodDeclarations", 1, $1);
        $$->line = yylineno;
    }
    ;

MethodDeclarationList:
    MethodDeclaration
    {
        $$ = new_Mjava("MethodDeclarationList", 1, $1);
        $$->line = yylineno;
    }
|   MethodDeclarationList MethodDeclaration
    {
        $$ = new_Mjava("MethodDeclarationList", 2, $1, $2);
        $$->line = yylineno;
    }
    ;

MethodDeclaration:
    Public Type Identifier LBracket TypeIdentifiers RBracket Lbrace VarDeclarations Statements Return Expression Semicolon Rbrace
    {
        $$ = new_Mjava("MethodDeclaration", 13, $1, $2, $3, $4,
                                               $5, $6, new_Mjava("{", 0),
                                               $8, $9, $10, $11,
                                               $12, $13);
        $$->line = yylineno;
    }
    ;

TypeIdentifiers:
    /* empty */
    {
        $$ = NULL;
    }
|   TypeIdentifierList
    {
        $$ = new_Mjava("TypeIdentifiers", 1, $1);
        $$->line = yylineno;
    }
    ;

TypeIdentifierList:
    TypeIdentifier
    {
        $$ = new_Mjava("TypeIdentifierList", 1, $1);
        $$->line = yylineno;
    }
|   TypeIdentifierList Comma TypeIdentifier
    {
        $$ = new_Mjava("TypeIdentifierList", 3, $1, $2, $3);
        $$->line = yylineno;
    }
    ;

TypeIdentifier:
    Type Identifier
    {
        $$ = new_Mjava("TypeIdentifer", 2, $1, $2);
        $$->line = yylineno;
    }
    ;

Statements:
    /* empty */
    {
        $$ = NULL;
    }
|   StatementList
    {
        $$ = new_Mjava("Statements", 1, $1);
        $$->line = yylineno;
    }
    ;

StatementList:
    Statement
    {
        $$ = new_Mjava("StatementList", 1, $1);
        $$->line = yylineno;
    }
|   StatementList Statement
    {
        $$ = new_Mjava("StatementList", 2, $1, $2);
        $$->line = yylineno;
    }
    ;

Type:
    Integer
    {
        $$ = new_Mjava("Type", 1, $1);
        $$->line = yylineno;
    }
|   Integer Laccess Raccess
    {
        $$ = new_Mjava("Type", 3, $1, new_Mjava("[", 0), $3);
        $$->line = yylineno;
    }
|   Boolean
    {
        $$ = new_Mjava("Type", 1, $1);
        $$->line = yylineno;
    }
|   Identifier
    {
        $$ = new_Mjava("Type", 1, $1);
        $$->line = yylineno;
    }
    ;

Statement:
    Lbrace Statements Rbrace
    {
        $$ = new_Mjava("Statement", 3, new_Mjava("{", 0), $2, $3);
        $$->line = yylineno;
    }
|   If LBracket Expression RBracket Statement Else Statement
    {
        $$ = new_Mjava("Statement", 7, $1, $2, $3, $4,
                                      $5, $6, $7);
        $$->line = yylineno;
    }
|   While LBracket Expression RBracket Statement
    {
        $$ = new_Mjava("Statement", 5, $1, $2, $3, $4,
                                      $5);
        $$->line = yylineno;
    }
|   Println LBracket Expression RBracket Semicolon
    {
        $$ = new_Mjava("Statement", 5, $1, $2, $3, $4,
                                      $5);
        $$->line = yylineno;
    }
|   Identifier '=' Expression Semicolon
    {
        $$ = new_Mjava("Statement", 4, $1, new_Mjava("=", 0), $3, $4);
        $$->line = yylineno;
    }
|   Identifier Laccess Expression Raccess '=' Expression Semicolon
    {
        $$ = new_Mjava("Statement", 7, $1, new_Mjava("[", 0), $3, $4,
                                      new_Mjava("=", 0), $6, $7);
        $$->line = yylineno;
    }
    ;

Expressions:
    /* empty */
    {
        $$ = NULL;
    }
|   ExpressionList
    {
        $$ = new_Mjava("Expressions", 1, $1);
        $$->line = yylineno;
    }
    ;

ExpressionList:
    Expression
    {
        $$ = new_Mjava("ExpressionList", 1, $1);
        $$->line = yylineno;
    }
|   ExpressionList Comma Expression
    {
        $$ = new_Mjava("ExpressionList", 3, $1, $2, $3);
        $$->line = yylineno;
    }
    ;

Expression:
    Expression And Expression
    {
        $$ = new_Mjava("Expression", 3, $1, new_Mjava("$$", 0), $3);
        $$->line = yylineno;
    }
|   Expression '<' Expression
    {
        $$ = new_Mjava("Expression", 3, $1, new_Mjava("<", 0), $3);
        $$->line = yylineno;
    }
|   Expression '+' Expression
    {
        $$ = new_Mjava("Expression", 3, $1, new_Mjava("+", 0), $3);
        $$->line = yylineno;
    }
|   Expression '-' Expression
    {
        $$ = new_Mjava("Expression", 3, $1, new_Mjava("-", 0), $3);
        $$->line = yylineno;
    }
|   Expression '*' Expression
    {
        $$ = new_Mjava("Expression", 3, $1, new_Mjava("*", 0), $3);
        $$->line = yylineno;
    }
|   Expression Laccess Expression Raccess
    {
        $$ = new_Mjava("Expression", 4, $1, new_Mjava("[", 0), $3, $4);
        $$->line = yylineno;
    }
|   Expression '.' Length
    {
        $$ = new_Mjava("Expression", 3, $1, new_Mjava(".", 0), $3);
        $$->line = yylineno;
    }
|   Expression '.' Identifier LBracket Expressions RBracket
    {
        $$ = new_Mjava("Expression", 6, $1, new_Mjava(".", 0), $3,
                                       $4, $5, $6);
        $$->line = yylineno;
    }
|   True
    {
        $$ = new_Mjava("Expression", 1, $1);
        $$->line = yylineno;
    }
|   False
    {
        $$ = new_Mjava("Expression", 1, $1);
        $$->line = yylineno;
    }
|   Identifier
    {
        $$ = new_Mjava("Expression", 1, $1);
        $$->line = yylineno;
    }
|   This
    {
        $$ = new_Mjava("Expression", 1, $1);
        $$->line = yylineno;
    }
|   New Integer Laccess Expression Raccess
    {
        $$ = new_Mjava("Expression", 5, $1, $2, new_Mjava("[", 0), $4, $5);
        $$->line = yylineno;
    }
|   New Identifier LBracket RBracket
    {
        $$ = new_Mjava("Expression", 4, $1, $2, $3, $4);
        $$->line = yylineno;
    }
|   '!' Expression
    {
        $$ = new_Mjava("Expression", 2, new_Mjava("!", 0), $2);
        $$->line = yylineno;
    }
|   LBracket Expression RBracket
    {
        $$ = new_Mjava("Expression", 3, $1, $2, $3);
        $$->line = yylineno;
    }
|   IntegerIteral
    {
        $$ = new_Mjava("Expression", 1, $1);
        $$->line = yylineno;
    }
    ;

Identifier:
    Id
    {
        $$ = new_Mjava("Expression", 1, $1);
        $$->line = yylineno;
    }
    ;

%%
void yyerror(char *s) {
    fprintf(stderr, "line %d: %s \n", yylineno, s);
}

int main(void) {
    yyparse();
    return 0;
}

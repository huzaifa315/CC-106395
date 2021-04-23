# PROJECT-PHASE-2

# PROJECT MEMBERS:

**61806** | **Muhammad Akif Hussain**
  
**62112** | **Syed Huzaifa Bin Saeed**

## Rules for Lexical Analyzer:

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
    
    
    

## Rules For Code:

1.	main {printf("\n %d Classes name:%s",Program,yytext);}

2.	"class" {printf("\n %d Starting of the program:%s",Program,yytext);}

3.	"+"|"-"|"*"|"/" {printf("\n %d The  Operators are:%s",OP,yytext);}

4.	"=" {printf("\n %d operator Assignment is :%s",OP,yytext);}

5.	"<"|">"|"=="|"!=" {printf("\n %d After Comparision Operators:%s",OP,yytext);}

6.	"&&"|"||" {printf("\n %d The Logical Operators are:%s",OP,yytext);}

7.	[0-9]* {printf("\n %d The Digits:%s",Number,yytext);}

8.	"."|";"|"," {printf("\n %d ThePunctuations:%s",Punctuation,yytext);}

9.	[a-zA-Z] {printf("\n %d The Letters:%s",String,yytext);}

10.	"/"[a-zA-Z0-9!@#.,:$%^&()_+]|"/"[a-zA-Z0-9!@#$%^&()_+]"/" {printf("\n %d Comment Done:%s",Comment,yytext);}

11.	int|void|boolean|double|float {printf("\n %d Keywords Are:%s",Keyword,yytext);}

12.	[ |\n|\t|" "] {printf("\n %d The Whitespaces Are:%s",Spaces,yytext);}

13.	"("|")"|"["|"]"|"{"|"}" {printf("\n %d Brackets we have :%s",Bracket,yytext);}

14.	private|static {printf("\n %d Specifiers we have:%s",Specifier,yytext);}
	
15.     [a-zA-Z]+[_a-zA-Z0-9]* {printf("\n %d Variable We have:%s",ID,yytext);}

16.	if|else {printf("\n %d The Loops are:%s",Keyword,yytext);}

17.     "System.out.println"|"System.out.print" {printf("\n %d the Printed statement are:%s",Print,yytext);}





## Program:
    int yywrap(){}
    
    int main()

    {

      yylex();

    }

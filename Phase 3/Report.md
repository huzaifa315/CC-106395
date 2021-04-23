# CC 106395: MINI JAVA #

### PROJECT MEMBERS ###
StdID | Name
------------ | -------------
**62112** | **Syed Huzaifa Bin Saeed** <!--this is the group leader in bold-->
61806 | Akif Hussain
<!-- Replace name and student ids with acutal group member names and ids-->
## Project Description ##
In this course we learnt about the compilers and how does compiler work. we have studied it in details and the course project is also about compiler we were assigned to design a compiler and run it like the compiler. The project is divided into 3 main phases the first phase is about selecting a language and practice on the language with some basic codes like loops of array conditons of if else and simple program statement. First phase is completed when we practiced the simple statements and succesfully run it. Then the phase 2 came in where we need to design a code for lexical analysis. When we successfully run the the phase 1 we were able to get our hands on the real part where we need to desgin an algorithm for the lexical analysis and we were determined as we have came into long way in the course and confident and energetic to to work on the mini java to design the algorithm and we deliver the flex program in the phase 2. Then phase 3 cme in where  we need to design a parser using YACC and CFG. in this phase we were tasked to design parser where we give input and the system generates the error and the line number where error occured and we were also tasked to give the hint of the error usign the flex program we which was delivered in the phase 2. That's how our whole project is delivered in the  phases and how we delivered it.

## Sample Language Used ##
Replace this text with the desription of what was your sample language. You may include some code examples of loops, if and simple statements
```Simple Program on Mini Java:

class SimpleProgram {

public static void main(String[] a)
{

System.out.println(“hello this is my test program for project phse 1");

}

} if/else loop in Mini Java:

class Factorial_ifelse { public int calculate_Factorial(int number) { int number1; if (number < 1) number1= 1; else number1 = number * (this.calculate_Factorial(number-1)); return number1; } }

class Factorial_program { public static void main(String[] a) { System.out.println(new Factorial_ifelse().calculate_Factorial(8)); } Array Declaration in Mini Java:

class MiniJava_Arrays { public static void main(String[] a) { System.out.println(new ppClass().calc()); } }

class ppClass { int [] b;
public int calc() { int [] a;
b = new int [35]; a = new int [64]; a[0] = 8; a[2] = 66; b[45] = 65; return a[0] + b[a[2]-9]; } } Mini Java Lexical Specifications:

lexical elements found in mini java are as follows.

Identifier:

An identifier is a string of letters, underscores, and digits that begins with an underscore or a letter and continues with any number of letters, underscores, or digits. Only the letters A to Z and a to z are permitted, with case being crucial. IDENTs are not keywords.

Keywords and operators:

In the grammar classification, all tokens in bold are keywords or operators. Main, String, System, Out, and Println are all exceptions. They are not keywords, but rather identifiers.

White Spaces:

Space, new line, carriage return, and tabulator are examples of white space.

Integer Literals:

A numeric integer literal is a digit sequence that starts with any digit from 1 to 9 and ends with any number of digits from 0 to 9. A single 0 can be used as an integer literal as well.

Comments:

A comment is described as the string /* followed by any characters until the terminating /. Comments cannot be nested, and any subsequent / inside a comment would be ignored; a comment will always end when the first */ is detected.

CFG of Mini Java:

• Productions A → α, A → β... abbreviated as A → α | β |...

• N, the sequence of non-terminals (A, B, C... ∈). The start symbol is a non-terminal in the grammar.

• T stands for the collection of tokens, also known as terminals.

• A Context Free Grammar is a set of A -> X1X2... Xn (n 0) productions. If n is equal to 0, we can write either A-> or A -> ∈.
```
###Lexical Specification###
Replace this text with a complete lexical specification of your selected programming language.

###Grammar###
Replace this text with a complete GRAMMAR of your selected language


###Approach###
How you handled the tasks that were given? How your program works? What will you have to do to translate the program to C# code?

##Problems Faced##
Replace this text with the explaination of the problems you faced in the project, and how you resolved them. Again you can give each of your problems a heading of level 3.

###Problem 1: I don't know how to Code###
Transfer yourself to social sciences department. Blah blah blah. This is an example. Replace it with your own problem description and how you resolved it.
Don't just blindly copy paste this report. This is a sample template file.

###Problem 2: My Parents forced me for a degree###
If you were not able to convince your parents not to force you for degree and now you are doing it for them, then do it with your best effort and not half heartedly. There is no point wasting this time with finding a loop hole here and there and passing courses without actually learning anything.

###Problem 3: My girlfriend's father won't let me marry her unless I've a degree###
Replace the heading and text of this to mention the problem you have faced in your project.

##References##
- Mention and add [links](https://guides.github.com/features/mastering-markdown/), references, books, research papers, code samples, you used to get help in the project.
- Use bullets like this.
- Mention all references. Plagiarism will not be tolerated.
- You see markdown is not that difficult.
- You are CS students not some tom harry from BBA SHE-B-A :-).
- You can and must learn to use markdown and Github.
- All future project development will be down in something similar to GITHUB

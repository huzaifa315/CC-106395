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
Following code include the examples of loops, if and simple statements
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
### Lexical Specification ###
The Java lexical definition describes tokens for Identifier, and the various literals:
```
Literal:
	IntegerLiteral
	BooleanLiteral
	CharacterLiteral
	StringLiteral
	NullLiteral
In MiniJava we accept identifiers consisting of ASCII characters only, integer literals including octal and hexadecimal, and character and string literals consisting of ASCII characters only, and including escapes.
Types
Type:
	PrimitiveType
	ReferenceType
PrimitiveType:
	int
	boolean
ReferenceType:
	ClassType
	ArrayType
ClassType:
	Name
ArrayType:
	PrimitiveType [ ]
	ClassType [ ]
	ArrayType [ ]
Names
Name:
	SimpleName
	QualifiedName
SimpleName:
	Identifier
QualifiedName:
	Name . Identifier
Packages
CompilationUnit:
	TypeDeclaration*
TypeDeclaration:
	ClassDeclaration
	;
Modifiers
Modifiers:
	Modifier*
Modifier:
	public
	static
	native
Classes
Class Declaration
ClassDeclaration:
	class Identifier Superopt ClassBody
Super:
	extends ClassType
ClassBody:
	{ ClassMemberDeclaration* }
ClassMemberDeclaration:
	FieldDeclaration
	MethodDeclaration
Field Declarations
FieldDeclaration:
	Modifiers Type IdentifierList ;
IdentifierList:
	Identifier
	IdentifierList , Identifier
Method Declarations
MethodDeclaration:
	MethodHeader MethodBody
MethodHeader:
	Modifiers Type MethodDeclarator Throwsopt
	Modifiers void MethodDeclarator Throwsopt
MethodDeclarator:
	Identifier ( FormalParameterListopt )
FormalParameterList:
	FormalParameter
	FormalParameterList , FormalParameter
FormalParameter:
	Type Identifier
Throws:
	throws ClassType
MethodBody:
	Block
	;
Blocks and Statements
Block:
	{ BlockStatement* }
BlockStatement:
	LocalVariableDeclarationStatement
	Statement
LocalVariableDeclarationStatement:
	LocalVariableDeclaration ;
LocalVariableDeclaration:
	Type VariableDeclarators
VariableDeclarators:
	VariableDeclarator
	VariableDeclarators , VariableDeclarator
VariableDeclarator:
	Identifier
	Identifier = Expression
Statement:
	Block
	ExpressionStatement
	IfThenStatement
	IfThenElseStatement
	WhileStatement
	DoWhileStatement
	ReturnStatement
	BreakStatement
	ContinueStatement
	ForStatement
ExpressionStatement:
	StatementExpressionopt ;
StatementExpression:
	Expression
IfThenStatement:
	if ( Expression ) Statement
IfThenElseStatement:
	if ( Expression ) Statement else Statement
WhileStatement:
	while ( Expression ) Statement
DoWhileStatement:
	do Statement while ( Expression ) ;
ReturnStatement:
	return Expressionopt ;
BreakStatement:
	break ;
ContinueStatement:
	continue ;
ForStatement:
	for ( ForInitopt ; Expressionopt ; ForUpdateopt ) Statement
ForInit:
	StatementExpressionList
	LocalVariableDeclaration
ForUpdate:
	StatementExpressionList
StatementExpressionList:
	StatementExpression
	StatementExpressionList , StatementExpression
Expressions
Expression:
	ConditionalExpression
	AssignmentExpression
AssignmentExpression:
	ConditionalExpression = Expression
ConditionalExpression:
	InfixExpression
	InfixExpression ? Expression : ConditionalExpression
InfixExpression:
	PrefixExpression
	InfixExpression InfixOp PrefixExpression
InfixOp:
	||
	&&
	==
	!=
	<
	>
	<=
	>=
	+
	-
	*
	/
PrefixExpression:
	PrefixOp PrefixExpression
	PostfixExpression
PrefixOp:
	-
	!
PostfixExpression:
	Primary Suffix*
Suffix:
	ArrayAccess
	FieldAccess
	MethodInvocation
ArrayAccess:
	[ Expression ]
Selector:
	. Identifier
FieldAccess:
	Selector
MethodInvocation:
	Selector ( ArgumentListopt )
ArgumentList:
	Expression
	ArgumentList , Expression
Primary:
	( Expression )
	this
	Literal
	Identifier
	super FieldAccess
	super MethodInvocation
	ClassInstanceCreationExpression
	ArrayCreationExpression
ClassInstanceCreationExpression:
	new ClassType ( )
ArrayCreationExpression:
	new PrimitiveType [ Expression ] Dimension*
	new ClassType [ Expression ] Dimension*
Dimension:
	[ ]
```

### Grammar ###
CFG of Mini Java:

• Productions A → α, A → β... abbreviated as A → α | β |...

• N, the sequence of non-terminals (A, B, C... ∈). The start symbol is a non-terminal in the grammar.

• T stands for the collection of tokens, also known as terminals.

• A Context Free Grammar is a set of A -> X1X2... Xn (n 0) productions. If n is equal to 0, we can write either A-> or A -> ∈.


### Approach ###
We follow the phases approach as assigned by our course faculty. But to our side we sub divided the phases into chunks to keep track of the project and to deliver it in time. As we also have other course project so breaking it into sub phases was seems to be better approach for us. And we were new to this part so breaking it was a good decision and less hectic for us because understanding of the language and code in that language is quite difficult for us. 

## Problems Faced ##
As we were new to this compiler, and we got to know that we have to built a compiler on mini languages so we faced several problems during this project.

###Problem 1: I don't know how to Code in mini java###
We were unaware of the languages which are used to built compiler projects. So choosing the language is the first and foremost problem in the project. We researched about the languages which can be understandable or we can convert our code from our aware language to any of these language. We tried it but at the end we decided to go for the mini java as most of the people are aware of the java language or can understand the language code without many difficullties. So we choosing the mini java and then design and developing the code is quite hard for us.

###Problem 2: My Parents forced me for a degree###
If you were not able to convince your parents not to force you for degree and now you are doing it for them, then do it with your best effort and not half heartedly. There is no point wasting this time with finding a loop hole here and there and passing courses without actually learning anything.

###Problem 3: My girlfriend's father won't let me marry her unless I've a degree###
Replace the heading and text of this to mention the problem you have faced in your project.

## References ##
- cs.purdue.edu/homes/hosking/502/project/grammer.html.
- cs.purdue.edu/homes/hosking/502/project/grammar.html.
- zaach.github.com.
- nodejs.org.
- javascriptjabber.com.
- google.com.
- wikipedia.

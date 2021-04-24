#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

struct Mjava {
    char *val;
    int children_size;
    int line;
    struct Mjava **children;
};

struct Mjava* new_Mjava(char *s, int children_size, ...);

void Print(struct Mjava *r, int level);

int check(struct Mjava *r);

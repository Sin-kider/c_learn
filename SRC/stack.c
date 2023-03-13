#include "../INC/stack.h"
#include "../INC/main.h"

#define MAXSIZE 128 
typedef struct {
    char data[MAXSIZE];
    int top;
}cStack;

cStack* creatStack(char* src) {
    cStack* newStack = (cStack*)malloc(sizeof(cStack));
    if (!newStack) {
        assert(0);
    }
    strcpy(newStack->data, src);
    newStack->top = strlen(src);
    return newStack;
}

char popStack(cStack* stack) {
    if (stack->top) {
        stack->top -= 1;
        return stack->data[stack->top];
    }
    else {
        assert(0);
    }
}

void pushStack(cStack* stack, char ch) {
    if (stack->top <MAXSIZE) {
        stack->data[stack->top] = ch;
        stack->top +=1;
    }
    else {
        assert(0);
    }
}
#include "../INC/main.h"

int main(int argc, char *argv[]) {
  int i = 0;

  // go through each string in argv
  // why am I skipping argv[0]?
  

  // let's make our own array of strings
  char *states[] = {"California", "Oregon", "Washington", "Texas", NULL};
  int num_states = 5;
  argv[1] = states[1];
  for (i = 1; i < argc; i++) {
    printf("arg %d: %s\n", i, argv[i]);
  }
  states[2] = argv[2];
  for (i = 0; i < num_states; i++) {
    printf("state %d: %s\n", i, states[i]);
  }

  return 0;
}
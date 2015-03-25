#include <Python.h>

int main(int argc, char *argv[]) {
  PyObject *res;
  int s, e, r;
  if(argc<5) {
    fprintf(stderr,"Usage: <string> <start> <end> <repeat>\n\n\
Print string[start:end]*repeat");
    exit(0);
  }
  s = atoi(argv[2]);
  e = atoi(argv[3]);
  r = atoi(argv[4]);
  res = PyString_FromString(argv[1]);
  res = PySequence_GetSlice(res, s, e);
  res = PySequence_Repeat(res, r);
  printf("'%s'\n",PyString_AsString(res));
  return 0;
}

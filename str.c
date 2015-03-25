#include <Python.h>

int main(int argc, char *argv[]) {
  PyObject *res, *mul;
  if(argc<2) exit(0);
  res = PyString_FromString(argv[1]);
  mul = PySequence_Repeat(res, 5);
  printf("'%s'\n",PyString_AsString(mul));
  return 0;
}

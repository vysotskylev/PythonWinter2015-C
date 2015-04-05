#include <Python.h>

int main(int argc, char *argv[]) {
  PyObject *list, *slice, *repeat;
  int i, s, e, r;
  char *res;

  if(argc<5) {
    fprintf(stderr,"Usage: <l[0]> [ <l[1]> ...] <start> <end> <repeat>\n\n\
Print l[start:end]*repeat");
    exit(0);
  }
  list = PyList_New(argc - 4);
  for (i = 1; i < argc - 3; i++){
      PyObject *el = PyLong_FromLong(atoi(argv[i]));
      PyList_SetItem(list, i - 1, el);
  }
  s = atoi(argv[argc-3]);
  e = atoi(argv[argc-2]);
  r = atoi(argv[argc-1]);
  slice = PySequence_GetSlice(list, s, e);
  repeat = PySequence_Repeat(slice, r);
  int len = PySequence_Length(repeat);
  PyObject *item;
  for (int i= 0; i < len; i++){
      item = PySequence_GetItem(repeat, i);
      printf("%ld ",PyLong_AsLong(item));
      Py_DECREF(item);
  }
  printf("\n");
  Py_DECREF(list);
  Py_DECREF(repeat);
  Py_DECREF(slice);
  return 0;
}

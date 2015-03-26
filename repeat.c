#include <Python.h>

static PyObject *
Rep(PyObject *self, PyObject *args) {
  int i, s, e, r;
  char *buf, *ret;
  PyObject *objret;

  if (!PyArg_ParseTuple(args, "siii", &buf, &s, &e, &r)) {
    fprintf(stderr, "DEBUG: PyArg_ParseTuple filed");
    return NULL;
  }

  // check indexes
  if(s>=e || r<1)
    ret = "";
  else {
    s = s>0?s:0; e=strlen(buf)<e?strlen(buf):e;
    ret = malloc((e-s)*r+1);
    for(i=0; i<r; i++)
      strncpy(ret+i*(e-s), buf+s, e-s);
  }
  objret = PyString_FromString(ret);
  free(ret);
  return objret;
}

static PyMethodDef RepeatMethods[] = {
    {"repeat",  Rep, METH_VARARGS, "repeat(buf, s, e, r)\n\nReturn buf[s:e]*r"},
    {NULL, NULL, 0, NULL}        /* Sentinel */
};

PyMODINIT_FUNC
initrepeat(void)
{
  Py_InitModule3("repeat", RepeatMethods,"Test moduel for repeating substring");
}

int
main(int argc, char *argv[])
{
  /* Pass argv[0] to the Python interpreter */
  Py_SetProgramName(argv[0]);

  /* Initialize the Python interpreter.  Required. */
  Py_Initialize();

  /* Add a static module */
  initrepeat();

  return 0;
}


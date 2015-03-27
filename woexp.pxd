cdef extern from "wordexp.h":
    ctypedef struct wordexp_t:
        size_t we_wordc
        char **we_wordv
        size_t we_offs

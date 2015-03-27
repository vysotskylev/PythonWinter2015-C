cimport woexp

__doc__ = 'Primitive wordexp.h wrapper'

cdef class WordExp:
    'wordexp.h wrapper class'
    cdef woexp.wordexp_t data

    def __init__(self, char *s, int flags=0):
        '''__init__(s, flags)\n\nPerform wordexp(s, self.data, flags)'''
        if woexp.wordexp(s, &self.data, flags):
            raise MemoryError()

    def __dealloc__(self):
        woexp.wordfree(&self.data)

    cpdef result(self):
        '''result()\n\nReturn list of filenames.'''
        return [self.data.we_wordv[i] for i in xrange(self.data.we_wordc)]

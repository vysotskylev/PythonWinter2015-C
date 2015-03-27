cimport woexp

__doc__ = 'Primitive wordexp.h wrapper'

cdef class WordExp:
    cdef woexp.wordexp_t data

    cpdef expand(self, char *s, int flags=0):
        '''expand(s, flags)\n\nPerform wordexp(s, self.data, flags)'''
        return woexp.wordexp(s, &self.data, flags)

    cpdef result(self):
        return [self.data.we_wordv[i] for i in xrange(self.data.we_wordc)]

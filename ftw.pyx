cimport cftw

cdef int toCall(const char *fpath, const cftw.stat *sb, int typeflag):
    Ftw.files.append(fpath)
class Ftw:
    files = []
    def __init__(self, int nopenfd = 10):
        self.nopenfd = nopenfd

    def walk(self, const char *path):
        cftw.ftw(path, toCall, self.nopenfd)
        toRet = Ftw.files[:]
        Ftw.files = []
        return toRet

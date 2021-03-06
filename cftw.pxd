cdef extern from "ftw.h":
    struct stat:
        pass
      # dev_t     st_dev;         /* ID of device containing file */
      # ino_t     st_ino;         /* inode number */
      # mode_t    st_mode;        /* protection */
      # nlink_t   st_nlink;       /* number of hard links */
      # uid_t     st_uid;         /* user ID of owner */
      # gid_t     st_gid;         /* group ID of owner */
      # dev_t     st_rdev;        /* device ID (if special file) */
      # off_t     st_size;        /* total size, in bytes */
      # blksize_t st_blksize;     /* blocksize for filesystem I/O */
      # blkcnt_t  st_blocks;      /* number of 512B blocks allocated */
    int ftw(const char *dirpath, int (*fn) (const char *fpath, const stat *sb,int typeflag),int nopenfd)

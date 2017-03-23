/* GCC can always grok prototypes.  For C++ programs we add throw()
   to help it optimize the function calls.  But this works only with
   gcc 2.8.x and egcs.  For gcc 3.2 and up we even mark C functions
   as non-throwing using a function attribute since programs can use
   the -fexceptions options for C code as well.  */
# if !defined __cplusplus && __GNUC_PREREQ (3, 3)
#  define __THROW       __attribute__ ((__nothrow__ __LEAF))
#  define __THROWNL     __attribute__ ((__nothrow__))
#  define __NTH(fct)    __attribute__ ((__nothrow__ __LEAF)) fct
# else
#  if defined __cplusplus && __GNUC_PREREQ (2,8)
#   define __THROW      throw ()
#   define __THROWNL    throw ()
#   define __NTH(fct)   __LEAF_ATTR fct throw ()
#  else
#   define __THROW
#   define __THROWNL
#   define __NTH(fct)   fct
#  endif
# endif


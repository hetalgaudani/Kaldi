#include "atlas_asm.h"
/*

 * void do_vsum(z, x, y)
 * RETURNS: z = x + y
 *
 */
.text
#if defined(ATL_USE64BITS) && defined (ATL_OS_Linux)
        .align 2
        .globl  ATL_asmdecor(do_vsum)
        .section        ".opd","aw"
        .align 3
#else
.globl ATL_asmdecor(do_vsum)
#endif
ATL_asmdecor(do_vsum):
        lvx     v0,0,r5
        lvx     v1,0,r4
        vaddfp  v3,v0,v1
        stvx    v3,0,r3
        blr

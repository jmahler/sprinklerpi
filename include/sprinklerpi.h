
#ifndef _SPRINKLERPI_H
#define _SPRINKLERPI_H

#include <stdlib.h>

#define evenp(n) (0 == (n & 1))

/*
 * encode_cmd()
 *
 * Encodes an ASCII string representation of commands for
 * a variable number of control groups and encodes in to a
 * format suitable for a SprinklerPI device.
 *
 * The input format consists of 1 character which specifies
 * the number of the valve to turn on for that group.
 * For example, the following command would turn on valve 2
 * in group 1 and valve 4 in group 2.
 *
 * "24"
 *
 * The following command would turn on valve 3 in group 1.
 * It assumes that there is no group 2.
 *
 * "3"
 *
 * If there is a group 2 a zero should be specified to keep it off.
 *
 * "30"
 *
 * Memory is automatically allocated to store the encoded
 * command and must be freed after its use.
 *
 * char* incmd = "24";
 * unsigned char inlen;
 * unsigned *char enccmd = NULL;
 * unsigned char enclen;
 *
 * inlen = strlen(incmd);
 * ret = encode_cmd(incmd, inlen, &enccmd, &enclen);
 * if (ret < 0) {
 *   // error!
 *   // (don't need to free memory)
 *   return 1;
 * }
 *
 * // ...
 * ret = write(fd, enccmd, enclen);
 * // ...
 *
 * free(enccmd);
 *
 */
int encode_cmd(char* incmd, unsigned char inlen,
				char** enccmd, unsigned char* enclen);

#endif

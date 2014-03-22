
#ifndef _SPRINKLERPI_H
#define _SPRINKLERPI_H

#include <stdlib.h>

#define evenp(n) (0 == (n & 1))

/* maximum number of groups,
 * each group can control 8 valves */
#define MAXGRP 3

/*
 * encode_cmd()
 *
 * Encodes an ASCII string representation of a command
 * for one to three groups in to a format suitable for
 * a SprinklerPI device.
 *
 * The input format consists of 1 character which specifies
 * the number of the valve to turn on for that group.
 * For example, the following command would turn on valve 2
 * in group 1 and valve 4 in group 2.  Notice that the leftmost
 * number is the first group which is the first in the daisy chain.
 *
 * "24"
 *
 * The following command would turn on valve 3 in group 1.
 * It assumes that there is no group 2.
 *
 * "3"
 *
 * If there was a group two and it was desired to turn it off
 * while keeping valve three in group one on, a zero should be
 * given.
 *
 * "30"
 *
 * The result is an encoded command along with the encoded length
 * in bytes.  This buffer is overwritten in subsequent calls.
 *
 * char* incmd = "24";
 * char inlen;
 * *char enccmd = NULL;
 * char enclen;
 *
 * inlen = strlen(incmd);
 * ret = encode_cmd(incmd, inlen, &enccmd, &enclen);
 * if (ret < 0) {
 *   // error!
 *   return 1;
 * }
 *
 * // ...
 * ret = write(fd, enccmd, enclen);
 * // ...
 *
 */
int encode_cmd(char* incmd, char inlen,
				char** enccmd, char* enclen);

#endif

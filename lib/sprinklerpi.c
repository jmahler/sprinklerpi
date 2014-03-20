
#include "sprinklerpi.h"

int encode_cmd(char* incmd, unsigned char inlen,
				char** enccmd, unsigned char* enclen) {
	unsigned char i, j;
	unsigned char n;
	static char _enccmd[(MAXGRP / 2) + (MAXGRP % 2)];

	*enclen = (inlen / 2) + (inlen % 2);  /* each cmd is 4-bits */
	*enccmd = _enccmd;  /* point to our static buffer */

	if (inlen > MAXGRP) {
		*enccmd = NULL;
		return -1;  /* invalid command */
	}

	j = 0;  /* outcmd index, 1/2 of incmd index (i) */
	for (i = 0; i < inlen; i++) {
		n = incmd[i] - 48;  /* ASCII to integer */

		/* only commands from 0 to 8 are allowed
		 *   0 : off
		 * 1-8 : valve on
		 */
		if (n > 8) {
			*enccmd = NULL;
			return -2;  /* invalid command */
		}

		/*       command, 1 group
		 *  7      4 3     1      0
		 * +--------+-------+------+
		 * |  ...   | valve | en_n |
		 * +--------+-------+------+
		 */
		if (0 == n) {
			n = 1;  /* disable all, en_n = 1 */
		} else {
			n = (n - 1) << 1;  /* valve # (0 offset), en_n = 0 */
		}

		if (evenp(i)) {
			/* save to lowest 4-bits */
			(*enccmd)[j] = 0x0F & n;
		} else {
			/* move lo 4-bits to hi */
			(*enccmd)[j] = (*enccmd)[j] << 4;
			/* save new to lowest 4-bits */
			(*enccmd)[j] |= (0x0F & n);
			j++;
		}
	}

	return 0;
}

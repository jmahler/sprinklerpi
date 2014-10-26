
#include "libsprinklerpi.h"

int encode_cmd(char* incmd, char inlen,
				char** enccmd, char* enclen) {
	unsigned char i, j;
	char n;
	static char _enccmd[(MAXGRP / 2) + (MAXGRP % 2)];

	/* Each controller requires 4-bits but each command (char)
	 * is 8-bits.  `enclen` is the number of 4-bit (nibbles) needed
	 * to store `inlen` commands, possibly with a zero padded entry.
	 */
	*enclen = (inlen / 2) + (inlen % 2);	/* each cmd is 4-bits */
	*enccmd = _enccmd;						/* point to our static buffer */

	if (inlen > MAXGRP) {
		return -1;
	}

	j = 0;  /* enccmd index, 1/2 of incmd index (i) */
	for (i = 0; i < inlen; i++) {
		n = incmd[i] - 48;  /* ASCII to integer */

		/* only commands from 0 to 8 are allowed
		 *   0 : off
		 * 1-8 : valve on
		 */
		if (n > 8) {
			return -2;
		}

		/*       command, 1 group
		 *  7      4 3     1      0
		 * +--------+-------+------+
		 * | unused | valve | en_n |
		 * +--------+-------+------+
		 */
		if (0 == n) {
			/* disable all, en_n = 1 */
			n = 1;
		} else {
			/* valve #, 0 offset, en_n = 0 */
			n = (n - 1) << 1;
		}

		/* save this command to a nibble */
		if (evenp(i)) {
			/* MSB first, first in daisy chain gets last (lowest) bits */
			(*enccmd)[j] = (0x0F & n);
		} else {
			/* MSB first, second in daisy chain gets first (highest) bits */
			(*enccmd)[j] |= (n << 4);
			j++;
		}
	}

	/* reverse bytes */
	for (i = 0; i < ((*enclen) / 2); i++) {
		n = (*enccmd)[i];
		(*enccmd)[i] = (*enccmd)[((*enclen) - 1) - i];
		(*enccmd)[((*enclen) - 1) - i] = n;
	}

	return 0;
}

int regula1(int stg, int d, int s, int j) {
	if (stg == 1) {
		if (d == 1)
			return 1;
	}

	return 0;
}

int regula2(int stg, int d, int s, int j) {
	if (stg == 1) {
		if (d == 0) {
			if (s == 0)
				return 1;
			if (s == 1) {
				if (j == 0)
					return 0;
			}
		}
	}

	if (stg == 0) {
		if (d == 1) {
			if(s == 0)
				return 1;
			if(s == 1) {
				if (j == 0)
					return 1;
			}
		}
	}

	return 0;
}

int regula3(int stg, int d, int s, int j) {
	if (stg == 0) {
		if (s == 1) {
			if (j == 1)
				return 1;
		}
	}

	if (stg == 1) {
		if (d == 0) {
			if (s == 1) {
				if (j == 1)
					return 1;
			}
		}
	}

	return 0;
}

int regula4(int stg, int d, int s, int j) {
	if (stg == 0) {
		if (d == 0)
			return 1;
	}

	return 0;
}

int regula5(int stg, int d, int s, int j) {
	if (stg == 0) {
		if (d == 0) {
			if (s == 0) {
				if (j == 0) {
					return 1;
				}
			}
		}
	}

	return 0;
}

void myTopFuncSem(int stg, int d, int s, int j, int *ew, int *ns) {
#pragma HLS INTERFACE ap_none port=j
#pragma HLS INTERFACE ap_none port=s
#pragma HLS INTERFACE ap_none port=d
#pragma HLS INTERFACE ap_none port=stg

	if (regula1(stg, d, s, j) == 1) {
		*ew = 1;
		*ns = 0;
	}

	if (regula2(stg, d, s, j) == 1) {
		*ew = 1;
		*ns = 0;
	}

	if (regula3(stg, d, s, j) == 1) {
		*ew = 0;
		*ns = 1;
	}

	if (regula4(stg, d, s, j) == 1) {
		*ew = 0;
		*ns = 1;
	}

	if (regula5(stg, d, s, j) == 1) {
		*ew = 1;
		*ns = 0;
	}
}

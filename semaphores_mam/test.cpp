#include "test.h"
#include <iostream>

int main() {
	int status = 0;

	int golden_ew[16] = {1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1};
	int golden_ns[16] = {0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0};

	int ew[16];
	int ns[16];

	int stg = 0, d = 1, s = 1, j = 1;

	for (int i = 0; i < 16; i++) {
		if (i < 8)
			stg = 0;
		else stg = 1;
		if (i < 4 || (i > 7 && i < 12))
			d = 0;
		else d = 1;
		if (i % 2 == 0)
			s =! s;
		j =! j;

		myTopFuncSem(stg, d, s, j, &ew[i], &ns[i]);
	}

	for (int i = 0; i < 16; i++) {
		if (golden_ew[i] != ew[i] || golden_ns[i] != ns[i]) {
			std::cout << "La punctul " << i << " exista eroare\n" << "ew = " << ew[i] << " si"
					<< " golden_ew = " << golden_ew[i] << " si ns =" << ns << " golden_ns =" <<
					golden_ns[i] << "\n";
			status  = -1;
			break;
		}
	}

	if(status == 0)
		std::cout << "succes\n";

	return status;
}

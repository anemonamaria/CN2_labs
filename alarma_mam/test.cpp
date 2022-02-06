#include "test.h"
#include <iostream>

int main() {
	int status = 0;

	int entry[4] = {1, 0, 1, 1};
	ap_uint<8> code7seg[4];
	ap_uint<4> anodes[4];
	char msg[4];
	int SW0[7] = {1, 0, 0, 0, 0, 0, 0};
	int SW1[7] = {0, 1, 0, 0, 0, 1, 0};
	int SW2[7] = {0, 0, 1, 0, 0, 0, 0};
	int SW6[7] = {0, 0, 0, 1, 0, 0, 0};
	int SW7[7] = {0, 0, 0, 0, 1, 0, 0};
	int C0[7] = {1, 1, 1, 1, 1, 1, 1};
	int C1[7] = {0, 0, 0, 0, 0, 0, 0};
	int C2[7] = {1, 1, 1, 1, 1, 0, 1};
	int C3[7] = {1, 1, 1, 1, 1, 1, 1};

	char correct[7][4];
	memcpy(correct[0], "  E1", 4);
	memcpy(correct[1], "  E2", 4);
	memcpy(correct[2], "  E3", 4);
	memcpy(correct[3], " E01", 4);
	memcpy(correct[4], " E10", 4);
	memcpy(correct[5], "0000", 4);
	memcpy(correct[6], "AAAA", 4);

	for (int i = 0; i < 7; i++) {
		myTopFunc(SW0[i], SW1[i], SW2[i], SW6[i], SW7[i], C0[i], C1[i], C2[i], C3[i], entry, code7seg, anodes);

		memcpy(msg, "    ", 4);
		int index = -1;
		for (int j = 0; j < 4; j++) {
			switch(anodes[i]) {
			case 0b1110:
				index = 3;
				break;
			case 0b1101:
				index = 2;
				break;
			case 0b1011:
				index = 1;
				break;
			case 0b0111:
				index = 0;
				break;
			}
			if (index != -1){

				switch(code7seg[i]) {
				case 0b11000000:
					msg[index] = '0';
					break;
				case 0b11111001:
					msg[index] = '1';
					break;
				case 0b10100100:
					msg[index] = '2';
					break;
				case 0b10110000:
					msg[index] = '3';
					break;
				case 0b10001000:
					msg[index] = 'A';
					break;
				case 0b10000110:
					msg[index] = 'E';
					break;
				}
			}
		}
		for (int j = 0; j < 4; j++) {
			if (correct[i][j] != msg[j]) {
				status = -1;
				return 0;
			}
		}
	}
	if (status == 0)
		std::cout << "Succes";
	return 0;
}

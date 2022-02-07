#include "test.h"
#include <iostream>

int main() {
	int status = 0;

	int entry[4] = {1, 0, 1, 1};
	int SW0[7] = {1, 0, 0, 0, 0, 0, 0};
	int SW1[7] = {0, 1, 0, 0, 0, 1, 0};
	int SW2[7] = {0, 0, 1, 0, 0, 0, 0};
	int SW6[7] = {0, 0, 0, 1, 0, 0, 0};
	int SW7[7] = {0, 0, 0, 0, 1, 0, 0};
	int SW12[7] = {1, 1, 1, 1, 1, 1, 1};
	int SW13[7] = {0, 0, 0, 0, 0, 0, 0};
	int SW14[7] = {1, 1, 1, 1, 1, 0, 1};
	int SW15[7] = {1, 1, 1, 1, 1, 1, 1};

	char correct[7][4];
	memcpy(correct[0], "  E1", 4);
	memcpy(correct[1], "  E2", 4);
	memcpy(correct[2], "  E3", 4);
	memcpy(correct[3], " E01", 4);
	memcpy(correct[4], " E10", 4);
	memcpy(correct[5], "0000", 4);
	memcpy(correct[6], "AAAA", 4);

	for (int i = 0; i < 7; i++) {
		ap_uint<8> code7seg[4];
		ap_uint<4> anodes[4];
		char msg[4];
		myTopFunc(SW0[i], SW1[i], SW2[i], SW6[i], SW7[i], SW12[i], SW13[i], SW14[i], SW15[i], entry, code7seg, anodes);

		memcpy(msg, "    ", 4);
		int index = -1;
		for (int j = 0; j < 4; j++) {
			switch(anodes[j]) {
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
				switch(code7seg[j]) {
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
		std::cout << "|";
		for (int j = 0; j < 4; j++) {
			std::cout << msg[j];
		}
		std::cout << "| --- result\n|";
		for (int j = 0; j < 4; j++) {
			std::cout << correct[i][j];
		}
		std::cout << "| --- correct\n\n";
		for (int j = 0; j < 4; j++) {
			if (correct[i][j] != msg[j]) {
				std::cout << "Diferente : " << correct[i][j] << " " << msg[j] << "  " << index << "\n";
				status = -1;
				return -1;
			}
		}
	}
	if (status == 0)
		std::cout << "Succes";
	return 0;
}

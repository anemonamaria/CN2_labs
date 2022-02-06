#include <ap_int.h>

void myTopFunc(bool SW0, bool SW1, bool SW2, bool SW6, bool SW7, bool C0, bool C1, bool C2, bool C3, int entry[4], ap_uint<8> code7seg[4], ap_uint<4> anodes[4]) {
	if (C0 == (bool) entry[0] && C1 == (bool) entry[1] && C2 == (bool) entry[2] && C3 == (bool) entry[3]) {
		int sensor = -1;
		if (SW0 == true)
			sensor = 0;
		else if (SW1 == true)
			sensor = 1;
		else if (SW2 == true)
			sensor = 2;
		else if (SW6 == true)
			sensor = 6;
		else if (SW7 == true)
			sensor = 7;

		if (sensor != -1 && sensor < 4) {
			anodes[0] = 0b1101;
			code7seg[0] = 0b10000110;
			anodes[1] = 0b1110;

			if (sensor == 0)
				code7seg[1] = 0b11111001;
			else if (sensor == 1)
				code7seg[1] = 0b10100100;
			else if (sensor == 2)
				code7seg[1] = 0b10110000;

		} else if (sensor != -1) {
			anodes[0] = 0b1011;
			code7seg[0] = 0b10000110;

			if (sensor == 6) {
				anodes[1] = 0b1101;
				code7seg[1] = 0b11000000;
				anodes[2] = 0b1110;
				code7seg[2] = 0b11111001;
			}
			else if (sensor == 7) {
				anodes[1] = 0b1101;
				code7seg[1] = 0b11111001;
				anodes[2] = 0b1110;
				code7seg[2] = 0b11000000;
			}
		} else if (sensor == -1) {
				anodes[0] = 0b1110;
				code7seg[0] = 0b10001000;
				anodes[1] = 0b1101;
				code7seg[1] = 0b10001000;
				anodes[2] = 0b1011;
				code7seg[2] = 0b10001000;
				anodes[3] = 0b0111;
				code7seg[3] = 0b10001000;
		}
	} else {
		anodes[0] = 0b1110;
		code7seg[0] = 0b11000000;
		anodes[1] = 0b1101;
		code7seg[1] = 0b11000000;
		anodes[2] = 0b1011;
		code7seg[2] = 0b11000000;
		anodes[3] = 0b0111;
		code7seg[3] = 0b11000000;
	}
}

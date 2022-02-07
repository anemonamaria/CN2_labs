#include <ap_int.h>

void myTopFunc(bool SW0, bool SW1, bool SW2, bool SW6, bool SW7,
		bool SW12, bool SW13, bool SW14, bool SW15, int entry[4], ap_uint<8> code7seg[4], ap_uint<4> anodes[4]) {
#pragma HLS INTERFACE mode=ap_none port=SW0
#pragma HLS INTERFACE mode=ap_none port=SW1
#pragma HLS INTERFACE mode=ap_none port=SW2
#pragma HLS INTERFACE mode=ap_none port=SW6
#pragma HLS INTERFACE mode=ap_none port=SW7
#pragma HLS INTERFACE mode=ap_ctrl_none port=return


	if (SW12 == (bool) entry[0] && SW13 == (bool) entry[1] && SW14 == (bool) entry[2] && SW15 == (bool) entry[3]) {
		int sensor = -1;
		if (SW0 == true) {
			sensor = 0;
			anodes[0] = 0b1101;
			code7seg[0] = 0b10000110;
			anodes[1] = 0b1110;
			code7seg[1] = 0b11111001;
		}
		else if (SW1 == true) {
			sensor = 1;
			anodes[0] = 0b1101;
			code7seg[0] = 0b10000110;
			anodes[1] = 0b1110;
			code7seg[1] = 0b10100100;
		}
		else if (SW2 == true) {
			sensor = 2;
			anodes[0] = 0b1101;
			code7seg[0] = 0b10000110;
			anodes[1] = 0b1110;
			code7seg[1] = 0b10110000;
		}
		else if (SW6 == true) {
			sensor = 6;
			anodes[0] = 0b1011;
			code7seg[0] = 0b10000110;
			anodes[1] = 0b1101;
			code7seg[1] = 0b11000000;
			anodes[2] = 0b1110;
			code7seg[2] = 0b11111001;
		}
		else if (SW7 == true) {
			sensor = 7;
			anodes[0] = 0b1011;
			code7seg[0] = 0b10000110;
			anodes[1] = 0b1101;
			code7seg[1] = 0b11111001;
			anodes[2] = 0b1110;
			code7seg[2] = 0b11000000;
		}

		if (sensor == -1) {
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

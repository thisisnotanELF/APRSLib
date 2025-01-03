#include "ax25.h"
#include <stdio.h>
#include <stdlib.h>

// Example message
uint8_t message[] = ">Hello World!";

int main() {

    // Initialize the frame with the example message
    iFrame *frame = initFrame(message, sizeof(message) - 1);

    // Process the frame verbosely and get the NRZIFrame result
    hdlcFrame result = processFrameVerbose(frame);

    // Print the NRZI bitstream
    printf("Returned Hdlc Bitstream:\n");
    int newLineIndex = 0;
    for (size_t i = 0; i < result.size; i++) {
        printf("%d", result.nrziBinHdlcFrame[i]);
        if ((i + 1) % 8 == 0) { // Print a space after every 8 bits (1 byte)
            printf(" ");
		if(newLineIndex == 7){
			printf("\n");
		 	newLineIndex = 0;
		}else{
			newLineIndex++;
		}
	
        }
    }
    printf("\n");

    // Free the allocated memory for the NRZI bitstream
    free(result.nrziBinHdlcFrame);

    return 0;
}

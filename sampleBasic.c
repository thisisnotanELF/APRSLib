#include "ax25.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

// Example message
uint8_t message[] = ">Hello World!";

int main() {
    // Process the frame and get the hdlcFrame result
    iFrame *frame = initFrame(message, sizeof(message)-1);
    hdlcFrame result = processFrame(frame);

    // Print the  bitstream
    printf("hdlc Bitstream: ");
    for (size_t i = 0; i < result.size; i++) {
        printf("%d", result.nrziBinHdlcFrame[i]);
       // if ((i + 1) % 8 == 0) { // Print a space after every 8 bits (1 byte)
            printf(", ");
       // }
    }
    printf("\n");

    // Free the allocated memory for the NRZI bitstream
    free(result.nrziBinHdlcFrame);

    return 0;
}


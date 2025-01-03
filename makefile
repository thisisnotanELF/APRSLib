# Variables
CC = gcc
CFLAGS = -Wall
LIB_NAME = libaprs
STATIC_LIB = $(LIB_NAME).a
OBJ = ax25.o aprs.o
SRC = ax25.c aprs.c
HEADER = ax25.h aprs.h aprsConfig.h
SAMPLE_BASIC_SRC = sampleBasic.c
SAMPLE_VERBOSE_SRC = sampleVerbose.c
SAMPLE_MAIN_SRC = sampleMain.c
SAMPLE_BASIC_EXEC = sampleBasic
SAMPLE_VERBOSE_EXEC = sampleVerbose
SAMPLE_MAIN_EXEC = sampleMain

# Default target
all: $(SAMPLE_BASIC_EXEC) $(SAMPLE_VERBOSE_EXEC) $(SAMPLE_MAIN_EXEC)

# Compile the source files into object files
ax25.o: ax25.c ax25.h
	$(CC) $(CFLAGS) -c ax25.c -o ax25.o

aprs.o: aprs.c aprs.h aprsConfig.h
	$(CC) $(CFLAGS) -c aprs.c -o aprs.o

# Create the static library
$(STATIC_LIB): $(OBJ)
	ar rcs $(STATIC_LIB) $(OBJ)

# Compile and link the basic sample program with the static library
$(SAMPLE_BASIC_EXEC): $(SAMPLE_BASIC_SRC) $(STATIC_LIB)
	$(CC) $(SAMPLE_BASIC_SRC) -L. -l:$(STATIC_LIB) -o $(SAMPLE_BASIC_EXEC)

# Compile and link the verbose sample program with the static library
$(SAMPLE_VERBOSE_EXEC): $(SAMPLE_VERBOSE_SRC) $(STATIC_LIB)
	$(CC) $(SAMPLE_VERBOSE_SRC) -L. -l:$(STATIC_LIB) -o $(SAMPLE_VERBOSE_EXEC)

# Compile and link the main sample program with the static library
$(SAMPLE_MAIN_EXEC): $(SAMPLE_MAIN_SRC) $(STATIC_LIB)
	$(CC) $(SAMPLE_MAIN_SRC) -L. -l:$(STATIC_LIB) -o $(SAMPLE_MAIN_EXEC)

# Clean up generated files
clean:
	rm -f $(OBJ) $(STATIC_LIB) $(SAMPLE_BASIC_EXEC) $(SAMPLE_VERBOSE_EXEC) $(SAMPLE_MAIN_EXEC)

.PHONY: all clean
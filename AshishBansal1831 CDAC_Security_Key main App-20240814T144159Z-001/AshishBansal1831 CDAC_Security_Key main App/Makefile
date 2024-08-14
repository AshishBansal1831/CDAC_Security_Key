PROG = User_Space File_Encrypt Login
OUTPUT = App
CC = gcc
CFLAGS = `pkg-config --cflags gtk+-3.0`
LIBS = `pkg-config --libs gtk+-3.0`


# Default target
all: ${OUTPUT}

# Rule to create the executable from source files
${OUTPUT}: ${PROG:=.c}

# ${PROG}: ${PROG}.c
	${CC} -o ${OUTPUT} ${CFLAGS} ${PROG:=.c} ${LIBS} -lssl -lcrypto -lusb-1.0

clean:
	rm ${OUTPUT}


# Изначальная команда:
# gcc -O3 -o arp-scan.exe -I include src/*.c -l iphlpapi -l ws2_32 -static

.PHONY: all clean

CC			= gcc
CFLAGS		= -O3 -Wall -Wextra -pedantic -I include
LDFLAGS		= -static
LIBS 		= -l iphlpapi -l ws2_32
EXECUTABLE 	= arp-scan.exe

all:
	$(CC) -o $(EXECUTABLE) $(CFLAGS) src/*.c $(LDFLAGS) $(LIBS)

clean:
	rm $(EXECUTABLE)

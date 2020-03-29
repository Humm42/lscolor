# See LICENSE for copyright and license details.

PREFIX=/usr/local
MANPREFIX=${PREFIX}/share/man

#CPPFLAGS=-DNDEBUG -D_POSIX_C_SOURCE=200809L 
#CFLAGS=-std=c99 -Wall -pedantic -O3 -flto
#LDFLAGS=-O3 -flto -s
CPPFLAGS=-D_POSIX_C_SOURCE=200809L
CFLAGS=-std=c99 -Wall -Wextra -pedantic -O0 -g
LDFLAGS=-g

CC=c99
LD=${CC}

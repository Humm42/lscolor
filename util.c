#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "util.h"

void
die(char const *fmt, ...)
{
	va_list l;
	va_start(l, fmt);
	vfprintf(stderr, fmt, l);
	va_end(l);

	if (fmt[strlen(fmt)-1] == ':') {
		fputc(' ', stderr);
		perror("");
	} else
		fputc('\n', stderr);

	exit(1);
}

char *argv0 = NULL;

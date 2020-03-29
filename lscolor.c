/* See LICENSE for copyright and license details. */

#include <ctype.h>
#include <stdio.h>

#include "util.h"

#include "config.h"

int
xgetchar(void)
{
	int c;
	if ((c = getchar()) == EOF && ferror(stdin))
		die("%s: getchar() failed:", argv0);
	return c;
}

int
main(int argc, char **argv)
{
	int chr;
	char buf[BUFSIZE];
	size_t i;
	UNUSED(argc);
	argv0 = argv[0];
	i = 0;
	while ((chr = xgetchar()) != EOF) {
		if (!isspace(chr)) {
			buf[i++] = chr;
			while ((chr = xgetchar()) != EOF && !isspace(chr)) {
				buf[i++] = chr;
			}
			buf[i] = '\0';
			switch (buf[i-1]) {
			case '*':
				printf("%s%s%s", COLOR_EXEC, buf, COLOR_RESET);
				break;
			case '@':
				printf("%s%s%s", COLOR_LINK, buf, COLOR_RESET);
				break;
			case '/':
				printf("%s%s%s", COLOR_DIR, buf, COLOR_RESET);
				break;
			case '|':
				printf("%s%s%s", COLOR_FIFO, buf, COLOR_RESET);
				break;
			case '=':
				printf("%s%s%s", COLOR_SOCK, buf, COLOR_RESET);
				break;
			default:
				fputs(buf, stdout);
			}
			i = 0;
		}
		chr != EOF && putchar(chr);
	}
	return 0;
}

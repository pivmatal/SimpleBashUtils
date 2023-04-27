#ifndef SRC_CAT_S21_CAT_H_
#define SRC_CAT_S21_CAT_H_

#define _GNU_SOURCE

#include <errno.h>
#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
  int b;  //-b (GNU: --number-nonblank) | нумерует только непустые строки |
  int e;  // предполагает и -v (GNU only: -E то же самое, но без применения -v)
          // | также отображает символы конца строки как $  |
  int n;  //(GNU: --number) | нумерует все выходные строки |
  int s;  //(GNU: --squeeze-blank) | сжимает несколько смежных пустых строк |
  int t;  // предполагает и -v (GNU: -T то же самое, но без применения -v) |
          // также отображает табы как ^I |
  int v;
  char last_char;
  int number;
  long number_line;

} opt;

opt options = {};

void file_reader(opt *options, FILE *fp);
void options_parser(int argc, char **argv, opt *options);

#endif
#ifndef SRC_GREP_S21_GREP_H_
#define SRC_GREP_S21_GREP_H_

#define _GNU_SOURCE

#include <errno.h>
#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

typedef struct {
  int opt_e;
  int opt_i;
  int opt_v;
  int opt_c;
  int opt_l;
  int opt_n;
  int opt_h;
  char last_char;
  long number_line;
  char templates[4096];
  char hidden_pattern[4096];
  int regex_pattern_count;
  int number;
} opt;

opt options = {};

void file_reader(int argc, char **argv, opt *options, FILE *fp, int count_file);
void options_parser(int argc, char **argv, opt *options);
void regex_line_pattern(char *pattern, opt *options);
void erer_func();

#endif
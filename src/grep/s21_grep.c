#include "s21_grep.h"

int main(int argc, char **argv) {
  FILE *fp = NULL;
  int flag_error = 1;
  int count_file = 0;
  int templates = 0;

  if (argc < 3) {
    fprintf(stderr, "usage: s21_grep Error\n");
    exit(2);
  }

  options_parser(argc, argv, &options);

  if (options.opt_e == 0) {
    optind++;
  }
  count_file = optind;
  options.number = argc - count_file;
  templates = optind - 1;

  if (options.regex_pattern_count == 0)
    strcpy(options.hidden_pattern, argv[templates]);

  while (count_file < argc) {
    fp = fopen(argv[count_file], "rb");
    if (fp != NULL) {
      file_reader(argc, argv, &options, fp, count_file);

      fclose(fp);
    } else {
      fprintf(stderr, "%s: %s: %s\n", argv[0], argv[count_file],
              strerror(errno));
      flag_error = 2;
    }
    count_file++;  //  к следующему файлу
  }
  return flag_error;
}

void options_parser(int argc_count, char **argv_value, opt *options) {
  (void)argc_count;
  (void)argv_value;

  int opt = 0;

  static struct option long_options[] = {

      {"", no_argument, NULL, 'b'}, {"", no_argument, NULL, 'e'},
      {"", no_argument, NULL, 'n'}, {"", no_argument, NULL, 's'},
      {"", no_argument, NULL, 't'}, {"", no_argument, NULL, 'v'},
      {"", no_argument, NULL, 'h'}, {NULL, 0, NULL, 0},
  };

  while ((opt = getopt_long(argc_count, argv_value, "?:ivclhne:", long_options,
                            NULL)) != -1) {
    switch (opt) {
      case 'e':
        options->opt_e++;
        regex_line_pattern(optarg, options);
        break;
      case 'i':
        options->opt_i++;
        break;
      case 'v':
        options->opt_v++;
        break;
      case 'c':
        options->opt_c++;
        break;
      case 'l':
        options->opt_l++;
        break;
      case 'n':
        options->opt_n++;
        break;
      case 'h':
        options->opt_h++;
        break;
      case '?':
        erer_func();
        exit(1);
    }
  }
  if (options->regex_pattern_count > 0 && strlen(options->templates) > 0)
    strcat(options->templates, ")");
}

void file_reader(int argc_count, char **argv_value, opt *options, FILE *fp,
                 int count_file) {
  (void)argc_count;
  (void)argv_value;

  char *tmp_line = NULL;
  int regflag = 0, line = 0;
  char *regex_template = (options->regex_pattern_count > 0)
                             ? options->templates
                             : options->hidden_pattern;
  ;

  int match_line = 0;
  regex_t regex;
  size_t buffer_size;
  regmatch_t regmatch[2];
  size_t countreg = 0;      //  совпадающие строки
  size_t count_no_reg = 0;  //  несовпадающие строки

  if (options->opt_i == 1) {
    regflag = regcomp(&regex, regex_template, REG_EXTENDED | REG_ICASE);
  } else {
    regflag = regcomp(&regex, regex_template, REG_EXTENDED);
  }

  if (regflag != 0) {
    exit(regflag);
  }

  while ((getline(&tmp_line, &buffer_size, fp)) != EOF) {
    line++;
    int len = strlen(tmp_line);

    if (tmp_line[len - 1] == '\n' && len > 1) {
      tmp_line[len - 1] = '\0';
    }

    regflag = regexec(&regex, tmp_line, 2, regmatch, 0);

    if ((regflag == 0 && options->opt_v == 0) ||
        (regflag == 1 && options->opt_v == 1)) {
      if (regflag == 0) {
        countreg++;
      } else {
        count_no_reg++;
      }

      if (options->opt_n && regflag == 0 && !options->opt_c &&
          !options->opt_l) {
        if (options->number > 1 && !options->opt_h) {
          printf("%s:", argv_value[count_file]);
        }
        printf("%d:", line);
        printf("%s\n", tmp_line);
      }

      if ((!options->opt_c) && (!options->opt_l)) {
        if (!options->opt_v && regflag == 0 && !options->opt_n) {
          if (regflag == 0 && options->number > 1 && !options->opt_h) {
            printf("%s:", argv_value[count_file]);
          }
          printf("%s\n", tmp_line);
        }

        if (options->opt_v && count_no_reg != 0) {
          if (options->number > 1 && !options->opt_h) {
            printf("%s:", argv_value[count_file]);
          }
          if (options->opt_n) {
            printf("%d:", line);
          }
          if (tmp_line[0] == '\n') {
            printf("%s", tmp_line);
          } else {
            printf("%s\n", tmp_line);
          }
        }
      }
    }
  }

  if (options->opt_v) {
    match_line = count_no_reg;
  } else {
    match_line = countreg;
  }

#if defined(__linux__)
  if (options->opt_c && !options->opt_l)
#elif defined(__APPLE__)
  if (options->opt_c)
#endif
  {
    if (options->number > 1) {
      if (!options->opt_h) {
        printf("%s:", argv_value[count_file]);
      }

      if (match_line > 0 && options->opt_l) {
        match_line = 1;
      }
    }
    if (options->number == 1) {
      if (match_line > 0 && options->opt_l) {
        match_line = 1;
      }
    }
    printf("%d\n", match_line);
  }

  if (options->opt_l && match_line > 0) {
    printf("%s\n", argv_value[count_file]);
  }

  if (tmp_line != NULL) free(tmp_line);

  regfree(&regex);
}

void erer_func() {
  fprintf(stderr,
          "usage: grep [-abcdDEFGHhIiJLlMmnOopqRSsUVvwXxZz] [-A "
          "num] [-B num] [-C[num]]\n");
  fprintf(stderr,
          "\t[-e pattern] [-f file] [--binary-files=value] [--color=when]\n");
  fprintf(stderr,
          "\t[--context[=num]] [--directories=action] [--label] "
          "[--line-buffered]\n");
  fprintf(stderr, "\t[--null] [pattern] [file ...]\n");
}

void regex_line_pattern(char *pattern, opt *options) {
  if (options->regex_pattern_count == 0) {
    strcat(options->templates, "(");
    strcat(options->templates, pattern);
  } else {
    strcat(options->templates, "|");
    strcat(options->templates, pattern);
  }
  options->regex_pattern_count++;
}
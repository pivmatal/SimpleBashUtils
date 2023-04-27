#include "s21_cat.h"

int main(int argc, char **argv) {
  FILE *fp = NULL;
  int flag_error = 1;
  int count_file = 0;
  options_parser(argc, argv, &options);
#if defined(__linux__)
  options.number_line = 0;
#endif
  count_file = optind;
  options.number = argc - count_file;

  while (count_file < argc) {
    options.last_char = '\n';
    fp = fopen(argv[count_file], "rb");
    if (fp != NULL) {
      file_reader(&options, fp);
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
  int opt = 0;
  static struct option long_options[] = {
#if defined(__APPLE__)
    {"", no_argument, NULL, 'b'},
    {"", no_argument, NULL, 'e'},
    {"", no_argument, NULL, 'n'},
    {"", no_argument, NULL, 's'},
    {"", no_argument, NULL, 't'},
    {"", no_argument, NULL, 'v'},
#elif defined(__linux__)
    {"", no_argument, NULL, 'e'},
    {"", no_argument, NULL, 't'},
    {"number-nonblank", no_argument, NULL, 'b'},
    {"show-ends", no_argument, NULL, 'E'},
    {"number", no_argument, NULL, 'n'},
    {"squeeze-blank", no_argument, NULL, 's'},
    {"show-tabs", no_argument, NULL, 'T'},
    {"show-nonprinting", no_argument, NULL, 'v'},
    {"show-all", no_argument, NULL, 'A'},
#endif
    {NULL, 0, NULL, 0},
  };

#if defined(__APPLE__)
  while ((opt = getopt_long(argc_count, argv_value, "+:benstuv?", long_options,
                            NULL)) != -1)
#elif defined(__linux__)
  while ((opt = getopt_long(argc_count, argv_value, "+:benstuvTEA?",
                            long_options, NULL)) != -1)

#endif
  {
    switch (opt) {
      case 'b':
        options->b = 1;
        options->n = 1;
        break;
      case 'n':
        options->n = 1;
        break;
      case 's':
        options->s = 1;
        break;
      case 'u':
        break;
      case 't':
        options->t = 1;
        options->v = 1;
        break;
      case 'e':
        options->e = 1;
        options->v = 1;
        break;
      case 'v':
        options->v = 1;
        break;
#if defined(__linux__)
      case 'T':
        options->t = 1;
        break;
      case 'E':
        options->e = 1;
        break;
      case 'A':
        options->v = 1;
        options->e = 1;
        options->t = 1;
        break;
#endif
      case '?':
        fprintf(stderr, "./s21_cat: illegal option\n");
        fprintf(stderr, "usage: ./s21_cat [-benstuv] [file ...]\n");
        exit(1);
    }
  };
}

void file_reader(opt *options, FILE *fp) {
  int symbol;             // текущий символ
  char temp;              // предыдущий
  int repeated_line = 0;  // счетчик поыторных строк
#if defined(__APPLE__)
  options->number_line = 0;  // счетчик
#endif
  temp = options->last_char;  // последний символ

  while ((symbol = fgetc(fp)) != EOF) {
    if (temp == '\n') {
      if (options->s) {
        if (symbol == '\n') {
          if (repeated_line) continue;
          repeated_line = 1;
        } else {
          repeated_line = 0;
        }
      }

      if (options->n && (!options->b || (symbol != '\n'))) {
        printf("%6ld\t", ++options->number_line);
      }
    }

    if (symbol == '\n') {
      if (options->e) {
#if defined(__APPLE__)
        if (options->b && (temp == '\n')) {
          printf("      \t");
        }
#endif
        putchar('$');
      }
    } else if (symbol == '\t') {
      if (options->t) {
        printf("^I");
        temp = symbol;
        continue;
      }
    } else if (options->v) {
      if (symbol >= 0 && symbol <= 31 && symbol != 9 && symbol != 10) {
        printf("^");
        symbol += 64;
      } else if (symbol >= 128 && symbol <= 159) {
        printf("M-^");
        symbol = symbol - 128 + 64;
      } else if (symbol == 127) {
        printf("^?");
        temp = symbol;
        continue;
      }
#if defined(__linux__)
      if (symbol >= 160 && symbol <= 254) {
        printf("M-");
        symbol = symbol + 128;
      }
      if (symbol == 0xff) {
        printf("M-^?");
        temp = symbol;
        continue;
      }
#endif
    }
    temp = symbol;
    options->last_char = symbol;
    putchar(symbol);
  }
}
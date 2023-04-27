.PHONY: all s21_cat 

CC = gcc
UNAME := $(shell uname -s)
CCFLAGS =  -std=c11 -Wall -Wextra -Werror
CCDIR = -I ./

default: all 

all: s21_cat

s21_cat:
	$(CC) $(CCFLAGS) $(CCDIR) s21_cat.c -o s21_cat
	

test: s21_cat
	sh ../tests/cat_test.sh

clean: 
	rm -f s21_cat s21_cat.h.gch 
	rm -rf cat_test_results.txt s21_cat_test_results.txt *.cfg

leaks:
 ifeq ($(UNAME), Linux)
	valgrind --tool=memcheck --leak-check=full ./s21_cat -v ../tests/grep_test_1.txt
 else ifeq ($(UNAME), Darwin)
	leaks --atExit -- ./s21_cat -v ../tests/grep_test_1.txt
 endif
lint:
	clang-format -n s21_cat.c
	clang-format -n s21_cat.h

rebuild: clean all

.PHONY: all s21_grep 

UNAME := $(shell uname -s)
CC = gcc
CCFLAGS =  -std=c11 -Wall -Wextra -Werror
CCDIR = -I ./

default: all 

all: s21_grep 

s21_grep:
	$(CC) $(CCFLAGS) $(CCDIR) s21_grep.c -o s21_grep

test: s21_grep
	sh ../tests/grep_test.sh

clean: 
	rm -f s21_grep s21_grep.h.gch 
	rm -rf grep_test_results.txt s21_grep_test_results.txt *.cfg

leaks:
 ifeq ($(UNAME), Linux)
	valgrind --tool=memcheck --leak-check=full ./s21_grep -e ../tests/grep_test_1.txt
 else ifeq ($(UNAME), Darwin)
	leaks --atExit -- ./s21_grep -e ../tests/grep_test_1.txt
 endif  

lint:
	clang-format -n s21_grep.c
	clang-format -n s21_grep.h

rebuild: clean all

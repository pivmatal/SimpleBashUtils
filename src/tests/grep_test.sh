#!/bin/bash
UNAME=$(uname -s)
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'
COUT=1;

echo -e "${YELLOW}Universal tests:${NC}"

#OK проверка без флагов один файл
grep r grep_test_1.txt > grep_test_results.txt
./s21_grep r grep_test_1.txt > s21_grep_test_results.txt
diff grep_test_results.txt s21_grep_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}: without flag is successful${NC}"
else echo -e "${RED}Test ${COUT}: without flag failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка без флагов два файла
grep r grep_test_1.txt grep_test_1.txt> grep_test_results.txt
./s21_grep  r grep_test_1.txt grep_test_1.txt> s21_grep_test_results.txt
diff grep_test_results.txt s21_grep_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}: without flag is successful${NC}"
else echo -e "${RED}Test ${COUT}: without flag failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка -i
grep -i r grep_test_1.txt grep_test_1.txt> grep_test_results.txt
./s21_grep -i r grep_test_1.txt grep_test_1.txt> s21_grep_test_results.txt
diff grep_test_results.txt s21_grep_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}:  flag -i with two file is successful${NC}"
else echo -e "${RED}Test ${COUT}:  flag -i with two file failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка -l
grep -l r grep_test_1.txt grep_test_1.txt> grep_test_results.txt
./s21_grep -l r grep_test_1.txt grep_test_1.txt> s21_grep_test_results.txt
diff grep_test_results.txt s21_grep_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}:  flag -l with two file is successful${NC}"
else echo -e "${RED}Test ${COUT}:  flag -l with two file failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка -n
grep -n r grep_test_1.txt grep_test_1.txt> grep_test_results.txt
./s21_grep -n r grep_test_1.txt grep_test_1.txt> s21_grep_test_results.txt
diff grep_test_results.txt s21_grep_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}:  flag -n with two file is successful${NC}"
else echo -e "${RED}Test ${COUT}:  flag -n with two file failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка -c
grep -c r grep_test_1.txt grep_test_1.txt> grep_test_results.txt
./s21_grep -c r grep_test_1.txt grep_test_1.txt> s21_grep_test_results.txt
diff grep_test_results.txt s21_grep_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}:  flag -c with two file is successful${NC}"
else echo -e "${RED}Test ${COUT}:  flag -c with two file failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка -c
grep -c r grep_test_1.txt > grep_test_results.txt
./s21_grep -c r  grep_test_1.txt> s21_grep_test_results.txt
diff grep_test_results.txt s21_grep_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}:  flag -c is successful${NC}"
else echo -e "${RED}Test ${COUT}:  flag -c failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка -h
grep -h '[a-z]' grep_test_1.txt grep_test_2.txt> grep_test_results.txt
./s21_grep -h '[a-z]'  grep_test_1.txt grep_test_2.txt> s21_grep_test_results.txt
diff grep_test_results.txt s21_grep_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}:  flag -h is successful${NC}"
else echo -e "${RED}Test ${COUT}:  flag -h failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка -c -n
grep -c -n r grep_test_1.txt > grep_test_results.txt
./s21_grep -c -n r  grep_test_1.txt> s21_grep_test_results.txt
diff grep_test_results.txt s21_grep_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}:  flag -c -n is successful${NC}"
else echo -e "${RED}Test ${COUT}:  flag -c -n failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка -c -n
grep -c -n r grep_test_1.txt grep_test_1.txt> grep_test_results.txt
./s21_grep -c -n r  grep_test_1.txt grep_test_1.txt> s21_grep_test_results.txt
diff grep_test_results.txt s21_grep_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}:  flag -c -n is successful${NC}"
else echo -e "${RED}Test ${COUT}:  flag -c -n failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка -c -l
grep -c -l r grep_test_1.txt grep_test_1.txt> grep_test_results.txt
./s21_grep -c -l r  grep_test_1.txt grep_test_1.txt> s21_grep_test_results.txt
diff grep_test_results.txt s21_grep_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}:  flag -c -l is successful${NC}"
else echo -e "${RED}Test ${COUT}:  flag -c -l failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка -c -l
grep -c -l r grep_test_1.txt> grep_test_results.txt
./s21_grep -c -l r  grep_test_1.txt> s21_grep_test_results.txt
diff grep_test_results.txt s21_grep_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}:  flag -c -l is successful${NC}"
else echo -e "${RED}Test ${COUT}:  flag -c -l failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка -c -l
grep -lc for s21_grep.c> grep_test_results.txt
./s21_grep  -lc for  s21_grep.c> s21_grep_test_results.txt
diff grep_test_results.txt s21_grep_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}:  flag -c -l is successful${NC}"
else echo -e "${RED}Test ${COUT}:  flag -c -l failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка -v
grep -v '[a-z]' grep_test_1.txt> grep_test_results.txt
./s21_grep -v '[a-z]'  grep_test_1.txt> s21_grep_test_results.txt
diff grep_test_results.txt s21_grep_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}:  flag -v is successful${NC}"
else echo -e "${RED}Test ${COUT}:  flag -v failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка -ivclne
grep -ivclne a grep_test_1.txt> grep_test_results.txt
./s21_grep -ivclne a  grep_test_1.txt> s21_grep_test_results.txt
diff grep_test_results.txt s21_grep_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}:  flag -ivclne is successful${NC}"
else echo -e "${RED}Test ${COUT}:  flag -ivclne failed${NC}" 
fi
COUT=$((COUT+1))


#OK проверка -e
grep -e a -e 1 -e d grep_test_1.txt> grep_test_results.txt
./s21_grep -e a -e 1 -e d  grep_test_1.txt> s21_grep_test_results.txt
diff grep_test_results.txt s21_grep_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}:  flag -e a -e 1 -e d successful${NC}"
else echo -e "${RED}Test ${COUT}:  flag -e a -e 1 -e d failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка -e
grep -e a -e 1 -e d Makefile> grep_test_results.txt
./s21_grep -e a -e 1 -e d  Makefile> s21_grep_test_results.txt
diff grep_test_results.txt s21_grep_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}:  flag -e a -e 1 -e d successful${NC}"
else echo -e "${RED}Test ${COUT}:  flag -e a -e 1 -e d failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка -e -n
grep -e a -e 1 -e d Makefile -n> grep_test_results.txt
./s21_grep -e a -e 1 -e d  Makefile -n> s21_grep_test_results.txt
diff grep_test_results.txt s21_grep_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}:  flag -e a -e 1 -e d -n successful${NC}"
else echo -e "${RED}Test ${COUT}:  flag -e a -e 1 -e d -n failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка -e -n -v
grep -e a -e 1 -e d Makefile -nv> grep_test_results.txt
./s21_grep -e a -e 1 -e d  Makefile -nv> s21_grep_test_results.txt
diff grep_test_results.txt s21_grep_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}:  flag -e a -e 1 -e d -nv successful${NC}"
else echo -e "${RED}Test ${COUT}:  flag -e a -e 1 -e d -nv failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка -ivclne
grep d Makefile -ivclne> grep_test_results.txt
./s21_grep d  Makefile -ivclne> s21_grep_test_results.txt
diff grep_test_results.txt s21_grep_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}:  flag -ivclne successful${NC}"
else echo -e "${RED}Test ${COUT}:  flag -ivclne failed${NC}" 
fi
COUT=$((COUT+1))

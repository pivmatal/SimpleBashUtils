#!/bin/bash
UNAME=$(uname -s)
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'
COUT=1;

echo -e "${YELLOW}Universal tests:${NC}"

#OK проверка без флагов один файл
cat test_case_cat.txt > cat_test_results.txt
./s21_cat test_case_cat.txt > s21_cat_test_results.txt
diff cat_test_results.txt s21_cat_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}: without flag is successful${NC}"
else echo -e "${RED}Test ${COUT}: without flag failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка без флагов несколько файлов
cat test1.txt test2.txt > cat_test_results.txt
./s21_cat test1.txt test2.txt > s21_cat_test_results.txt
diff cat_test_results.txt s21_cat_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}: without flag is successful${NC}"
else echo -e "${RED}Test ${COUT}: without flag failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка на флаг -e
cat -e test1.txt test2.txt > cat_test_results.txt
./s21_cat -e test1.txt test2.txt > s21_cat_test_results.txt
diff cat_test_results.txt s21_cat_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}: flag -e is successful${NC}"
else echo -e "${RED}Test ${COUT}: flag -e failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка на флаг -t
cat -t test1.txt test2.txt > cat_test_results.txt
./s21_cat -t test1.txt test2.txt > s21_cat_test_results.txt
diff cat_test_results.txt s21_cat_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}: flag -t is successful${NC}"
else echo -e "${RED}Test ${COUT}: flag -t failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка на флаг -n
cat -n test1.txt > cat_test_results.txt
./s21_cat -n test1.txt > s21_cat_test_results.txt
diff cat_test_results.txt s21_cat_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}: flag -n is successful${NC}"
else echo -e "${RED}Test ${COUT}: flag -n failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка на флаг -n
cat -n test1.txt test2.txt > cat_test_results.txt
./s21_cat -n test1.txt test2.txt > s21_cat_test_results.txt
diff cat_test_results.txt s21_cat_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}: flag -n is successful${NC}"
else echo -e "${RED}Test ${COUT}: flag -n failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка на флаг -s
cat -s test1.txt > cat_test_results.txt
./s21_cat -s test1.txt > s21_cat_test_results.txt
diff cat_test_results.txt s21_cat_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}: flag -s is successful${NC}"
else echo -e "${RED}Test ${COUT}: flag -s failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка на флаг -s
cat -s test1.txt test2.txt test3.txt> cat_test_results.txt
./s21_cat -s test1.txt test2.txt test3.txt> s21_cat_test_results.txt
diff cat_test_results.txt s21_cat_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}: flag -s is successful${NC}"
else echo -e "${RED}Test ${COUT}: flag -s failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка на флаг -b
cat -b test1.txt test2.txt > cat_test_results.txt
./s21_cat -b test1.txt test2.txt > s21_cat_test_results.txt
diff cat_test_results.txt s21_cat_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}: flag -b is successful${NC}"
else echo -e "${RED}Test ${COUT}: flag -b failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка на флаг -b -s
cat -b -s test1.txt test2.txt> cat_test_results.txt
./s21_cat -s -b test1.txt test2.txt > s21_cat_test_results.txt
diff cat_test_results.txt s21_cat_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}: flag -b -s is successful${NC}"
else echo -e "${RED}Test ${COUT}: flag -b -s failed${NC}" 
fi
COUT=$((COUT+1))


#OK проверка на флаг -v
cat -v test2.txt > cat_test_results.txt
./s21_cat -v  test2.txt > s21_cat_test_results.txt
diff cat_test_results.txt s21_cat_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}: flag -v is successful${NC}"
else echo -e "${RED}Test ${COUT}: flag -v failed${NC}" 
fi
COUT=$((COUT+1))


#OK проверка на флаг -benstv
cat -benstv test3.txt > cat_test_results.txt
./s21_cat -benstv  test3.txt > s21_cat_test_results.txt
diff cat_test_results.txt s21_cat_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}: flag -benstv is successful${NC}"
else echo -e "${RED}Test ${COUT}: flag -benstv failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка на флаг -vtnseb
cat -vtnseb test1.txt > cat_test_results.txt
./s21_cat -vtnseb  test1.txt > s21_cat_test_results.txt
diff cat_test_results.txt s21_cat_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}: flag -vtnseb is successful${NC}"
else echo -e "${RED}Test ${COUT}: flag -vtnseb failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка на флаг -benstv
cat -b -e -n -s -t -v test1.txt test2.txt > cat_test_results.txt
./s21_cat -b -e -n -s -t -v test1.txt test2.txt > s21_cat_test_results.txt
diff cat_test_results.txt s21_cat_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}: flag -benstv is successful${NC}"
else echo -e "${RED}Test ${COUT}: flag -benstv failed${NC}" 
fi
COUT=$((COUT+1))

#OK проверка на флаг -benstv
cat  test3.txt -benstv> cat_test_results.txt
./s21_cat  test3.txt -benstv> s21_cat_test_results.txt
diff cat_test_results.txt s21_cat_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}: flag -benstv is successful${NC}"
else echo -e "${RED}Test ${COUT}: flag -benstv failed${NC}" 
fi
COUT=$((COUT+1))


#Linux tests
if [ $UNAME =  Linux ]
then echo -e "${YELLOW}Linux tests:${NC}"
cat -T test.txt test1.txt test2.txt > cat_test_results.txt
./s21_cat -T test.txt test1.txt test2.txt > s21_cat_test_results.txt
diff cat_test_results.txt s21_cat_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}: flag -T with multiple files is successful${NC}"
else echo -e "${RED}Test ${COUT}: flag -T with multiple files failed${NC}"  
fi

cat -E test.txt test1.txt test2.txt > cat_test_results.txt
./s21_cat -E test.txt test1.txt test2.txt > s21_cat_test_results.txt
diff cat_test_results.txt s21_cat_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}: flag -E with multiple files is successful${NC}"
else echo -e "${RED}Test ${COUT}: flag -E with multiple files failed${NC}"  
fi

cat -A test.txt test1.txt test2.txt  > cat_test_results.txt > cat_test_results.txt
./s21_cat -A test.txt test1.txt test2.txt > s21_cat_test_results.txt
diff cat_test_results.txt s21_cat_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}: flag -A with multiple files is successful${NC}"
else echo -e "${RED}Test ${COUT}: flag -A with multiple files failed${NC}"  
fi

cat --show-all  test.txt test1.txt test2.txt > cat_test_results.txt 
./s21_cat --show-all test.txt test1.txt test2.txt  > s21_cat_test_results.txt
diff cat_test_results.txt s21_cat_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}: flag --show-all with multiple files is successful${NC}"
else echo -e "${RED}Test ${COUT}: flag --show-all with multiple files failed${NC}"  
fi

cat --show-nonprinting  test.txt test1.txt test2.txt > cat_test_results.txt 
./s21_cat --show-nonprinting test.txt test1.txt test2.txt  > s21_cat_test_results.txt
diff cat_test_results.txt s21_cat_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}: flag --show-nonprinting with multiple files is successful${NC}"
else echo -e "${RED}Test ${COUT}: flag --show-nonprinting with multiple files failed${NC}"  
fi

cat --show-tabs  test.txt test1.txt test2.txt > cat_test_results.txt 
./s21_cat --show-tabs test.txt test1.txt test2.txt  > s21_cat_test_results.txt
diff cat_test_results.txt s21_cat_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}:: flag --show-tabs with multiple files is successful${NC}"
else echo -e "${RED}Test ${COUT}: flag --show-tabs with multiple files failed${NC}"  
fi

cat --squeeze-blank  test.txt test3.txt test2.txt > cat_test_results.txt 
./s21_cat --squeeze-blank test.txt test3.txt test2.txt  > s21_cat_test_results.txt
diff cat_test_results.txt s21_cat_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}: flag --squeeze-blank with multiple files is successful${NC}"
else echo -e "${RED}Test ${COUT}: flag --squeeze-blank with multiple files failed${NC}"  
fi

cat --number  test.txt test3.txt test2.txt > cat_test_results.txt 
./s21_cat --number test.txt test3.txt test2.txt  > s21_cat_test_results.txt
diff cat_test_results.txt s21_cat_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}: flag --number with multiple files is successful${NC}"
else echo -e "${RED}Test ${COUT}: flag --number with multiple files failed${NC}"  
fi

cat --show-ends  test.txt test3.txt test2.txt > cat_test_results.txt 
./s21_cat --show-ends test.txt test3.txt test2.txt  > s21_cat_test_results.txt
diff cat_test_results.txt s21_cat_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}: flag --show-ends with multiple files is successful${NC}"
else echo -e "${RED}Test ${COUT}: flag --show-ends with multiple files failed${NC}"  
fi

cat --number-nonblank  test.txt test3.txt test2.txt > cat_test_results.txt 
./s21_cat --number-nonblank test.txt test3.txt test2.txt  > s21_cat_test_results.txt
diff cat_test_results.txt s21_cat_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}: flag --number-nonblank with multiple files is successful${NC}"
else echo -e "${RED}Test ${COUT}: flag --number-nonblank with multiple files failed${NC}"  
fi

cat --number-nonblank --show-ends --number --squeeze-blank --show-tabs  --show-all --show-nonprinting -A -E -T -b -e -n -s -t -v test.txt test3.txt test2.txt > cat_test_results.txt 
./s21_cat --number-nonblank --show-ends --number --squeeze-blank --show-tabs  --show-all --show-nonprinting -A -E -T -b -e -n -s -t -v test.txt test3.txt test2.txt > s21_cat_test_results.txt
diff cat_test_results.txt s21_cat_test_results.txt
if [ $? = 0 ]
then echo -e "${GREEN}Test ${COUT}: flag --number-nonblank --show-ends --number --squeeze-blank --show-tabs  --show-all --show-nonprinting -A -E -T -b -e -n -s -t -v with multiple files is successful${NC}"
else echo -e "${RED}Test ${COUT}: flag --number-nonblank --show-ends --number --squeeze-blank --show-tabs  --show-all --show-nonprinting -A -E -T -b -e -n -s -t -v with multiple files failed${NC}"  
fi

fi
#!/bin/bash

echo 1=====================================================================
./pipex ./tmp_files/infile1.txt "ls -l" "wc -l" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt ls -l | wc -l > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 2=====================================================================
./pipex ./tmp_files/infile1.txt "ls -l tmp_files" "uniq -c" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt ls -l tmp_files | uniq -c > ./tmp_files/outfile2.txt
#diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 3=====================================================================
./pipex ./tmp_files/infile1.txt "echo Hello world" "cat -e" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt echo Hello world | cat -e > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 4=====================================================================
./pipex ./tmp_files/infile1.txt "cat -e" "head -2" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt cat -e | head -2 > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 5=====================================================================
./pipex ./tmp_files/infile1.txt "ping -c 3 ya.ru" "wc -lw" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt ping -c 3 ya.ru | wc -lw > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 6=====================================================================
./pipex ./tmp_files/infile1.txt "echo Historically" "cut -b 2,4,9" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt echo Historically | cut -b 2,4,9 > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 7=====================================================================
./pipex ./tmp_files/infile1.txt "man wc" "cat" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt man wc | cat > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 8=====================================================================
./pipex ./tmp_files/infile1.txt "echo Historically" "cut -b 2" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt echo Historically | cut -b 2 > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 9=====================================================================
./pipex ./tmp_files/infile1.txt "ps" "head -1" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt ps | head -1 > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 10====================================================================
./pipex ./tmp_files/infile1.txt "stat ./tmp_files/infile1.txt" "cat -e" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt stat ./tmp_files/infile1.txt | cat -e > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 11====================================================================
./pipex ./tmp_files/infile1.txt "du -a" "grep sh" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt du -a | grep sh > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 12====================================================================
./pipex ./tmp_files/infile1.txt "du -a tmp_files" "grep sh" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt du -a tmp_files | grep sh > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 13====================================================================
./pipex ./tmp_files/infile1.txt "du -a tmp_files" "wc" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt du -a tmp_files | wc > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 14====================================================================
./pipex ./tmp_files/infile1.txt " who" " grep tty" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt who | grep tty > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 15====================================================================
./pipex ./tmp_files/infile1.txt "/bin/date -jnRu" "/bin/cat -be" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt /bin/date -jnRu | /bin/cat -be > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 16====================================================================
./pipex ./tmp_files/infile1.txt "//bin/ls -la" "//bin/cat" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt //bin/ls -la | //bin/cat > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 17=ERRORS=============================================================
./pipex

echo 18====================================================================
./pipex ./tmp_files/infile1.txt "grep tty" ./tmp_files/outfile1.txt

echo 19====================================================================
./pipex ./tmp_files/infile1.txt "who" "grep tty" "cat" ./tmp_files/outfile1.txt

echo 20====================================================================
./pipex ./tmp_files/closed1.txt "who" "grep tty" ./tmp_files/outfile1.txt

echo 21====================================================================
./pipex ./tmp_files/infile1.txt "who" "grep tty" ./tmp_files/closed2.txt

echo 22====================================================================
./pipex ./tmp_files/infile1.txt "whoareyou" "catcat -e" ./tmp_files/outfile1.txt

echo 23====================================================================
./pipex ./tmp_files/infile1.txt "qwertyu" "cat -e" ./tmp_files/outfile1.txt

echo 24====================================================================
./pipex ./tmp_files/infile1.txt "who" "cat-e" ./tmp_files/outfile1.txt

echo 25====================================================================
./pipex ./tmp_files/infile1.txt "bin/date -jnRu" "/bin/cat/ -be" ./tmp_files/outfile1.txt

echo ----------------------------------------------------------------------

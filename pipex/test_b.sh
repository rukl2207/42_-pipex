#!/bin/bash

echo 1=====================================================================
./pipex_bonus ./tmp_files/infile1.txt "ls -l" "wc -l" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt ls -l | wc -l > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 2=====================================================================
./pipex_bonus ./tmp_files/infile1.txt "ls -l tmp_files" "uniq -c" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt ls -l tmp_files | uniq -c > ./tmp_files/outfile2.txt
#diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 3=====================================================================
./pipex_bonus ./tmp_files/infile1.txt "echo Hello world" "cat -e" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt echo Hello world | cat -e > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 4=====================================================================
./pipex_bonus ./tmp_files/infile1.txt "cat -e" "head -2" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt cat -e | head -2 > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 5=====================================================================
./pipex_bonus ./tmp_files/infile1.txt "ping -c 3 ya.ru" "wc -lw" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt ping -c 3 ya.ru | wc -lw > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 6=====================================================================
./pipex_bonus ./tmp_files/infile1.txt "echo Historically" "cut -b 2,4,9" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt echo Historically | cut -b 2,4,9 > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 7=====================================================================
./pipex_bonus ./tmp_files/infile1.txt "man wc" "cat" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt man wc | cat > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 8=====================================================================
./pipex_bonus ./tmp_files/infile1.txt "echo Historically" "cut -b 2" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt echo Historically | cut -b 2 > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 9=====================================================================
./pipex_bonus ./tmp_files/infile1.txt "ps" "head -1" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt ps | head -1 > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 10====================================================================
./pipex_bonus ./tmp_files/infile1.txt "stat ./tmp_files/infile1.txt" "cat -e" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt stat ./tmp_files/infile1.txt | cat -e > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 11====================================================================
./pipex_bonus ./tmp_files/infile1.txt "du -a" "grep sh" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt du -a | grep sh > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 12====================================================================
./pipex_bonus ./tmp_files/infile1.txt "du -a tmp_files" "grep sh" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt du -a tmp_files | grep sh > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 13====================================================================
./pipex_bonus ./tmp_files/infile1.txt "du -a tmp_files" "wc" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt du -a tmp_files | wc > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 14====================================================================
./pipex_bonus ./tmp_files/infile1.txt "who" "grep tty" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt who | grep tty > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 15====================================================================
./pipex_bonus ./tmp_files/infile1.txt "/bin/date -jnRu" "/bin/cat -be" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt /bin/date -jnRu | /bin/cat -be > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 16====================================================================
./pipex_bonus ./tmp_files/infile1.txt "//bin/ls -la" "//bin/cat" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt //bin/ls -la | //bin/cat > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 17====================================================================
./pipex_bonus ./tmp_files/infile1.txt "who" "grep tty" "cat" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt who | grep tty | cat > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 18====================================================================
./pipex_bonus ./tmp_files/infile1.txt "ls -l tmp_files" "uniq -c" "wc" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt ls -l tmp_files | uniq -c | wc > ./tmp_files/outfile2.txt
#diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 19====================================================================
./pipex_bonus ./tmp_files/infile1.txt "ls -l tmp_files" "uniq -c" "grep inf" "wc -m" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt ls -l tmp_files | uniq -c | grep inf | wc -m > ./tmp_files/outfile2.txt
#diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 20====================================================================
./pipex_bonus ./tmp_files/infile1.txt "echo Hello world" "cat -e" "wc" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt echo Hello world | cat -e | wc > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 21====================================================================
./pipex_bonus ./tmp_files/infile1.txt "ping -c 3 ya.ru" "grep statistics" "wc -lw" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt ping -c 3 ya.ru | grep statistics | wc -lw > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 22====================================================================
./pipex_bonus ./tmp_files/infile1.txt "echo Historically" "cut -b 2,4,9" "wc -c" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt echo Historically | cut -b 2,4,9 | wc -c > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 23====================================================================
./pipex_bonus ./tmp_files/infile1.txt "man wc" "cat" "grep number" "wc -l" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt man wc | cat | grep number | wc -l > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 24====================================================================
./pipex_bonus ./tmp_files/infile1.txt "ps" "head -1" "wc" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt ps | head -1 | wc > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 25====================================================================
./pipex_bonus ./tmp_files/infile1.txt "stat ./tmp_files/infile1.txt" "cat -e" "wc -c" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt stat ./tmp_files/infile1.txt | cat -e | wc -c > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 26====================================================================
./pipex_bonus ./tmp_files/infile1.txt "who" "grep tty" "cat" "wc -lwm" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt who | grep tty | cat | wc -lwm > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 27====================================================================
./pipex_bonus ./tmp_files/infile1.txt "/bin/date -jnRu" "/bin/cat -be" "uniq -c" "wc" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt /bin/date -jnRu | /bin/cat -be | uniq -c | wc > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 28====================================================================
./pipex_bonus ./tmp_files/infile1.txt "//bin/ls -la" "//bin/cat" "wc" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt //bin/ls -la | //bin/cat | "wc" > ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 29====================================================================
./pipex_bonus ./tmp_files/infile1.txt "//bin/pwd " "//bin/cat -be" "wc -w" ./tmp_files/outfile1.txt
< ./tmp_files/infile2.txt //bin/pwd | //bin/cat -be | wc -w> ./tmp_files/outfile2.txt
diff ./tmp_files/outfile1.txt ./tmp_files/outfile2.txt
diff ./tmp_files/infile1.txt  ./tmp_files/infile2.txt

echo 30=ERRORS==============================================================
./pipex_bonus

echo 31=====================================================================
./pipex_bonus ./tmp_files/infile1.txt "grep tty" ./tmp_files/outfile1.txt

echo 32====================================================================
./pipex_bonus ./tmp_files/closed1.txt "who" "grep tty" ./tmp_files/outfile1.txt

echo 33====================================================================
./pipex_bonus ./tmp_files/infile1.txt "who" "grep tty" ./tmp_files/closed2.txt

echo 34====================================================================
./pipex_bonus ./tmp_files/infile1.txt "whoareyou" "catcat -e" ./tmp_files/outfile1.txt

echo 35====================================================================
./pipex_bonus ./tmp_files/infile1.txt "qwertyu" "cat -e" ./tmp_files/outfile1.txt

echo 36====================================================================
./pipex_bonus ./tmp_files/infile1.txt "who" "cat-e" ./tmp_files/outfile1.txt

echo 35====================================================================
./pipex_bonus ./tmp_files/infile1.txt "bin/date -jnRu" "/bin/cat/ -be"  "wc" ./tmp_files/outfile1.txt

echo ----------------------------------------------------------------------

# ./pipex_bonus here_doc LIMITER "wc -w" "cat -e" ./tmp_files/outfile3.txt
# wc -w << LIMITER | cat -e >> ./tmp_files/outfile4.txt
# diff tmp_files/outfile3.txt tmp_files/outfile4.txt

# ./pipex_bonus here_doc LIMITER "uniq -c" "grep 2" "wc -l" "cat -e" ./tmp_files/outfile3.txt
# uniq -c << LIMITER | grep 2 | wc -l | cat -e >> ./tmp_files/outfile4.txt
# diff tmp_files/outfile3.txt tmp_files/outfile4.txt

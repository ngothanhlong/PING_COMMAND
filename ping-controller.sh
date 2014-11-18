#!/bin/bash
#@: VDCIT@OpenStack
#@: Test ip cho cac may
#@ Controller
###############################

echo -e "\e[92m Ping toi dai 10.30.0.0  \e[0m"
for i in {1,11,21,31,32,33,101,111}; do timeout 1 ping -c 1 10.30.0.$i >/dev/null && echo $_>ping-cont30.txt; done

echo -e "\e[92m Ping toi dai 10.40.0.0  \e[0m"
for i in {1,21,31,32,33}; do timeout 1 ping -c 1 10.40.0.$i >/dev/null && echo $_>>ping-cont40.txt; done

awk '{print $1}' ping-cont30.txt | sort | uniq -c | sort -n
wc -l < ping-cont30.txt

awk '{print $1}' ping-cont40.txt | sort | uniq -c | sort -n
wc -l < ping-cont40.txt
 
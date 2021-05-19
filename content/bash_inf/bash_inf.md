---
title: "Bash"

description: ""

cover: "https://hsto.org/webt/hv/j_/81/hvj_81nnk7sst8bq3eclmlzkfec.png"
---

1. IF  
if [[ condition ]]; then
commands  
fi 

2. IF-THEN-ELSE    
if [[ condition ]]; then  
commands 1  
else  
commands 2  
fi  

3. FOR  
for var in list  
do  
commands 
done  

4. WHILE  
while [ condition ]  
do  
commands 
done  

5. CASE  
case "$variable" in  
"$condition1" ) command... ;;  
"$condition2" ) command... ;;  
esac  
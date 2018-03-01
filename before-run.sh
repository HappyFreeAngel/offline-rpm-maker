#!/bin/bash
#确保shell 切换到当前shell 脚本文件夹
current_file_path=$(cd "$(dirname "$0")"; pwd)
cd ${current_file_path}

#查找并批量拷贝各个目录下的文件到一个目录下.
#!/bin/bash
echo "">`pwd`/temp.txt
ymls=$(find `pwd`  -name  "*.yml" | grep '.yml')
for file in $ymls
  do
       #cp $file /root/ansible-offline-install/
       #cat $file | grep 'copy: src=' | awk '{print $2 }' | grep 'src=' | sort -u -d| sort 
       cat $file | grep 'copy: src=' | awk '{print $2 }' | grep 'src=' | sort -u -d >>`pwd`/temp.txt
  done


 sed -i -e 's/src=//' `pwd`/temp.txt
 sort -u -d `pwd`/temp.txt>`pwd`/temp_sorted.txt

 echo "">`pwd`/temp_file_not_exist.txt
 m=0
 file=`pwd`/temp_sorted.txt
 while IFS= read line
 do
         # display $line or do somthing with $line
         #echo "$line"
         temp_file=`pwd`/"$line"
         if [ -e $temp_file ]
         then
             m=m+1
         else
             echo "$temp_file is not exist!"
             echo "$temp_file">>`pwd`/temp_file_not_exist.txt
         fi

 done <"$file"

 rm `pwd`/temp.txt
 rm `pwd`/temp_sorted.txt







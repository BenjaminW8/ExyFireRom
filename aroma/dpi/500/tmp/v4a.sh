#!/sbin/sh
busybox mount /data
busybox mount /system


cp /system/build.prop /sdcard/build.prop.bak

$BB echo " " >> "/system/tweaks.txt";

while IFS= read -r line; do
      BLANK=`$BB echo "$line"`;
      if [ ! -z "${BLANK// }" ]; then 
      
      FIND=`$BB echo "$line" | cut -d= -f1`;
			FIND+="=";
			SEARCH=`$BB grep "$FIND" "/system/build.prop"`;
    
			if [ ! -z "$SEARCH" ]; then
				$BB sed -i "/$FIND/d" "/system/build.prop";
			fi;
      fi;
     $BB echo "$line" >> "/system/build.prop";
done < "/system/tweaks.txt"


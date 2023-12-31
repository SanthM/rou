tset=/data/tbm-set

Fullscreen_force(){
UNMARK;TPUT 1 1; $E " "
}

ff=Fullscreen_force

MARK(){ $e "\e[7m\e[3$(( $RANDOM * 6 / 32767 + 1 ))m";}
UNMARK(){ $e "\e[27m";}

Case_universal="
______________________
 | |Super image kitchen GUI
 | |By TakuruKagami
 | |
 | |
 | |
 | |
 | |
 | |
 | |
 ||||||||||||||||||||||"

Build_done="
______________________
 | |Super image kitchen GUI
 | |> Build Done
 | |
 | |
 | |
 | |
 | |
 | |
 | |
 ||||||||||||||||||||||"
 
clear_kitchen="
______________________
 | |Super image kitchen GUI
 | |> Clear temp folder done
 | |
 | |
 | |
 | |
 | |
 | |
 | |
 ||||||||||||||||||||||"
 
clear2_kitchen="
______________________
 | |Super image kitchen GUI
 | |> Clear build folder done
 | |
 | |
 | |
 | |
 | |
 | |
 | |
 ||||||||||||||||||||||"
 
failed_build="
______________________
 | |Super image kitchen GUI
 | |> Failed to Build
 | |- Size IMG too big
 | |
 | |
 | |
 | |
 | |
 | |
 ||||||||||||||||||||||
"

Extract_done="
______________________
 | |Super image kitchen GUI
 | |> Extract Done
 | |
 | |
 | |
 | |
 | |
 | |
 | |
 ||||||||||||||||||||||
"

Build_rom (){
super_info="
______________________
 | |Super image info :
 | |
 | |Super size : $(<~/kitchen-tmp/super.txt)
 | |For logical size : $(<~/kitchen-tmp/main.txt)
 | |System size : $(ls -nl $internal_root/build-kitchen/system.img | awk '{print $5}')
 | |Vendor size : $(ls -nl $internal_root/build-kitchen/vendor.img | awk '{print $5}')
 | |Product size : $(ls -nl $internal_root/build-kitchen/product.img | awk '{print $5}')
 | |System ext size : $(ls -nl $internal_root/build-kitchen/system_ext.img | awk '{print $5}')
 | |Odm size : $(ls -nl $internal_root/build-kitchen/odm.img | awk '{print $5}')
||||||||||||||||||||||"

if [ -e ~/kitchen-tmp/super_map.txt ]
then
failed_build (){
clear
      E='echo -e';e='echo -en';trap "R;exit" 2
    ESC=$( $e "\e")
   TPUT(){ $e "\e[${1};${2}H";}
  CLEAR(){ $e "\ec";}
  CIVIS(){ $e "\e[?25l";}
   DRAW(){ $e "\e%@\e(0";}
  WRITE(){ $e "\e(B";}
      R(){ CLEAR ;stty sane;$e "\ec\e[37;00m\e[J";};
   HEAD(){ DRAW
           for each in $(seq 45 25);do
           $E "   x                                          x"
           done
           WRITE;MARK;TPUT 1 1
           $E " ";UNMARK;}
           i=0; CLEAR; CIVIS;NULL=/dev/null
   FOOT(){ MARK;TPUT 47 2
           printf "ENTER - SELECT,NEXT                     ";TPUT  2 2; $e "Super Kitchen Tools Termux GUI           ";}
   FOOT2(){ UNMARK;TPUT 3 45
   printf "$set_info";}
  ARROW(){ read -s -n3 key 2>/dev/null >&2
           if [[ $key = $ESC[A ]];then echo up;fi
           if [[ $key = $ESC[B ]];then echo dn;fi;}
     M0(){ TPUT 16 $MU_X; $e "Back to Build menu              ";$ff;}
     M1(){ TPUT 18 $MU_X; $e "Back to Main menu               ";$ff;}
      LM=1
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ clear;set_info=$failed_build;R;HEAD;FOOT2;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
   ES(){ MARK;$e "ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
        0) S=M0;SC;if [[ $cur == "" ]];then R;clear;Build_rom;INIT;fi;;
        1) S=M1;SC;if [[ $cur == "" ]];then R;clear;main_main;INIT;fi;;
 esac;POS;done
}

build_done (){
clear
      E='echo -e';e='echo -en';trap "R;exit" 2
    ESC=$( $e "\e")
   TPUT(){ $e "\e[${1};${2}H";}
  CLEAR(){ $e "\ec";}
  CIVIS(){ $e "\e[?25l";}
   DRAW(){ $e "\e%@\e(0";}
  WRITE(){ $e "\e(B";}
      R(){ CLEAR ;stty sane;$e "\ec\e[37;00m\e[J";};
   HEAD(){ DRAW
           for each in $(seq 45 25);do
           $E "   x                                          x"
           done
           WRITE;MARK;TPUT 1 1
           $E " ";UNMARK;}
           i=0; CLEAR; CIVIS;NULL=/dev/null
   FOOT(){ MARK;TPUT 47 2
           printf "ENTER - SELECT,NEXT                     ";TPUT  2 2; $e "Super Kitchen Tools Termux GUI           ";}
   FOOT2(){ UNMARK;TPUT 3 45
   printf "$set_info";}
  ARROW(){ read -s -n3 key 2>/dev/null >&2
           if [[ $key = $ESC[A ]];then echo up;fi
           if [[ $key = $ESC[B ]];then echo dn;fi;}
     M0(){ TPUT 16 $MU_X; $e "Back to Build menu              ";$ff;}
     M1(){ TPUT 18 $MU_X; $e "Back to Main menu               ";$ff;}
      LM=1
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ clear;set_info=$Build_done;R;HEAD;FOOT2;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
   ES(){ MARK;$e "ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
        0) S=M0;SC;if [[ $cur == "" ]];then R;clear;Build_rom;INIT;fi;;
        1) S=M1;SC;if [[ $cur == "" ]];then R;clear;main_main;INIT;fi;;
 esac;POS;done
}

build_super (){
if [ "$(find $internal_root/build-kitchen/system.img -type f ! -size 0 -printf '%S\n' | sed 's/\.[0-9]*//')" == 1 ]
then
echo " "
else
simg2img $internal_root/build-kitchen/system.img $internal_root/build-kitchen/system.raw.img
fi
if [ -e $internal_root/build-kitchen/odm.img ]
then
if [ -e $internal_root/build-kitchen/product.img ]
then
echo " "
else
cp -rf ~/rou/fake/product.img $internal_root/build-kitchen/
fi
lpmake --metadata-size 65536 --super-name super --metadata-slots 2 --device super:$(<~/kitchen-tmp/super.txt) --group main:$(<~/kitchen-tmp/main.txt) --partition system:readonly:$(ls -nl $internal_root/build-kitchen/system.img | awk '{print $5}'):main --image system=$internal_root/build-kitchen/system.img --partition vendor:readonly:$(ls -nl $internal_root/build-kitchen/vendor.img | awk '{print $5}'):main --image vendor=$internal_root/build-kitchen/vendor.img --partition product:readonly:$(ls -nl $internal_root/build-kitchen/product.img | awk '{print $5}'):main --image product=$internal_root/build-kitchen/product.img --partition odm:readonly:$(ls -nl $internal_root/build-kitchen/odm.img | awk '{print $5}'):main --image odm=$internal_root/build-kitchen/odm.img --sparse --output super.img
else
if [ -e $internal_root/build-kitchen/product.img ]
then
echo " "
else
cp -rf ~/rou/fake/product.img $internal_root/build-kitchen/
fi
if [ -e $internal_root/build-kitchen/system_ext.img ]
then
echo " "
else
cp -rf ~/rou/fake/system_ext.img $internal_root/build-kitchen/
fi
lpmake --metadata-size 65536 --super-name super --metadata-slots 2 --device super:$(<~/kitchen-tmp/super.txt) --group main:$(<~/kitchen-tmp/main.txt) --partition system:readonly:$(ls -nl $internal_root/build-kitchen/system.img | awk '{print $5}'):main --image system=$internal_root/build-kitchen/system.img --partition vendor:readonly:$(ls -nl $internal_root/build-kitchen/vendor.img | awk '{print $5}'):main --image vendor=$internal_root/build-kitchen/vendor.img --partition product:readonly:$(ls -nl $internal_root/build-kitchen/product.img | awk '{print $5}'):main --image product=$internal_root/build-kitchen/product.img --partition system_ext:readonly:$(ls -nl $internal_root/build-kitchen/system_ext.img | awk '{print $5}'):main --image system_ext=$internal_root/build-kitchen/system_ext.img --sparse --output super.img
fi
}

build_now (){
build_super

tar -cvf $internal_root/build-kitchen/super.tar super.img
rm -rf ./super.img

if [ "$(ls -nl $internal_root/build-kitchen/super.tar | awk '{print $5}')" -lt 100000 ]
then
failed_build
else
build_done
fi
}

build_lz4 (){
build_super

lz4 super.img
tar -cvf $internal_root/build-kitchen/super.tar super.img.lz4
rm -rf ./super.img.lz4
rm -rf ./super.img

if [ "$(ls -nl $internal_root/build-kitchen/super.tar | awk '{print $5}')" -lt 100000 ]
then
failed_build
else
build_done
fi
}

build_xz (){
build_super

tar --xz -cvf $internal_root/build-kitchen/super.tar.xz super.img
rm -rf ./super.img

if [ "$(ls -nl $internal_root/build-kitchen/super.tar.xz | awk '{print $5}')" -lt 100000 ]
then
failed_build
else
build_done
fi
}

build_gz (){
build_super

tar -zcvf $internal_root/build-kitchen/super.tar.gz super.img
rm -rf ./super.img

if [ "$(ls -nl $internal_root/build-kitchen/super.tar.gz | awk '{print $5}')" -lt 100000 ]
then
failed_build
else
build_done
fi
}

build_7z (){
build_super

7z a $internal_root/build-kitchen/super.7z $internal_root/build-kitchen/super.img
rm -rf ./super.img

if [ "$(ls -nl $internal_root/build-kitchen/super.7z | awk '{print $5}')" -lt 100000 ]
then
failed_build
else
build_done
fi
}

super_info="
______________________
 | |Super image info :
 | |
 | |Super size : $(<~/kitchen-tmp/super.txt)
 | |For logical size : $(<~/kitchen-tmp/main.txt)
 | |System size : $(ls -nl $internal_root/build-kitchen/system.img | awk '{print $5}')
 | |Vendor size : $(ls -nl $internal_root/build-kitchen/vendor.img | awk '{print $5}')
 | |Product size : $(ls -nl $internal_root/build-kitchen/product.img | awk '{print $5}')
 | |System ext size : $(ls -nl $internal_root/build-kitchen/system_ext.img | awk '{print $5}')
 | |Odm size : $(ls -nl $internal_root/build-kitchen/odm.img | awk '{print $5}')
||||||||||||||||||||||"

Build_archive (){
clear
      E='echo -e';e='echo -en';trap "R;exit" 2
    ESC=$( $e "\e")
   TPUT(){ $e "\e[${1};${2}H";}
  CLEAR(){ $e "\ec";}
  CIVIS(){ $e "\e[?25l";}
   DRAW(){ $e "\e%@\e(0";}
  WRITE(){ $e "\e(B";}
      R(){ CLEAR ;stty sane;$e "\ec\e[37;00m\e[J";};
   HEAD(){ DRAW
           for each in $(seq 45 25);do
           $E "   x                                          x"
           done
           WRITE;MARK;TPUT 1 1
           $E " ";UNMARK;}
           i=0; CLEAR; CIVIS;NULL=/dev/null
   FOOT(){ MARK;TPUT 47 2
           printf "ENTER - SELECT,NEXT                     ";TPUT  2 2; $e "Super Kitchen Tools Termux GUI           ";}
   FOOT2(){ UNMARK;TPUT 3 45
   printf "$set_info";}
  ARROW(){ read -s -n3 key 2>/dev/null >&2
           if [[ $key = $ESC[A ]];then echo up;fi
           if [[ $key = $ESC[B ]];then echo dn;fi;}
     M0(){ TPUT 16 $MU_X; $e "Build with tar.gz               ";$ff;}
     M1(){ TPUT 18 $MU_X; $e "Build with tar.xz               ";$ff;}
     M2(){ TPUT 20 $MU_X; $e "Build with 7z                   ";$ff;}
     M3(){ TPUT 22 $MU_X; $e "exit                            ";$ff;}
      LM=3
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ clear;set_info=$super_info;R;HEAD;FOOT2;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
   ES(){ MARK;$e "ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
        0) S=M0;SC;if [[ $cur == "" ]];then R;clear;build_gz;INIT;fi;;
        1) S=M1;SC;if [[ $cur == "" ]];then R;clear;build_xz;INIT;fi;;
        2) S=M2;SC;if [[ $cur == "" ]];then R;clear;build_7z;INIT;fi;;
        3) S=M3;SC;if [[ $cur == "" ]];then R;clear;Build_rom;fi;;
 esac;POS;done
 }

cd $internal_root/build-kitchen/
clear
      E='echo -e';e='echo -en';trap "R;exit" 2
    ESC=$( $e "\e")
   TPUT(){ $e "\e[${1};${2}H";}
  CLEAR(){ $e "\ec";}
  CIVIS(){ $e "\e[?25l";}
   DRAW(){ $e "\e%@\e(0";}
  WRITE(){ $e "\e(B";}
      R(){ CLEAR ;stty sane;$e "\ec\e[37;00m\e[J";};
   HEAD(){ DRAW
           for each in $(seq 45 25);do
           $E "   x                                          x"
           done
           WRITE;MARK;TPUT 1 1
           $E " ";UNMARK;}
           i=0; CLEAR; CIVIS;NULL=/dev/null
   FOOT(){ MARK;TPUT 47 2
           printf "ENTER - SELECT,NEXT                     ";TPUT  2 2; $e "Super Kitchen Tools Termux GUI           ";}
   FOOT2(){ UNMARK;TPUT 3 45
   printf "$set_info";}
  ARROW(){ read -s -n3 key 2>/dev/null >&2
           if [[ $key = $ESC[A ]];then echo up;fi
           if [[ $key = $ESC[B ]];then echo dn;fi;}
     M0(){ TPUT 16 $MU_X; $e "Build                           ";$ff;}
     M1(){ TPUT 18 $MU_X; $e "Build with lz4.tar              ";$ff;}
     M2(){ TPUT 20 $MU_X; $e "Build tar with extra archive    ";$ff;}
     M3(){ TPUT 22 $MU_X; $e "exit                            ";$ff;}
      LM=3
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ clear;set_info=$super_info;R;HEAD;FOOT2;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
   ES(){ MARK;$e "ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
        0) S=M0;SC;if [[ $cur == "" ]];then R;clear;build_now;INIT;fi;;
        1) S=M1;SC;if [[ $cur == "" ]];then R;clear;build_lz4;INIT;fi;;
        2) S=M2;SC;if [[ $cur == "" ]];then R;clear;Build_archive;INIT;fi;;
        3) S=M3;SC;if [[ $cur == "" ]];then R;clear;main_main;fi;;
 esac;POS;done
else
clear
dirf=~/rou/fake/profile
TPUT  6 1;ls -x $dirf
UNMARK
TPUT  1 1;$e " |Profile| ";
MARK;TPUT 3 1;$e "	______________________
"
TPUT  3 1;$e "| write "exit" for cancel |";
UNMARK
MARK;TPUT 47 1;$e "	                        ";TPUT 47 1;$e "Select profile from list:";read p;UNMARK;
case $p in
"")
echo "Select in menu or exit"
;;
"exit")
clear
fontceti
;;
*)
cp -rf ~/rou/fake/profile/$p ~/kitchen-tmp/
mv -f ~/kitchen-tmp/$p ~/kitchen-tmp/super_map.txt
printf "$(<~/kitchen-tmp/super_map.txt)" | grep -e "Size:" | awk '{print $2}' > ~/kitchen-tmp/super.txt
printf "$(<~/kitchen-tmp/super_map.txt)" | grep -e "Maximum size:" | awk '{print $3}' | sed '2!d' > ~/kitchen-tmp/main.txt
clear
Build_rom
;;
esac
fi
}

Extract_rom (){
save_profile (){
dirf=~/rou/fake/profile
TPUT  6 1;ls -x $dirf
UNMARK
TPUT  1 1;$e " |Profile| ";
MARK;TPUT 3 1;$e "	______________________
"
TPUT  3 1;$e "| write "exit" for cancel |";
UNMARK
MARK;TPUT 47 1;$e "	                        ";TPUT 47 1;$e "Select profile from list:";read p;UNMARK;
case $p in
"")
echo "Select in menu or exit"
;;
"exit")
clear
fontceti
;;
*)
cp -rf ~/kitchen-tmp/super_map.txt ~/rou/fake/profile/$p
clear
Build_rom
;;
esac
}

extract_done (){
clear
      E='echo -e';e='echo -en';trap "R;exit" 2
    ESC=$( $e "\e")
   TPUT(){ $e "\e[${1};${2}H";}
  CLEAR(){ $e "\ec";}
  CIVIS(){ $e "\e[?25l";}
   DRAW(){ $e "\e%@\e(0";}
  WRITE(){ $e "\e(B";}
      R(){ CLEAR ;stty sane;$e "\ec\e[37;00m\e[J";};
   HEAD(){ DRAW
           for each in $(seq 45 25);do
           $E "   x                                          x"
           done
           WRITE;MARK;TPUT 1 1
           $E " ";UNMARK;}
           i=0; CLEAR; CIVIS;NULL=/dev/null
   FOOT(){ MARK;TPUT 47 2
           printf "ENTER - SELECT,NEXT                     ";TPUT  2 2; $e "Super Kitchen Tools Termux GUI           ";}
   FOOT2(){ UNMARK;TPUT 3 45
   printf "$set_info";}
  ARROW(){ read -s -n3 key 2>/dev/null >&2
           if [[ $key = $ESC[A ]];then echo up;fi
           if [[ $key = $ESC[B ]];then echo dn;fi;}
     M0(){ TPUT 16 $MU_X; $e "Back to Extract menu              ";$ff;}
     M1(){ TPUT 18 $MU_X; $e "Save this profile                 ";$ff;}
      LM=1
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ clear;set_info=$Extract_done;R;HEAD;FOOT2;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
   ES(){ MARK;$e "ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
        0) S=M0;SC;if [[ $cur == "" ]];then R;clear;Extract_rom;INIT;fi;;
        1) S=M1;SC;if [[ $cur == "" ]];then R;clear;save_profile;INIT;fi;;
 esac;POS;done
}

extract_internal (){
if [ -e $internal_root/build-kitchen/AP_*.tar.md5 ]
then
cd ~
mkdir $internal_root/build-kitchen/AP
7z e $internal_root/build-kitchen/AP_*.tar.md5 -o$(pwd)/storage/shared/build-kitchen/AP/
if [ -e $internal_root/build-kitchen/AP/super.img.lz4 ]
then
mv -f $internal_root/build-kitchen/AP/super.img.lz4 $internal_root/build-kitchen/
else
mv -f $internal_root/build-kitchen/AP/super.img $internal_root/build-kitchen/
fi
else
echo " "
fi
rm -rf $internal_root/build-kitchen/AP/
if [ -e $internal_root/build-kitchen/super.img.lz4 ]
then
unlz4 --rm $internal_root/build-kitchen/super.img.lz4
else
echo " "
fi
simg2img $internal_root/build-kitchen/super.img $internal_root/build-kitchen/super_raw.img
if [ "$(ls -nl $internal_root/build-kitchen/super_raw.img | awk '{print $5}')" -lt 100000 ]
then
rm -rf $internal_root/build-kitchen/super_raw.img 
lpdump $internal_root/build-kitchen/super.img > ~/kitchen-tmp/super_map.txt
printf "$(<~/kitchen-tmp/super_map.txt)" | grep -e "Size:" | awk '{print $2}' > ~/kitchen-tmp/super.txt
printf "$(<~/kitchen-tmp/super_map.txt)" | grep -e "Maximum size:" | awk '{print $3}' | sed '2!d' > ~/kitchen-tmp/main.txt
lpunpack $internal_root/build-kitchen/super.img $internal_root/build-kitchen/
else
rm -rf $internal_root/build-kitchen/super.img
lpdump $internal_root/build-kitchen/super_raw.img > ~/kitchen-tmp/super_map.txt
printf "$(<~/kitchen-tmp/super_map.txt)" | grep -e "Size:" | awk '{print $2}' > ~/kitchen-tmp/super.txt
printf "$(<~/kitchen-tmp/super_map.txt)" | grep -e "Maximum size:" | awk '{print $3}' | sed '2!d' > ~/kitchen-tmp/main.txt
lpunpack $internal_root/build-kitchen/super_raw.img $internal_root/build-kitchen/
fi
extract_done
}

extract_root (){
if [ "$(id -u)" != "0" ]; then
echo "This script must be run as root" 1>&2
else
lpdump /dev/block/by-name/super > ~/kitchen-tmp/super_map.txt
printf "$(<~/kitchen-tmp/super_map.txt)" | grep -e "Size:" | awk '{print $2}' > ~/kitchen-tmp/super.txt
printf "$(<~/kitchen-tmp/super_map.txt)" | grep -e "Maximum size:" | awk '{print $3}' | sed '2!d' > ~/kitchen-tmp/main.txt
lpunpack /dev/block/by-name/super $internal_root/build-kitchen/
fi
extract_done
}

super_info="
______________________
 | |Super image info :
 | |
 | |Super size : $(<~/kitchen-tmp/super.txt)
 | |For logical size : $(<~/kitchen-tmp/main.txt)
 | |System size : $(ls -nl $internal_root/build-kitchen/system.img | awk '{print $5}')
 | |Vendor size : $(ls -nl $internal_root/build-kitchen/vendor.img | awk '{print $5}')
 | |Product size : $(ls -nl $internal_root/build-kitchen/product.img | awk '{print $5}')
 | |System ext size : $(ls -nl $internal_root/build-kitchen/system_ext.img | awk '{print $5}')
 | |Odm size : $(ls -nl $internal_root/build-kitchen/odm.img | awk '{print $5}')
||||||||||||||||||||||"

clear
      E='echo -e';e='echo -en';trap "R;exit" 2
    ESC=$( $e "\e")
   TPUT(){ $e "\e[${1};${2}H";}
  CLEAR(){ $e "\ec";}
  CIVIS(){ $e "\e[?25l";}
   DRAW(){ $e "\e%@\e(0";}
  WRITE(){ $e "\e(B";}
      R(){ CLEAR ;stty sane;$e "\ec\e[37;00m\e[J";};
   HEAD(){ DRAW
           for each in $(seq 45 25);do
           $E "   x                                          x"
           done
           WRITE;MARK;TPUT 1 1
           $E " ";UNMARK;}
           i=0; CLEAR; CIVIS;NULL=/dev/null
   FOOT(){ MARK;TPUT 47 2
           printf "ENTER - SELECT,NEXT                     ";TPUT  2 2; $e "Super Kitchen Tools Termux GUI           ";}
   FOOT2(){ UNMARK;TPUT 3 45
   printf "$set_info";}
  ARROW(){ read -s -n3 key 2>/dev/null >&2
           if [[ $key = $ESC[A ]];then echo up;fi
           if [[ $key = $ESC[B ]];then echo dn;fi;}
     M0(){ TPUT 16 $MU_X; $e "Extract from current phone(root)";$ff;}
     M1(){ TPUT 18 $MU_X; $e "Extract from internal           ";$ff;}
     M2(){ TPUT 20 $MU_X; $e "Exit                            ";$ff;}
      LM=2 
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ clear;set_info=$super_info;R;HEAD;FOOT2;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
   ES(){ MARK;$e "ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
        0) S=M0;SC;if [[ $cur == "" ]];then R;clear;extract_root;Extract_rom;INIT;fi;;
        1) S=M1;SC;if [[ $cur == "" ]];then R;clear;extract_internal;Extract_rom;INIT;fi;;
        2) S=M2;SC;if [[ $cur == "" ]];then R;clear;main_main;fi;;
 esac;POS;done
}

clear_kitchen (){
Build_remove (){
rm -rf ~/build-kitchen/*

clear
      E='echo -e';e='echo -en';trap "R;exit" 2
    ESC=$( $e "\e")
   TPUT(){ $e "\e[${1};${2}H";}
  CLEAR(){ $e "\ec";}
  CIVIS(){ $e "\e[?25l";}
   DRAW(){ $e "\e%@\e(0";}
  WRITE(){ $e "\e(B";}
      R(){ CLEAR ;stty sane;$e "\ec\e[37;00m\e[J";};
   HEAD(){ DRAW
           for each in $(seq 45 25);do
           $E "   x                                          x"
           done
           WRITE;MARK;TPUT 1 1
           $E " ";UNMARK;}
           i=0; CLEAR; CIVIS;NULL=/dev/null
   FOOT(){ MARK;TPUT 47 2
           printf "ENTER - SELECT,NEXT                     ";TPUT  2 2; $e "Super Kitchen Tools Termux GUI           ";}
   FOOT2(){ UNMARK;TPUT 3 45
   printf "$set_info";}
  ARROW(){ read -s -n3 key 2>/dev/null >&2
           if [[ $key = $ESC[A ]];then echo up;fi
           if [[ $key = $ESC[B ]];then echo dn;fi;}
     M0(){ TPUT 18 $MU_X; $e "Back to Main menu               ";$ff;}
      LM=0
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ clear;set_info=$clear2_kitchen;R;HEAD;FOOT2;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
   ES(){ MARK;$e "ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
        0) S=M1;SC;if [[ $cur == "" ]];then R;clear;main_main;INIT;fi;;
 esac;POS;done
 }

rm -rf ~/kitchen-tmp

clear
      E='echo -e';e='echo -en';trap "R;exit" 2
    ESC=$( $e "\e")
   TPUT(){ $e "\e[${1};${2}H";}
  CLEAR(){ $e "\ec";}
  CIVIS(){ $e "\e[?25l";}
   DRAW(){ $e "\e%@\e(0";}
  WRITE(){ $e "\e(B";}
      R(){ CLEAR ;stty sane;$e "\ec\e[37;00m\e[J";};
   HEAD(){ DRAW
           for each in $(seq 45 25);do
           $E "   x                                          x"
           done
           WRITE;MARK;TPUT 1 1
           $E " ";UNMARK;}
           i=0; CLEAR; CIVIS;NULL=/dev/null
   FOOT(){ MARK;TPUT 47 2
           printf "ENTER - SELECT,NEXT                     ";TPUT  2 2; $e "Super Kitchen Tools Termux GUI           ";}
   FOOT2(){ UNMARK;TPUT 3 45
   printf "$set_info";}
  ARROW(){ read -s -n3 key 2>/dev/null >&2
           if [[ $key = $ESC[A ]];then echo up;fi
           if [[ $key = $ESC[B ]];then echo dn;fi;}
     M0(){ TPUT 16 $MU_X; $e "Delete folder build-kitchen    ";$ff;}
     M1(){ TPUT 18 $MU_X; $e "Back to Main menu               ";$ff;}
      LM=1
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ clear;set_info=$clear_kitchen;R;HEAD;FOOT2;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
   ES(){ MARK;$e "ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
        0) S=M0;SC;if [[ $cur == "" ]];then R;clear;Build_remove;INIT;fi;;
        1) S=M1;SC;if [[ $cur == "" ]];then R;clear;main_main;INIT;fi;;
 esac;POS;done
}

main_main(){
clear
      E='echo -e';e='echo -en';trap "R;exit" 2
    ESC=$( $e "\e")
   TPUT(){ $e "\e[${1};${2}H";}
  CLEAR(){ $e "\ec";}
  CIVIS(){ $e "\e[?25l";}
   DRAW(){ $e "\e%@\e(0";}
  WRITE(){ $e "\e(B";}
      R(){ CLEAR ;stty sane;$e "\ec\e[37;00m\e[J";};
   HEAD(){ DRAW
           for each in $(seq 45 25);do
           $E "   x                                          x"
           done
           WRITE;MARK;TPUT 1 1
           $E " ";UNMARK;}
           i=0; CLEAR; CIVIS;NULL=/dev/null
   FOOT(){ MARK;TPUT 47 2
           printf "ENTER - SELECT,NEXT                     ";TPUT  2 2; $e "Super Kitchen Tools Termux GUI           ";}
   FOOT2(){ UNMARK;TPUT 3 45
   printf "$set_info";}
   
if [ -e ~/rou/complete.txt ]
then
if [ "$(getprop ro.product.cpu.abi)" == "armeabi-v7a" ]
then
internal_root=~/storage/shared
else
if [ "$(getprop ro.product.cpu.abi)" == "arm64-v8a" ]
then
internal_root=~/storage/shared
else
if [ "$(dpkg --print-architecture)" == "amd64" ]
then
internal_root="$(echo "$(<~/rou/pc.txt)")"
else
echo "False"
main_main
fi
fi
fi
else
if [ "$(getprop ro.product.cpu.abi)" == "armeabi-v7a" ]
then
dpkg -i ~/rou/deb/arm32/android-tools.deb
dpkg -i ~/rou/deb/arm32/abseil-cpp.deb
dpkg -i ~/rou/deb/arm32/brotli.deb
dpkg -i ~/rou/deb/arm32/liblz4.deb
dpkg -i ~/rou/deb/arm32/libprotobuff.deb
dpkg -i ~/rou/deb/arm32/lz4.deb
dpkg -i ~/rou/deb/arm32/libusb.deb
dpkg -i ~/rou/deb/arm32/zstd.deb
dpkg -i ~/rou/deb/arm32/p7zip.deb
internal_root=~/storage/shared
echo "binary installed" > ~/rou/complete.txt
else
if [ "$(getprop ro.product.cpu.abi)" == "arm64-v8a" ]
then
dpkg -i ~/rou/deb/arm64/android-tools.deb
dpkg -i ~/rou/deb/arm64/abseil-cpp.deb
dpkg -i ~/rou/deb/arm64/brotli.deb
dpkg -i ~/rou/deb/arm64/liblz4.deb
dpkg -i ~/rou/deb/arm64/libprotobuff.deb
dpkg -i ~/rou/deb/arm64/lz4.deb
dpkg -i ~/rou/deb/arm64/libusb.deb
dpkg -i ~/rou/deb/arm64/zstd.deb
dpkg -i ~/rou/deb/arm64/p7zip.deb
internal_root=~/storage/shared
echo "binary installed" > ~/rou/complete.txt
else
if [ "$(dpkg --print-architecture)" == "amd64" ]
then
cp -f ~/rou/deb/PC/* /bin
clear
dirf=/mnt
TPUT  6 1;ls -x $dirf
UNMARK
TPUT  1 1;$e " |Drive| ";
MARK;TPUT 3 1;$e "	______________________
"
TPUT  3 1;$e "| write "exit" for cancel |";
UNMARK
MARK;TPUT 47 1;$e "	                        ";TPUT 47 1;$e "Select drive from list:";read p;UNMARK;
case $p in
"")
echo "not select anything exit"
exit
;;
"exit")
clear
exit
;;
*)
if [ -e $dirf/$p ]
then
echo "$dirf/$p" > ~/rou/pc.txt
internal_root="$(echo "$(<~/rou/pc.txt)")"
chmod +x ~/rou/deb/PC/*
cp ~/rou/deb/PC/* /bin
chmod +x /bin/lpmake
chmod +x /bin/lpunpack
chmod +x /bin/lpadd
chmod +x /bin/lpdump
apt install android-sdk-libsparse-utils
sudo apt-get update --fix-missing
sudo apt-get install --fix-missing
apt install android-sdk-libsparse-utils
echo "binary installed" > ~/rou/complete.txt
else
echo "False"
main_main
fi
;;
esac
else
clear
dirf=/mnt
TPUT  6 1;ls -x $dirf
UNMARK
TPUT  1 1;$e " |Drive| ";
MARK;TPUT 3 1;$e "	______________________
"
TPUT  3 1;$e "| write "exit" for cancel |";
UNMARK
MARK;TPUT 47 1;$e "	                        ";TPUT 47 1;$e "Select drive from list:";read p;UNMARK;
case $p in
"")
echo "not select anything exit"
exit
;;
"exit")
clear
exit
;;
*)
if [ -e $dirf/$p ]
then
echo "$dirf/$p" > ~/rou/pc.txt
internal_root="$(echo "$(<~/rou/pc.txt)")"
chmod +x ~/rou/deb/PC/*
cp ~/rou/deb/PC/* /bin
chmod +x /bin/lpmake
chmod +x /bin/lpunpack
chmod +x /bin/lpadd
chmod +x /bin/lpdump
apt install android-sdk-libsparse-utils
sudo apt-get update --fix-missing
sudo apt-get install --fix-missing
apt install android-sdk-libsparse-utils
echo "binary installed" > ~/rou/complete.txt
else
main_main
fi
;;
esac
fi
fi
fi
fi

cd ~/
mkdir ~/kitchen-tmp
mkdir $internal_root/build-kitchen
internal_tmp=$internal_root/build-kitchen
main_tmp=~/kitchen-tmp
mkdir ~/kitchen-tmp
ln -s $internal_root/build-kitchen ~/
ln -s ~/rou/toolbox.sh ~/
ln -s ~/rou/toolbox.sh /bin
ln -s ~/rou/toolbox.sh /data/data/com.termux/files/usr/bin
clear
super_info=" "
clear
MU_X=5

#Device info

  ARROW(){ read -s -n3 key 2>/dev/null >&2
           if [[ $key = $ESC[A ]];then echo up;fi
           if [[ $key = $ESC[B ]];then echo dn;fi;}
     M0(){ TPUT 16 $MU_X; $e "Extract Super                   ";$ff;}
     M1(){ TPUT 18 $MU_X; $e "Build ROM                       ";$ff;}
     M2(){ TPUT 20 $MU_X; $e "Clear Temp folder               ";$ff;}
     M3(){ TPUT 22 $MU_X; $e "exit                            ";$ff;}
      LM=3
   MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    POS(){ if [[ $cur == up ]];then ((i--));fi
           if [[ $cur == dn ]];then ((i++));fi
           if [[ $i -lt 0   ]];then i=$LM;fi
           if [[ $i -gt $LM ]];then i=0;fi;}
REFRESH(){ after=$((i+1)); before=$((i-1))
           if [[ $before -lt 0  ]];then before=$LM;fi
           if [[ $after -gt $LM ]];then after=0;fi
           if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
           if [[ $after -eq 0 ]] || [ $before -eq $LM ];then
           UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}
   INIT(){ clear;set_info=$Case_universal;R;HEAD;FOOT2;FOOT;UNMARK;TPUT  3 2; $e "$internal_root/build-kitchen";MARK;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
   ES(){ MARK;$e "ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
        0) S=M0;SC;if [[ $cur == "" ]];then R;clear;Extract_rom;INIT;fi;;
        1) S=M1;SC;if [[ $cur == "" ]];then R;clear;Build_rom;INIT;fi;;
        2) S=M2;SC;if [[ $cur == "" ]];then R;clear;clear_kitchen;fi;;
        3) S=M3;SC;if [[ $cur == "" ]];then R;clear;exit;fi;;
 esac;POS;done
}


main_main


 E='echo -e';
 e='echo -en';
#
 i=0; CLEAR; CIVIS;NULL=/dev/null
 trap "R;exit" 2
 ESC=$( $e "\e")
 TPUT(){ $e "\e[${1};${2}H" ;}
 CLEAR(){ $e "\ec";}
 CIVIS(){ $e "\e[?25l";}
 R(){ CLEAR ;stty sane;CLEAR;};                 # в этом варианте фон прозрачный
#
 ARROW(){ IFS= read -s -n1 key 2>/dev/null >&2
           if [[ $key = $ESC ]];then
              read -s -n1 key 2>/dev/null >&2;
              if [[ $key = \[ ]]; then
                 read -s -n1 key 2>/dev/null >&2;
                 if [[ $key = A ]]; then echo up;fi
                 if [[ $key = B ]];then echo dn;fi
              fi
           fi
           if [[ "$key" == "$($e \\x0A)" ]];then echo enter;fi;}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ma="\e[45;30m│\e[0m                                                                                \e[45;30m│\e[0m"
 mb="\033[0m\033[45;30m┌────────────────────────────────────────────────────────────────────────────────┐\033[0m"
 mc="\e[45;30m├\e[0m\e[1;30m────────────────────────────────────────────────────────────────────────────────\e[0m\e[45;30m┤\e[0m"
 md="\e[45;30m├\e[0m\e[2m─ Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter ─────────────────────────────────────────────────────\e[0m\e[45;30m┤\e[0m"
 me="\033[0m\033[45;30m└────────────────────────────────────────────────────────────────────────────────┘\033[0m"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 na="\e[35m\xE2\x94\x82                                                                                \xE2\x94\x82\e[0m"
 nb="\e[0m\e[35m┌────────────────────────────────────────────────────────────────────────────────┐\e[0m"
 nc="\e[35m├────────────────────────────────────────────────────────────────────────────────┤\e[0m"
 nd="\033[35m├─ Up \xE2\x86\x91 \xE2\x86\x93 Down Select Enter ─────────────────────────────────────────────────────┤\e[0m"
 ne="\033[0m\033[35m└────────────────────────────────────────────────────────────────────────────────┘\033[0m"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

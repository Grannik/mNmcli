#!/bin/bash
source "sNmcli.sh"
# это цвет текста списка перед курсором при значении 0 в переменной  UNMARK(){ $e "\e[0m";}
 UNMARK(){ $e "\e[0m";}
 MARK(){ $e "\e[1;37m";}
#
 HEAD()
{
 for (( a=2; a<=37; a++ ))
  do
   TPUT $a 1
    $E "$na";
  done
   TPUT  1 1;$E "$nb";UNMARK;
   TPUT  2 2;$E "\e[1;36m GENERAL COMMANDS\e[0m                                               \e[2m ОБЩИЕ КОМАНДЫ\e[0m";
   TPUT  3 1;$E "$nc";
   TPUT  4 2;$E "\e[2m Используйте эту команду для отображения состояния и разрешений NetworkManager.\e[0m";
   TPUT  5 2;$E "\e[2m Вы также можете получить и изменить имя хоста системы, а также уровень ведения\e[0m";
   TPUT  6 2;$E "\e[2m журнала NetworkManager и домены.\e[0m";
   TPUT  7 1;$E "$nc";
   TPUT 14 1;$E "$nc";
   TPUT 16 2;$E "\e[2m Available flags are:                                        Доступные флаги:\e[0m";
   TPUT 20 2;$E "\e[2m Без флагов перезагружается все, что поддерживается, что идентично отправке\e[0m";
   TPUT 21 2;$E "\e[2m SIGHUP. См. NetworkManager для более подробной информации о сигналах.\e[0m";
   TPUT 22 1;$E "$nc";
   TPUT 23 2;$E "\e[1;36m NETWORKING CONTROL COMMANDS\e[0m                        \e[2m СЕТЕВЫЕ КОМАНДЫ УПРАВЛЕНИЯ\e[0m";
   TPUT 28 2;$E "\e[2m Запрос состояния сети NetworkManager, включение и отключение сети\e[0m";
   TPUT 29 2;$E "\e[2m Возможные состояния:                                    Possible states are:\e[0m";
   TPUT 30 2;$E "\e[32m none   \e[0m\e[2m хост не подключен ни к какой сети.\e[0m";
   TPUT 31 2;$E "\e[32m portal \e[0m\e[2m хост находится за закрытым порталом\e[0m";
   TPUT 32 2;$E "\e[2m и не может получить доступ к полному Интернету.\e[0m";
   TPUT 33 2;$E "\e[32m limited\e[0m\e[2m хост подключен к сети, но не имеет доступа к Интернету.\e[0m";
   TPUT 34 2;$E "\e[32m full   \e[0m\e[2m хост подключен к сети и имеет полный доступ к Интернету.\e[0m";
   TPUT 35 2;$E "\e[32m unknown\e[0m\e[2m статус подключения не может быть выяснен.\e[0m";
   TPUT 36 1;$E "$nd";
}
 FOOT(){ MARK;TPUT 38 1;$E "$ne";UNMARK;}
  M0(){ TPUT  8 3; $e "Описание                                                        \e[32m Description \e[0m";}
  M1(){ TPUT  9 3; $e "Убедиться, что NetworkManager запущен                               \e[32m RUNNING \e[0m";}
  M2(){ TPUT 10 3; $e "Cмотрим статус состояние интерфейсов                                 \e[32m status \e[0m";}
  M3(){ TPUT 11 3; $e "Получить и изменить системное имя хоста                 \e[32m hostname [hostname] \e[0m";}
  M4(){ TPUT 12 3; $e "Показать разрешения вызывающего абонента                        \e[32m permissions \e[0m";}
  M5(){ TPUT 13 3; $e "Получите/измените ведениe журнала\e[32m logging [level level] [domains domains...] \e[0m";}
  M6(){ TPUT 15 3; $e "Перезагрузите конфигурацию NetworkManager                 \e[32m reload [flags...] \e[0m";}
  M7(){ TPUT 17 3; $e "Перезагрузите конфигурацию NetworkManager.conf с диска                 \e[32m conf \e[0m";}
  M8(){ TPUT 18 3; $e "Обновите конфигурацию DNS                                            \e[32m dns-rc \e[0m";}
  M9(){ TPUT 19 3; $e "Перезапустите подключаемый модуль DNS                              \e[32m dns-full \e[0m";}
 M10(){ TPUT 24 3; $e "Описание                                                        \e[32m Description \e[0m";}
 M11(){ TPUT 25 3; $e "Включите управление сетью с помощью NetworkManager                       \e[32m on \e[0m";}
 M12(){ TPUT 26 3; $e "Oтключите управление сетью с помощью NetworkManager                     \e[32m off \e[0m";}
 M13(){ TPUT 27 3; $e "Получить состояние подключения к сети                  \e[32m connectivity [check] \e[0m";}
 M14(){ TPUT 37 3; $e "                                                                       \e[32m Exit \e[0m";}
LM=14
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
   INIT(){ R;HEAD;FOOT;MENU;}
     SC(){ REFRESH;MARK;$S;$b;cur=`ARROW`;}
# Функция возвращения в меню
     ES(){ MARK;$e " ENTER = main menu ";$b;read;INIT;};INIT
  while [[ "$O" != " " ]]; do case $i in
  0) S=M0;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m
 nmcli general {status | hostname | permissions | logging | reload} [ARGUMENTS...]
\e[0m";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "
\e[32m nmcli general\e[0m или\e[32m nmcli -t -f RUNNING general\e[0m
";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "
\e[32m nmcli general status\e[0m или\e[32m nmcli -t -f STATE general\e[0m

 Показывает детали интерфейса wlan0:
\e[32m nmcli -f GENERAL,WIFI-PROPERTIES dev show wlan0\e[0m
 будут показаны только разделы ОБЩИЕ и СВОЙСТВА WIFI.
";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "
 Без аргументов это печатает текущее сконфигурированное имя хоста:
\e[32m nmcli general hostname\e[0m
 Когда вы передаете имя хоста, оно будет передано NetworkManager для установки
 в качестве нового системного имени хоста. Обратите внимание, что термин
 «системное» имя хоста может также упоминаться как «persistent» или «static»
 другими программами или инструментами.
 Имя хоста хранится в файле /etc/hostname в большинстве дистрибутивов.
 Например, служба systemd-hostnamed использует термин «статическое» имя хоста
 и считывает файл /etc/hostname только при запуске.
";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "
 Показать разрешения вызывающего абонента для различных аутентифицированных
 операций, предоставляемых NetworkManager, таких как включение и отключение
 сети, изменение состояния Wi-Fi и WWAN, изменение подключений и т. д.
";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "
 Получите и измените уровень ведения журнала NetworkManager и домены.
 Без каких-либо аргументов показывается текущий уровень логирования и домены.
 Чтобы изменить состояние ведения журнала, укажите параметры уровня и/или домена.
 См. NetworkManager.conf для доступных значений уровня и домена.
";ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e "
 Перезагрузите конфигурацию NetworkManager и выполните определенные обновления:
 такие как очистка кешей или перезапись внешнего состояния на диск.
 Это похоже на отправку SIGHUP в NetworkManager, но позволяет более точно
 контролировать, что перезагружать с помощью аргумента flags. -root доступ
 через PolicyKit и вопреки сигналам синхронный.
";ES;fi;;
  7) S=M7;SC; if [[ $cur == enter ]];then R;echo -e "
 Перезагрузите конфигурацию NetworkManager.conf с диска. Обратите внимание,
 что сюда не входят соединения, которые можно перезагрузить с помощью
 перезагрузки соединения nmcli.
";ES;fi;;
  8) S=M8;SC; if [[ $cur == enter ]];then R;echo -e "
 Обновите конфигурацию DNS,
 что обычно включает в себя запись /etc/resolv.conf заново.
 Это эквивалентно отправке сигнала SIGUSR1 процессу NetworkManager.
";ES;fi;;
  9) S=M9;SC; if [[ $cur == enter ]];then R;echo -e "
 Это полезно, например, при использовании плагина dnsmasq, который использует
 дополнительную конфигурацию в /etc/NetworkManager/dnsmasq.d.
 Если вы отредактируете эти файлы, вы можете перезапустить подключаемый модуль DNS
 Это действие ненадолго прерывает разрешение имени.
";ES;fi;;
 10) S=M10;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m
 nmcli networking {on | off | connectivity} [ARGUMENTS...]
\e[0m";ES;fi;;
 11) S=M11;SC; if [[ $cur == enter ]];then R;echo -e "
 Включите управление сетью с помощью NetworkManager:\e[32m nmcli networking on\e[0m
";ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;echo -e "
 Oтключите управление сетью с помощью NetworkManager:
\e[32m nmcli networking off\e[0m
 Все интерфейсы, управляемые NetworkManager, деактивируются при отключении сети.
";ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;echo -e "
 Получить состояние подключения к сети:
\e[32m nmcli networking\e[0m
\e[32m nmcli networking connectivity\e[0m
 Необязательный аргумент проверки сообщает NetworkManager о повторной проверке
 подключения, в противном случае отображается самое последнее известное состояние
 подключения без повторной проверки.
";ES;fi;;
 14) S=M14;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done

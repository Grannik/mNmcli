#!/bin/bash
 source "sNmcli.sh"
 UNMARK(){ $e "\e[0m";}
 MARK(){ $e "\e[30;47m";}
#
 HEAD()
{
 for (( a=2; a<=30; a++ ))
          do
              TPUT $a 1;$E "$ma"
          done
TPUT  1 1;$E "$mb"
TPUT  3 3;$E "\e[1;35m *** nmcli ***\e[0m";
TPUT  4 3;$E "\e[2m command-line tool for controlling NetworkManager\e[0m";
TPUT  5 1;$E "$mc"
TPUT 24 1;$E "$mc"
TPUT 25 3;$E "\e[2m Псевдографический интерфейс на Whiptail                              \e[32m nmtui\e[0m";
TPUT 26 1;$E "$mc"
TPUT 28 1;$E "$md"
}
 FOOT(){ MARK;TPUT 31 1;$E "$me";UNMARK;}
#
  M0(){ TPUT  6 3; $e " Установка                                                          \e[32m Install \e[0m";}
  M1(){ TPUT  7 3; $e " Kраткий обзор                                                     \e[32m SYNOPSIS \e[0m";}
  M2(){ TPUT  8 3; $e " Описание                                                       \e[32m DESCRIPTION \e[0m";}
  M3(){ TPUT  9 3; $e " Переменные среды                                     \e[32m ENVIRONMENT VARIABLES \e[0m";}
  M4(){ TPUT 10 3; $e " Примечания по интернационализации               \e[32m INTERNATIONALIZATION NOTES \e[0m";}
  M5(){ TPUT 11 3; $e " Примечания                                                           \e[32m NOTES \e[0m";}
  M6(){ TPUT 12 3; $e " Ошибки                                                                \e[32m BUGS \e[0m";}
  M7(){ TPUT 13 3; $e " Смотри также                                                      \e[32m SEE ALSO \e[0m";}
  M8(){ TPUT 14 3; $e " Команды управления радиопередачей      \e[32m RADIO TRANSMISSION CONTROL COMMANDS \e[0m";}
  M9(){ TPUT 15 3; $e " Монитор активности                                        \e[32m ACTIVITY MONITOR \e[0m";}
 M10(){ TPUT 16 3; $e " Секретный агент                                               \e[32m SECRET AGENT \e[0m";}
 M11(){ TPUT 17 3; $e " Статус выхода                                                  \e[32m EXIT STATUS \e[0m";}
 M12(){ TPUT 18 3; $e " Oкраска                                                             \e[35m COLORS \e[0m";}
 M13(){ TPUT 19 3; $e " Опции                                                              \e[35m OPTIONS \e[0m";}
 M14(){ TPUT 20 3; $e " Общие команды                                             \e[35m GENERAL COMMANDS \e[0m";}
 M15(){ TPUT 21 3; $e " Команды управления сетью                       \e[35m NETWORKING CONTROL COMMANDS \e[0m";}
 M16(){ TPUT 22 3; $e " Команды управления устройством                  \e[35m DEVICE MANAGEMENT COMMANDS \e[0m";}
 M17(){ TPUT 23 3; $e " Команды управления подключением             \e[35m CONNECTION MANAGEMENT COMMANDS \e[0m";}
 M18(){ TPUT 27 3; $e " Grannik Git                                                                 ";}
 M19(){ TPUT 29 3; $e " Exit                                                                        ";}
LM=19
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
  0) S=M0;SC; if [[ $cur == enter ]];then R;echo -e "
\e[32m sudo apt install nmcli\e[0m
";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m
 nmcli [OPTIONS...  ]
 {help | general | networking | radio | connection | device | agent | monitor}
       [COMMAND     ]
       [ARGUMENTS...]
\e[0m";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "
 nmcli — это инструмент командной строки для управления NetworkManager и создания
 отчетов о состоянии сети.
   Его можно использовать как замену nm-applet или другим графическим клиентам.
 nmcli используется для создания, отображения, редактирования, удаления, активации
 и деактивации сетевых подключений, а также для управления и отображения состояния
 сетевых устройств. См. nmcli-examples для готовых к запуску примеров nmcli.
   Типичные варианты использования включают:
 •\e[34m Scripts\e[0m: используйте NetworkManager через nmcli вместо ручного управления
 сетевыми подключениями. nmcli поддерживает краткий формат вывода, который лучше
 подходит для обработки сценариев. Обратите внимание, что NetworkManager также
 может выполнять сценарии, называемые «диспетчерскими сценариями», в ответ на
 сетевые события. Подробнее об этих сценариях диспетчера см. в NetworkManager.
 •\e[34m Servers\e[0m, безголовые компьютеры и терминалы: nmcli можно использовать для
 управления NetworkManager без графического интерфейса, включая создание,
 редактирование, запуск и остановку сетевых подключений и просмотр состояния сети.
";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "
 На поведение nmcli влияют следующие переменные среды:

\e[34m LC_ALL\e[0m
 Если установлено непустое строковое значение,
 оно переопределяет значения всех других переменных интернационализации.

\e[34m LC_MESSAGES\e[0m
 Определяет локаль,
 которая будет использоваться для интернационализированных сообщений.

\e[34m LANG\e[0m
 Предоставляет значение по умолчанию для переменных интернационализации,
 которые не установлены или равны нулю.
";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "
 Имейте в виду, что nmcli локализован, и поэтому вывод зависит от вашей среды.
 Это важно понимать, особенно когда вы анализируете вывод.
 Вызовите nmcli как LC_ALL=C nmcli, чтобы убедиться, что языковой стандарт
 установлен на C при выполнении скрипта.
 Переменные: \e[34mLC_ALL\e[0m,\e[34m LC_MESSAGES\e[0m,\e[34m LANG\e[0m определяют категорию локали\e[34m LC_MESSAGES\e[0m
 (в указанном порядке), которая определяет язык, используемый nmcli для сообщений.
 Локаль C используется, если ни одна из этих переменных не установлена,
 и эта локаль использует сообщения на английском языке.
";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "
 nmcli принимает сокращения, если они являются уникальным префиксом в наборе
 возможных параметров. По мере добавления новых опций эти сокращения не
 обязательно останутся уникальными. Поэтому для сценариев и долгосрочной
 совместимости настоятельно рекомендуется указывать полные имена опций.
";ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e "
 Вероятно, есть какие-то баги. Если вы обнаружите ошибку,
 сообщите об этом своему дистрибутиву или воспитателю по адресу:
\e[36m https://gitlab.freedesktop.org/NetworkManager/NetworkManager\e[0m
";ES;fi;;
  7) S=M7;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m
 nmcli-examples
 nm-settings-nmcli
 nm-online
 NetworkManager
 NetworkManager.conf
 nm-applet
 nm-connection-editor
 terminal-colors.d
\e[0m";ES;fi;;
  8) S=M8;SC; if [[ $cur == enter ]];then R;echo -e "
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+
│ RADIO TRANSMISSION CONTROL COMMANDS          КОМАНДЫ УПРАВЛЕНИЯ РАДИОПЕРЕДАЧЕЙ │
│ Показать состояние радиопереключателей  или включить и отключить переключатели │
│ Description:                   \e[32m nmcli radio {all | wifi | wwan} [ARGUMENTS...]\e[0m │
+--------------------------------------------------------------------------------+
│                                                          \e[32m nmcli radio         \e[0m │
+--------------------------------------- Wi-Fi ----------------------------------+
│ Показать статус Wi-Fi в NetworkManager wifi              \e[32m nmcli radio wifi    \e[0m │
│ Включить                               wifi on           \e[32m nmcli radio wifi on \e[0m │
│ Выключить                              wifi off          \e[32m nmcli radio wifi off\e[0m │
+--------------------------------------- WWAN -----------------------------------+
│ Показать статус Wwan  в NetworkManager wwan              \e[32m nmcli radio wwan    \e[0m │
│ Включить                               wwan on           \e[32m nmcli radio wwan on \e[0m │
│ Выключить                              wwan off          \e[32m nmcli radio wwan off\e[0m │
+--------------------------------------- All ------------------------------------+
│ Показать статус All   в NetworkManager all               \e[32m nmcli radio all     \e[0m │
│ Включить                               all  on           \e[32m nmcli radio all on  \e[0m │
│ Выключить                              all  off          \e[32m nmcli radio all off \e[0m │
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+
";ES;fi;;
  9) S=M9;SC; if [[ $cur == enter ]];then R;echo -e "
 nmcli monitor Наблюдайте за активностью NetworkManager.
 Отслеживает изменения состояния подключения, устройств или профилей подключения.
 См. также монитор соединений nmcli и монитор устройств nmcli, чтобы следить за
 изменениями в определенных устройствах или соединениях.
";ES;fi;;
 10) S=M10;SC;if [[ $cur == enter ]];then R;echo -e "
 Description:\e[32m nmcli agent {secret | polkit | all}\e[0m

 Запустите nmcli в качестве секретного агента NetworkManager или агента polkit.

\e[32m secret\e[0m
 Зарегистрируйте nmcli в качестве секретного агента NetworkManager и прослушивайте
 секретные запросы. Обычно вам не нужна эта команда, потому что nmcli может
 обрабатывать секреты при подключении к сети. Однако эта команда может оказаться
 полезной, если вы используете другой инструмент для активации соединений и у вас
 нет доступного секретного агента (например, nm-applet).

\e[32m polkit\e[0m
 Зарегистрируйте nmcli в качестве агента polkit для сеанса пользователя и
 прослушивайте запросы авторизации. Обычно вам не нужна эта команда, потому что
 nmcli может обрабатывать действия polkit, связанные с операциями NetworkManager
 (при запуске с параметром --ask).
 Однако эта команда может оказаться полезной, если вы хотите запустить простой
 текстовый агент polkit и у вас нет агента среды рабочего стола.
 Обратите внимание, что запуск этой команды заставляет nmcli обрабатывать все
 запросы polkit, а не только те, которые связаны с NetworkManager,
 поскольку для сеанса может работать только один агент polkit.

\e[32m all\e[0m
 Запускает nmcli как секрет NetworkManager и как агент polkit.
";ES;fi;;
 11) S=M11;SC;if [[ $cur == enter ]];then R;echo -e "
 nmcli завершается со статусом 0 в случае успеха,
       значение больше 0 возвращается в случае ошибки.
\e[32m  0\e[0m Успех – указывает на успешное выполнение операции.
\e[32m  1\e[0m Неизвестная или неуказанная ошибка.
\e[32m  2\e[0m Неверный пользовательский ввод, неверный вызов nmcli.
\e[32m  3\e[0m Время ожидания истекло (see --wait option).
\e[32m  4\e[0m Активация соединения не удалась.
\e[32m  5\e[0m Деактивация соединения не удалась.
\e[32m  6\e[0m Не удалось отключить устройство.
\e[32m  7\e[0m Не удалось удалить соединение.
\e[32m  8\e[0m NetworkManager не запущен.
\e[32m 10\e[0m Соединение, устройство или точка доступа не существуют.
\e[32m 65\e[0m При использовании с параметром --complete-args ожидается,
    что за ним последует имя файла.
";ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;./lNmcliColor.sh;ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;./nNmcliOptions.sh;ES;fi;;
 14) S=M14;SC;if [[ $cur == enter ]];then R;./nNmcliGeneraAndNetworkingControllCommands.sh;ES;fi;;
 15) S=M15;SC;if [[ $cur == enter ]];then R;./nNmcliGeneraAndNetworkingControllCommands.sh;ES;fi;;
 16) S=M16;SC;if [[ $cur == enter ]];then R;./nNmcliDeviceManagementCommands.sh;ES;fi;;
 17) S=M17;SC;if [[ $cur == enter ]];then R;./nNmcliConnectionManagementCommands.sh;ES;fi;;
 18) S=M18;SC;if [[ $cur == enter ]];then R;echo -e "
 Mo 28 Aug 2023 23:26:22 CEST
 Описание утилиты nmcli на русском языке.
 Command-line tool for controlling NetworkManager.
 Asciinema:  \e[36m \e[0m
 Github:     \e[36m \e[0m
 Gitlab:     \e[36m \e[0m
 Sourceforge:\e[36m \e[0m
 Notabug:    \e[36m \e[0m
 Bitbucket:  \e[36m \e[0m
 Framagit:   \e[36m \e[0m
 GFogs:      \e[36m \e[0m
 Codeberg:   \e[36m \e[0m
 Gitea       \e[36m \e[0m
";ES;fi;;
 19) S=M19;SC;if [[ $cur == enter ]];then R;clear;ls -l;exit 0;fi;;
 esac;POS;done

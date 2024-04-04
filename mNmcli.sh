#!/bin/bash
#================================================================================
fNmcliOptions()
{
 trap 'echo -en "\ec"; stty sane; exit' SIGINT
 aa=0
 A(){ for b in $(seq 0 14);do E${b};done; }
 B()
{
  local c
  IFS= read -s -n1 c 2>/dev/null >&2
  if [[ $c = $(echo -en "\e") ]]; then
    read -s -n1 c 2>/dev/null >&2
    if [[ $c = \[ ]]; then
      read -s -n1 c 2>/dev/null >&2
      case $c in
        A) echo d ;;
        B) echo e ;;
        C) echo f ;;
        D) echo g ;;
      esac
    fi
  elif [[ "$c" == "$(echo -en \\x0A)" ]]; then
    echo enter
  fi
}
 C()
{
 if [[ $i == d ]];then ((aa--));fi
 if [[ $i == e ]];then ((aa++));fi
 if [[ $aa -lt 0  ]];then aa=14;fi
 if [[ $aa -gt 14 ]];then aa=0;fi;
}

 D()
{
 j1=$((aa+1)); k1=$((aa-1))
 if [[ $k1 -lt 0   ]];then k1=14;fi
 if [[ $j1 -gt 14 ]];then j1=0;fi
 if [[ $aa -lt $aa ]];then echo -en "\e[0m";E$k1;else echo -en "\e[0m";E$j1;fi
 if [[ $j1 -eq 0   ]] || [ $k1 -eq 14 ];then
 echo -en "\e[0m" ; E$k1; E$j1;fi;echo -en "\e[0m";E$k1;E$j1;
}
 TXa()
{
 for (( a=2; a<=19; a++ ))
  do
   echo -e "\e[${a};1H\e[35m\xE2\x94\x82                                                                                \xE2\x94\x82\e[0m"
  done
 echo -en "\e[1;1H\e[35m┌────────────────────────────────────────────────────────────────────────────────┐\e[0m";
 echo -en "\e[2;2H\e[1;36m OPTIONS\e[0m\e[36m                                                                Опции\e[0m";
 echo -en "\e[3;1H\e[35m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
 echo -en "\e[18;1H\e[35m├─ \xE2\x86\x91 Up ───── \xE2\x86\x93 Down ──── \xe2\x86\xb2 Select Enter ────────────────────────────────────────┤\e[0m";
 echo -en "\e[20;1H\e[35m└────────────────────────────────────────────────────────────────────────────────┘\e[0m";
}
  E0(){ echo -en "\e[4;2H Oстановится и запросит отсутствующие обязательные аргументы      \e[32m -a | --ask \e[0m";}
  E1(){ echo -en "\e[5;2H Параметр управляет выводом цвета              \e[32m -c --colors {yes | no | auto} \e[0m";}
  E2(){ echo -en "\e[6;2H Перечислит варианты завершения для последнего аргумента     \e[32m --complete-args \e[0m";}
  E3(){ echo -en "\e[7;2H Нужно ли экранировать символы                      \e[32m -e | --escape {yes | no} \e[0m";}
  E4(){ echo -en "\e[8;2H Kакие поля должны показаны  \e[32m -f | --fields {field1,field2... | all | common} \e[0m";}
  E5(){ echo -en "\e[9;2H Ярлык -m табличный -t -f \e[32m -g | --get-values {field1,field2...| all | common} \e[0m";}
  E6(){ echo -en "\e[10;2H Print help information                                            \e[32m -h --help \e[0m";}
  E7(){ echo -en "\e[11;2H Переключение табличным/многострочным выводом\e[32m -m --mode {tabular | multiline} \e[0m";}
  E8(){ echo -en "\e[12;2H Режим обзора                                                 \e[32m -o, --overview \e[0m";}
  E9(){ echo -en "\e[13;2H Красивый вывод                                               \e[32m  -p | --pretty \e[0m";}
 E10(){ echo -en "\e[14;2H Oтображать пароли и секреты                             \e[32m -s | --show-secrets \e[0m";}
 E11(){ echo -en "\e[15;2H Краткий вывод                                                  \e[32m -t | --terse \e[0m";}
 E12(){ echo -en "\e[16;2H Show nmcli version                                           \e[32m -v | --version \e[0m";}
 E13(){ echo -en "\e[17;2H Bремя ожидания                                          \e[32m -w | --wait seconds \e[0m";}
 E14(){ echo -en "\e[19;2H                                                                        \e[35m Exit \e[0m";}
 INI(){ echo -en "\ec" ;stty sane;TXa;A; };INI
 while [[ "$l1" != " " ]]; do case $aa in
  0)D;echo -en "\e[1;35m"; (E0);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 При использовании этой опции nmcli остановится и запросит отсутствующие
 обязательные аргументы, поэтому не используйте эту опцию для неинтерактивных
 целей ,таких как скрипты. Этот параметр определяет, например, будет ли
 запрашиваться пароль, если он требуется для подключения к сети:
 Посмотреть только активные соединения:\e[32m nmcli con show -a\e[0m
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  1)D;echo -en "\e[1;35m"; (E1);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Этот параметр управляет выводом цвета
 (используя escape-последовательности терминала):
\e[32m yes \e[0m включает цвета,
\e[32m no  \e[0m отключает их,
\e[32m auto\e[0m воспроизводит цвета только тогда, когда стандартный вывод направляется на
 терминал. Значение по умолчанию — авто.
 Фактически используемые цвета настраиваются, как описано в terminal-colors.d
 Пожалуйста, обратитесь к разделу ЦВЕТА для получения списка имен цветов,
 поддерживаемых nmcli. Если переменная окружения NO_COLOR установлена (любое
 значение), то раскрашивание отключается в режиме auto
 Явное включение раскраски переопределяет переменную среды.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  2)D;echo -en "\e[1;35m"; (E2);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Вместо выполнения желаемого действия nmcli перечислит возможные варианты
 завершения для последнего аргумента.
 Это полезно для реализации завершения аргументов в оболочке.
 Статус выхода укажет на успех или вернет код 65, указывающий,
 что последним аргументом является имя файла.
 NetworkManager поставляется с поддержкой завершения команд для GNU Bash.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  3)D;echo -en "\e[1;35m"; (E3);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Нужно ли экранировать символы:
 и \\ в кратком табличном режиме. Управляющий символ \\
 Если опущено, по умолчанию да
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  4)D;echo -en "\e[1;35m"; (E4);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m --fields\e[0m Эта опция используется для указания того, какие поля (имена столбцов)
 должны быть напечатаны. Допустимые имена полей различаются для конкретных команд.
 Перечислите доступные поля, указав недопустимое значение для этого параметра.
\e[32m all     \e[0m используется для печати всех допустимых значений поля команды.
\e[32m common  \e[0m используется для печати значений общих полей команды.
 Если опущено, используется значение по умолчанию.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  5)D;echo -en "\e[1;35m"; (E5);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Эта опция используется для печати значений из определенных полей.
 По сути, это ярлык для --mode tabular --terse --fields и удобный способ получения
 значений для определенных полей. Значения печатаются по одному в строке без
 заголовков. Если вместо поля указан раздел, имя раздела будет напечатано, а затем
 разделенные двоеточием значения полей, принадлежащих этому разделу, все в одной
 строке.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  6)D;echo -en "\e[1;35m"; (E6);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m nmcli -h\e[0m
#
\e[32m nmcli --help\e[0m
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  7)D;echo -en "\e[1;35m"; (E7);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Переключение между табличным и многострочным выводом:
\e[32m tabular  \e[0m табличный Выходные данные представляют собой таблицу, в которой каждая
 строка описывает одну запись. Столбцы определяют определенные свойства записи.
\e[32m multiline\e[0m многострочный Каждая запись состоит из нескольких строк, каждое свойство
 находится в отдельной строке. Значения имеют префикс имени свойства.
 Если этот параметр опущен, по умолчанию большинствo команд использует таблица.
 Для команд, выдающих более структурированную информацию, которую нельзя отобразить
 в одной строке, по умолчанию многострочный. В настоящее время они:
 • nmcli connection show ID Идентификатор показа соединения nmcli
 • nmcli device show        Показать устройство nmcli
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  8)D;echo -en "\e[1;35m"; (E8);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  9)D;echo -en "\e[1;35m"; (E9);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Это заставляет nmcli создавать легко читаемые результаты для людей,
 т. е. значения выравниваются, заголовки печатаются и т. д.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 10)D;echo -en "\e[1;35m";(E10);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 При использовании этой опции nmcli будет отображать пароли и секреты, которые
 могут присутствовать в выводе операции. Эта опция также влияет на эхо паролей,
 введенных пользователем в качестве входных данных.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 11)D;echo -en "\e[1;35m";(E11);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Этот режим разработан и подходит для компьютерной (сценарной) обработки.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 12)D;echo -en "\e[1;35m";(E12);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m nmcli -v\e[0m
#
\e[32m nmcli --version\e[0m
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 13)D;echo -en "\e[1;35m";(E13);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Эта опция устанавливает время ожидания, в течение которого nmcli будет ожидать
 завершения операций NetworkManager. Это особенно полезно для команд, выполнение
 которых может занять больше времени, например. активация подключения.
 Указание значения 0 указывает nmcli не ждать, а немедленно выйти с состоянием
 успеха. Значение по умолчанию зависит от выполняемой команды.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 14)D;echo -en "\e[1;35m";(E14);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;fNmcli;fi;;
esac;C;done
}
#================================================================================
fGeneralCommands()
{
 trap 'echo -en "\ec"; stty sane; exit' SIGINT
 aa=0
 A(){ for b in $(seq 0 10);do E${b};done; }
 B()
{
  local c
  IFS= read -s -n1 c 2>/dev/null >&2
  if [[ $c = $(echo -en "\e") ]]; then
    read -s -n1 c 2>/dev/null >&2
    if [[ $c = \[ ]]; then
      read -s -n1 c 2>/dev/null >&2
      case $c in
        A) echo d ;;
        B) echo e ;;
        C) echo f ;;
        D) echo g ;;
      esac
    fi
  elif [[ "$c" == "$(echo -en \\x0A)" ]]; then
    echo enter
  fi
}
 C()
{
 if [[ $i == d ]];then ((aa--));fi
 if [[ $i == e ]];then ((aa++));fi
 if [[ $aa -lt 0  ]];then aa=10;fi
 if [[ $aa -gt 10 ]];then aa=0;fi;
}

 D()
{
 j1=$((aa+1)); k1=$((aa-1))
 if [[ $k1 -lt 0   ]];then k1=10;fi
 if [[ $j1 -gt 10 ]];then j1=0;fi
 if [[ $aa -lt $aa ]];then echo -en "\e[0m";E$k1;else echo -en "\e[0m";E$j1;fi
 if [[ $j1 -eq 0   ]] || [ $k1 -eq 10 ];then
 echo -en "\e[0m" ; E$k1; E$j1;fi;echo -en "\e[0m";E$k1;E$j1;
}
 TXa()
{
 for (( a=2; a<=22; a++ ))
  do
   echo -e "\e[${a};1H\e[35m\xE2\x94\x82                                                                                \xE2\x94\x82\e[0m"
  done
 echo -en "\e[1;1H\e[35m┌────────────────────────────────────────────────────────────────────────────────┐\e[0m";
 echo -en "\e[2;2H\e[1;36m GENERAL COMMANDS\e[0m                                                \e[2m ОБЩИЕ КОМАНДЫ\e[0m";
 echo -en "\e[3;1H\e[35m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
 echo -en "\e[4;2H\e[2m Используйте эту команду для отображения состояния и разрешений NetworkManager.\e[0m";
 echo -en "\e[5;2H\e[2m Вы также можете получить и изменить имя хоста системы, а также уровень ведения\e[0m";
 echo -en "\e[6;2H\e[2m журнала NetworkManager и домены.\e[0m";
 echo -en "\e[7;1H\e[35m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
 echo -en "\e[15;2H\e[2m Available flags are:                                        Доступные флаги:\e[0m";
 echo -en "\e[19;2H\e[2m Без флагов перезагружается все, что поддерживается, что идентично отправке\e[0m";
 echo -en "\e[20;2H\e[2m SIGHUP. См. NetworkManager для более подробной информации о сигналах.\e[0m";
 echo -en "\e[21;1H\e[35m├─ \xE2\x86\x91 Up ───── \xE2\x86\x93 Down ──── \xe2\x86\xb2 Select Enter ────────────────────────────────────────┤\e[0m";
 echo -en "\e[23;1H\e[35m└────────────────────────────────────────────────────────────────────────────────┘\e[0m";
}
  E0(){ echo -en "\e[8;2H Описание                                                        \e[32m Description \e[0m";}
  E1(){ echo -en "\e[9;2H Убедиться, что NetworkManager запущен                               \e[32m RUNNING \e[0m";}
  E2(){ echo -en "\e[10;2H Cмотрим статус состояние интерфейсов                                 \e[32m status \e[0m";}
  E3(){ echo -en "\e[11;2H Получить и изменить системное имя хоста                 \e[32m hostname [hostname] \e[0m";}
  E4(){ echo -en "\e[12;2H Показать разрешения вызывающего абонента                        \e[32m permissions \e[0m";}
  E5(){ echo -en "\e[13;2H Получите/измените ведениe журнала\e[32m logging [level level] [domains domains...] \e[0m";}
  E6(){ echo -en "\e[14;2H Перезагрузите конфигурацию NetworkManager                 \e[32m reload [flags...] \e[0m";}
  E7(){ echo -en "\e[16;2H Перезагрузите конфигурацию NetworkManager.conf с диска                 \e[32m conf \e[0m";}
  E8(){ echo -en "\e[17;2H Обновите конфигурацию DNS                                            \e[32m dns-rc \e[0m";}
  E9(){ echo -en "\e[18;2H Перезапустите подключаемый модуль DNS                              \e[32m dns-full \e[0m";}
 E10(){ echo -en "\e[22;2H                                                                        \e[35m Exit \e[0m";}
 INI(){ echo -en "\ec" ;stty sane;TXa;A; };INI
 while [[ "$l1" != " " ]]; do case $aa in
  0)D;echo -en "\e[1;35m"; (E0);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m
 nmcli general {status | hostname | permissions | logging | reload} [ARGUMENTS...]
\e[0m";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  1)D;echo -en "\e[1;35m"; (E1);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m nmcli general\e[0m или\e[32m nmcli -t -f RUNNING general\e[0m
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  2)D;echo -en "\e[1;35m"; (E2);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m nmcli general status\e[0m или\e[32m nmcli -t -f STATE general\e[0m

 Показывает детали интерфейса wlan0:
\e[32m nmcli -f GENERAL,WIFI-PROPERTIES dev show wlan0\e[0m
 будут показаны только разделы ОБЩИЕ и СВОЙСТВА WIFI.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  3)D;echo -en "\e[1;35m"; (E3);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Без аргументов это печатает текущее сконфигурированное имя хоста:
\e[32m nmcli general hostname\e[0m
 Когда вы передаете имя хоста, оно будет передано NetworkManager для установки
 в качестве нового системного имени хоста. Обратите внимание, что термин
 «системное» имя хоста может также упоминаться как «persistent» или «static»
 другими программами или инструментами.
 Имя хоста хранится в файле /etc/hostname в большинстве дистрибутивов.
 Например, служба systemd-hostnamed использует термин «статическое» имя хоста
 и считывает файл /etc/hostname только при запуске.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  4)D;echo -en "\e[1;35m"; (E4);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Показать разрешения вызывающего абонента для различных аутентифицированных
 операций, предоставляемых NetworkManager, таких как включение и отключение
 сети, изменение состояния Wi-Fi и WWAN, изменение подключений и т. д.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  5)D;echo -en "\e[1;35m"; (E5);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Получите и измените уровень ведения журнала NetworkManager и домены.
 Без каких-либо аргументов показывается текущий уровень логирования и домены.
 Чтобы изменить состояние ведения журнала, укажите параметры уровня и/или домена.
 См. NetworkManager.conf для доступных значений уровня и домена.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  6)D;echo -en "\e[1;35m"; (E6);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Перезагрузите конфигурацию NetworkManager и выполните определенные обновления:
 такие как очистка кешей или перезапись внешнего состояния на диск.
 Это похоже на отправку SIGHUP в NetworkManager, но позволяет более точно
 контролировать, что перезагружать с помощью аргумента flags. -root доступ
 через PolicyKit и вопреки сигналам синхронный.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  7)D;echo -en "\e[1;35m"; (E7);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Перезагрузите конфигурацию NetworkManager.conf с диска. Обратите внимание,
 что сюда не входят соединения, которые можно перезагрузить с помощью
 перезагрузки соединения nmcli.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  8)D;echo -en "\e[1;35m"; (E8);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Обновите конфигурацию DNS,
 что обычно включает в себя запись /etc/resolv.conf заново.
 Это эквивалентно отправке сигнала SIGUSR1 процессу NetworkManager.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  9)D;echo -en "\e[1;35m"; (E9);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Это полезно, например, при использовании плагина dnsmasq, который использует
 дополнительную конфигурацию в /etc/NetworkManager/dnsmasq.d.
 Если вы отредактируете эти файлы, вы можете перезапустить подключаемый модуль DNS
 Это действие ненадолго прерывает разрешение имени.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 10)D;echo -en "\e[1;35m";(E10);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;fNmcli;fi;;
esac;C;done
}
#================================================================================
#================================================================================
fNetworkingControlCommands()
{
 trap 'echo -en "\ec"; stty sane; exit' SIGINT
 aa=0
 A(){ for b in $(seq 0 4);do E${b};done; }
 B()
{
  local c
  IFS= read -s -n1 c 2>/dev/null >&2
  if [[ $c = $(echo -en "\e") ]]; then
    read -s -n1 c 2>/dev/null >&2
    if [[ $c = \[ ]]; then
      read -s -n1 c 2>/dev/null >&2
      case $c in
        A) echo d ;;
        B) echo e ;;
        C) echo f ;;
        D) echo g ;;
      esac
    fi
  elif [[ "$c" == "$(echo -en \\x0A)" ]]; then
    echo enter
  fi
}
 C()
{
 if [[ $i == d ]];then ((aa--));fi
 if [[ $i == e ]];then ((aa++));fi
 if [[ $aa -lt 0  ]];then aa=4;fi
 if [[ $aa -gt 4 ]];then aa=0;fi;
}

 D()
{
 j1=$((aa+1)); k1=$((aa-1))
 if [[ $k1 -lt 0   ]];then k1=4;fi
 if [[ $j1 -gt 4   ]];then j1=0;fi
 if [[ $aa -lt $aa ]];then echo -en "\e[0m";E$k1;else echo -en "\e[0m";E$j1;fi
 if [[ $j1 -eq 0   ]] || [ $k1 -eq 4 ];then
 echo -en "\e[0m" ; E$k1; E$j1;fi;echo -en "\e[0m";E$k1;E$j1;
}
 TXa()
{
 for (( a=2; a<=17; a++ ))
  do
   echo -e "\e[${a};1H\e[35m\xE2\x94\x82                                                                                \xE2\x94\x82\e[0m"
  done
 echo -en "\e[1;1H\e[35m┌────────────────────────────────────────────────────────────────────────────────┐\e[0m";
 echo -en "\e[2;2H\e[1;36m NETWORKING CONTROL COMMANDS\e[0m                        \e[2m СЕТЕВЫЕ КОМАНДЫ УПРАВЛЕНИЯ\e[0m";
 echo -en "\e[3;1H\e[35m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
 echo -en "\e[8;2H\e[2m Запрос состояния сети NetworkManager, включение и отключение сети\e[0m";
 echo -en "\e[9;2H\e[2m Возможные состояния:                                    Possible states are:\e[0m";
 echo -en "\e[10;2H\e[32m none   \e[0m\e[2m хост не подключен ни к какой сети.\e[0m";
 echo -en "\e[11;2H\e[32m portal \e[0m\e[2m хост находится за закрытым порталом\e[0m";
 echo -en "\e[12;2H\e[2m и не может получить доступ к полному Интернету.\e[0m";
 echo -en "\e[13;2H\e[32m limited\e[0m\e[2m хост подключен к сети, но не имеет доступа к Интернету.\e[0m";
 echo -en "\e[14;2H\e[32m full   \e[0m\e[2m хост подключен к сети и имеет полный доступ к Интернету.\e[0m";
 echo -en "\e[15;2H\e[32m unknown\e[0m\e[2m статус подключения не может быть выяснен.\e[0m";
 echo -en "\e[16;1H\e[35m├─ \xE2\x86\x91 Up ───── \xE2\x86\x93 Down ──── \xe2\x86\xb2 Select Enter ────────────────────────────────────────┤\e[0m";
 echo -en "\e[18;1H\e[35m└────────────────────────────────────────────────────────────────────────────────┘\e[0m";
}
  E0(){ echo -en "\e[4;2H Описание                                                        \e[32m Description \e[0m";}
  E1(){ echo -en "\e[5;2H Включите управление сетью с помощью NetworkManager                       \e[32m on \e[0m";}
  E2(){ echo -en "\e[6;2H Oтключите управление сетью с помощью NetworkManager                     \e[32m off \e[0m";}
  E3(){ echo -en "\e[7;2H Получить состояние подключения к сети                  \e[32m connectivity [check] \e[0m";}
  E4(){ echo -en "\e[17;2H                                                                        \e[35m Exit \e[0m";}
 INI(){ echo -en "\ec" ;stty sane;TXa;A; };INI
 while [[ "$l1" != " " ]]; do case $aa in
  0)D;echo -en "\e[1;35m"; (E0);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m
 nmcli networking {on | off | connectivity} [ARGUMENTS...]
\e[0m";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  1)D;echo -en "\e[1;35m"; (E1);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Включите управление сетью с помощью NetworkManager:\e[32m nmcli networking on\e[0m
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  2)D;echo -en "\e[1;35m"; (E2);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Oтключите управление сетью с помощью NetworkManager:
\e[32m nmcli networking off\e[0m
 Все интерфейсы, управляемые NetworkManager, деактивируются при отключении сети.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  3)D;echo -en "\e[1;35m"; (E3);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Получить состояние подключения к сети:
\e[32m nmcli networking\e[0m
\e[32m nmcli networking connectivity\e[0m
 Необязательный аргумент проверки сообщает NetworkManager о повторной проверке
 подключения, в противном случае отображается самое последнее известное состояние
 подключения без повторной проверки.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 4)D;echo -en "\e[1;35m";(E4);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;fNmcli;fi;;
esac;C;done
}
#================================================================================
#================================================================================
#================================================================================
fConnectionManagementCommands()
{
 trap 'echo -en "\ec"; stty sane; exit' SIGINT
 aa=0
 A(){ for b in $(seq 0 20);do E${b};done; }
 B()
{
  local c
  IFS= read -s -n1 c 2>/dev/null >&2
  if [[ $c = $(echo -en "\e") ]]; then
    read -s -n1 c 2>/dev/null >&2
    if [[ $c = \[ ]]; then
      read -s -n1 c 2>/dev/null >&2
      case $c in
        A) echo d ;;
        B) echo e ;;
        C) echo f ;;
        D) echo g ;;
      esac
    fi
  elif [[ "$c" == "$(echo -en \\x0A)" ]]; then
    echo enter
  fi
}
 C()
{
 if [[ $i == d ]];then ((aa--));fi
 if [[ $i == e ]];then ((aa++));fi
 if [[ $aa -lt 0  ]];then aa=20;fi
 if [[ $aa -gt 20 ]];then aa=0;fi;
}

 D()
{
 j1=$((aa+1)); k1=$((aa-1))
 if [[ $k1 -lt 0   ]];then k1=20;fi
 if [[ $j1 -gt 20 ]];then j1=0;fi
 if [[ $aa -lt $aa ]];then echo -en "\e[0m";E$k1;else echo -en "\e[0m";E$j1;fi
 if [[ $j1 -eq 0   ]] || [ $k1 -eq 20 ];then
 echo -en "\e[0m" ; E$k1; E$j1;fi;echo -en "\e[0m";E$k1;E$j1;
}
 TXa()
{
 for (( a=2; a<=25; a++ ))
  do
   echo -e "\e[${a};1H\e[35m\xE2\x94\x82                                                                                \xE2\x94\x82\e[0m"
  done
 echo -en "\e[1;1H\e[35m┌────────────────────────────────────────────────────────────────────────────────┐\e[0m";
 echo -en "\e[2;2H\e[1;36m CONNECTION MANAGEMENT COMMANDS\e[0m                \e[2m Команды управления подключением\e[0m";
 echo -en "\e[3;1H\e[35m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
 echo -en "\e[24;1H\e[35m├─ \xE2\x86\x91 Up ───── \xE2\x86\x93 Down ──── \xe2\x86\xb2 Select Enter ────────────────────────────────────────┤\e[0m";
 echo -en "\e[26;1H\e[35m└────────────────────────────────────────────────────────────────────────────────┘\e[0m";
}
  E0(){ echo -en "\e[4;2H Kраткий обзор                                                      \e[32m Synopsis \e[0m";}
  E1(){ echo -en "\e[5;2H Описание                                                        \e[32m Description \e[0m";}
  E2(){ echo -en "\e[6;2H Перечислите профили подключения  \e[32m show [--active] [--order [+-]category:...] \e[0m";}
  E3(){ echo -en "\e[7;2H Показать подробности       \e[32m show [--active] [id | uuid | path | apath] ID... \e[0m";}
  E4(){ echo -en "\e[8;2H      \e[32m up [id | uuid | path] ID [ifname ifname] [ap BSSID] [passwd-file file] \e[0m";}
  E5(){ echo -en "\e[9;2H Деактивировать соединение с устройства   \e[32m down [id | uuid | path | apath] ID \e[0m";}
  E6(){ echo -en "\e[10;2H \e[32mmodify[--temporary][id uuid path]ID{option value[+|-]setting.property value} \e[0m";}
  E7(){ echo -en "\e[11;2H Удаляет параметр  \e[32m modify [--temporary] [id | uuid | path] ID remove setting \e[0m";}
  E8(){ echo -en "\e[12;2H Создайте новое соединение             \e[32m add [save {yes no}] {option value...} \e[0m";}
  E9(){ echo -en "\e[13;2H Отредактируйте соединение\e[32m edit{[id uuid path] ID [type type][con-name name]} \e[0m";}
 E10(){ echo -en "\e[14;2H Тип нового подключения                                                 \e[32m type \e[0m";}
 E11(){ echo -en "\e[15;2H Имя для нового соединения                                          \e[32m con-name \e[0m";}
 E12(){ echo -en "\e[16;2H Клонировать соединение   \e[32m clone [--temporary] [id | uuid | path] ID new_name \e[0m";}
 E13(){ echo -en "\e[17;2H Удалить настроенное соединение              \e[32m delete [id | uuid | path] ID... \e[0m";}
 E14(){ echo -en "\e[18;2H Мониторинг активности профиля подключения  \e[32m monitor [id | uuid | path] ID... \e[0m";}
 E15(){ echo -en "\e[19;2H Перезагрузите все файлы подключения с диска                          \e[32m reload \e[0m";}
 E16(){ echo -en "\e[20;2H Загрузить/перезагрузить один или несколько файлов с диска  \e[32m load filename... \e[0m";}
 E17(){ echo -en "\e[21;2H Импортируйте конфигурацию          \e[32m import [--temporary] type type file file \e[0m";}
 E18(){ echo -en "\e[22;2H Экспорт соединения                      \e[32m export [id | uuid | path] ID [file] \e[0m";}
 E19(){ echo -en "\e[23;2H Показать все настроенные соединения в многоканальном режиме       \e[32m multiline \e[0m";}
 E20(){ echo -en "\e[25;2H                                                                        \e[35m Exit \e[0m";}
 INI(){ echo -en "\ec" ;stty sane;TXa;A; };INI
 while [[ "$l1" != " " ]]; do case $aa in
  0)D;echo -en "\e[1;35m"; (E0);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m
 nmcli connection
 {show|up|down|modify|add|edit|clone|delete|monitor|reload|load|import|export}
 [ARGUMENTS...]
\e[0m";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  1)D;echo -en "\e[1;35m"; (E1);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 NetworkManager хранит всю сетевую конфигурацию как «соединения», которые предста-
 вляют собой наборы данных (данные уровня 2, IP-адреса и т.д.), которые описывают,
 как создать сеть или подключиться к ней. Соединение является «активным», когда
 устройство использует конфигурацию этого соединения для создания или подключения
 к сети. Может быть несколько подключений, применимых к устройству, но только одно
 из них может быть активным на этом устройстве в любой момент времени. Дополни-
 тельные соединения могут использоваться для быстрого переключения между различны-
 ми сетями и конфигурациями.
 Рассмотрим машину, которая обычно подключена к сети с включенным DHCP, но иногда
 подключается к тестовой сети, использующей статическую IP-адресацию.
 Вместо ручной перенастройки eth0 каждый раз при изменении сети настройки можно
 сохранить в виде двух подключений, которые оба применяются к eth0, одно для DHCP
 (называемое по умолчанию) и одно с деталями статической адресации (называемое
 тестированием).
 При подключении к сети с включенным DHCP пользователь запустит:
\e[32m nmcli con up default\e[0m
 а при подключении к статической сети пользователь запустит тестирование:
\e[32m nmcli con up\e[0m
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  2)D;echo -en "\e[1;35m"; (E2);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Перечислите профили подключения в памяти и на диске, некоторые из которых также
 могут быть активны, если устройство использует этот профиль подключения.
 Без параметра отображаются все профили:\e[32m nmcli connection show\e[0m
 --active Если указан параметр, отображаются только активные профили.
 --order Параметр можно использовать для получения пользовательского порядка
 соединений.
 Соединения можно упорядочить по:
 активному статусу (active):

 имени (name):              \e[32m nmcli -f name,autoconnect c s\e[0m
 Покажет все имена профилей подключения, их свойство автоматического подключения.

 типу (type:

 пути D-Bus (path):
 Если соединения равны по категории порядка сортировки, можно указать
 дополнительную категорию.
 Порядок сортировки по умолчанию эквивалентен --order active:name:path. +
 или отсутствие префикса означает сортировку по возрастанию
 (по алфавиту или по цифрам), - означает обратный (по убыванию) порядок.
 Имена категорий можно сокращать (например, --order -a:na).
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  3)D;echo -en "\e[1;35m"; (E3);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Узнать название интерфейса:\e[32m nmcli connection\e[0m или\e[32m nmcli con\e[0m

 Показать подробности для указанных подключений. По умолчанию отображаются как
 статическая конфигурация, так и данные активного подключения.

 --active Когда указана опция, учитываются только активные профили:
\e[32m nmcli connection show --active\e[0m

 --show-secrets Используйте глобальную опцию для отображения секретов,
 связанных с профилем.
 Ключевые слова id, uuid, path и apath можно использовать,
 если идентификатор неоднозначен.

 Необязательные ключевые слова, определяющие идентификатор:
\e[32m id   \e[0m ID обозначает имя соединения.
\e[32m uuid \e[0m ID обозначает UUID соединения.
\e[32m path \e[0m ID обозначает путь статического соединения D-Bus в формате:
      \e[36m /org/freedesktop/NetworkManager/Settings/num\e[0m
       или просто num.
\e[32m apath\e[0m ID обозначает путь активного соединения D-Bus в формате:
      \e[36m /org/freedesktop/NetworkManager/ActiveConnection/num\e[0m
       или просто num.

 --fields Вывод можно отфильтровать с помощью глобальной опции.
 Используйте следующие значения:
\e[32m profile\e[0m показывает только статическую конфигурацию профиля.
\e[32m active \e[0m показывает только данные об активном соединении (когда профиль активен).

 Вы также можете указать определенные поля.
 Для статической конфигурации используйте имена настроек и свойств,
 как описано на справочной странице nm-settings-nmcli.
 Для активных данных используйте GENERAL, IP4, DHCP4, IP6, DHCP6, VPN.
 Когда для соединения nmcli не задана команда, по умолчанию используется действие:
\e[32m nmcli connection show\e[0m или\e[32m nmcli con show\e[0m или\e[32m nmcli c s\e[0m
 Показать одно подключение:\e[32m nmcli connection show \"имя_соединения\"\e[0m
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  4)D;echo -en "\e[1;35m"; (E4);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Чтобы подключиться к другому сохраненному соединению, просто передать опцию up в
 команде nmcli. Убедитесь, что вы указали SSID или UUID новой сети, к которой
 хотите подключиться. Активируйте соединение:\e[32m nmcli con up ssid/uuid\e[0m

 Соединение идентифицируется по его имени, UUID или пути D-Bus.
 Если идентификатор неоднозначен, можно использовать идентификатор ключевого слова
 UUID или путь.
 Когда требуется, чтобы конкретное устройство активировало соединение,
 следует указать параметр ifname с именем интерфейса.
 Если идентификатор не указан, требуется ifname, и NetworkManager активирует наи-
 лучшее доступное соединение для данного ifname. В случае VPN-подключения пара-
 метр ifname указывает устройство базового подключения. Параметр ap указывает,
 какую конкретную точку доступа следует использовать в случае подключения к Wi-Fi
 Если параметр --wait не указан, время ожидания по умолчанию будет равно:
 90 секундам. См. соединение, показанное выше, для описания ключевых слов,
 определяющих идентификатор.

 Доступные варианты:
\e[32m ifname     \e[0m интерфейс, который будет использоваться для активации:

\e[32m nmcli c a ifname Maxipes-fik type vlan dev eth0 id 55\e[0m
 В неинтерактивном режиме добавляет соединение VLAN с идентификатором 55.
 Соединение будет использовать eth0, а интерфейс VLAN будет называться Maxipes-fik.

\e[32m nmcli c a ifname eth0 type ethernet ipv4.method disabled ipv6.method link-local\e[0m
 В неинтерактивном режиме добавляет соединение, которое будет использовать
 интерфейс Ethernet eth0 и имеет настроенный только локальный адрес канала IPv6.

\e[32m     ap     \e[0m BSSID точки доступа, к которой должна подключиться команда
             (для соединений Wi-Fi).
\e[32m passwd-file\e[0m некоторые сети могут потребовать учетные данные во время активации.
             Вы можете предоставить эти учетные данные, используя эту опцию.
             Каждая строка файла должна содержать один пароль в виде:
            \e[32m setting_name.property_name:the password\e[0m

             Например, для WPA Wi-Fi с PSK строка будет выглядеть так:
            \e[32m 802-11-wireless-security.psk:secret12345\e[0m

             Для пароля 802.1X строка будет:
            \e[32m 802-1x.password:my 1X password\e[0m

 nmcli также принимает строки wifi-sec и wifi вместо 802-11-wireless-security.
 Когда NetworkManager запрашивает пароль, а он не указан, nmcli запросит его при
 запуске с параметром --ask. Если --ask не был передан. NetworkManager может
 запросить другой секретный агент, который может быть запущен (обычно это
 секретный агент с графическим интерфейсом, такой как nm-applet или gnome-shell).

 Oбновить настройки:\e[32m nmcli connection up static\e[0m

 Поднять интерфейс:\e[32m nmcli con up имя_интерфейса\e[0m
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  5)D;echo -en "\e[1;35m"; (E5);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Oтключить интерфейс:\e[32m nmcli con down имя_интерфейса\e[0m

 При подключении к одной сети, но надо использовать другое соединение, Можно
 отключиться, переключив соединение на «no». Нужно будет указать SSID или,
 если несколько подключений с одним и тем же SSID, используйте UUID:
\e[32m nmcli con down ssid/uuid\e[0m

 Деактивировать соединение с устройства, не препятствуя дальнейшей автоматической
 активации устройства. Команде можно передать несколько соединений. Имейте в виду,
 что эта команда деактивирует указанное активное подключение, но устройство, на
 котором подключение было активным, по-прежнему готово к подключению и выполнит
 автоматическую активацию путем поиска подходящего подключения с установленным
 флагом «автоподключение». Обратите внимание, что деактивирующий профиль
 подключения внутренне заблокирован от повторного автоматического подключения.
 Следовательно, он не будет автоматически подключаться до перезагрузки или
 до тех пор, пока пользователь не выполнит действие, которое разблокирует
 автоматическое подключение, например, изменит профиль или явно активирует его.
 В большинстве случаев вместо этого вы можете использовать команду отключения
 устройства. Соединение идентифицируется по его имени, UUID или пути D-Bus.
 Если идентификатор неоднозначен, можно использовать идентификатор ключевого слова:
 id, uuid, path or apath
 См. соединение, показанное выше, для описания ключевых слов, определяющих
 идентификатор.
 Если параметр --wait не указан, время ожидания по умолчанию будет 10 секунд.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  6)D;echo -en "\e[1;35m"; (E6);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Добавляйте, изменяйте или удаляйте свойства в профиле соединения. Чтобы установить
 свойство, просто укажите имя свойства, за которым следует значение.
 Пустое значение (\"\") сбрасывает значение свойства до значения по умолчанию.
 См. nm-settings-nmcli для полной информации об именах настроек и свойств, их
 описаниях и значениях по умолчанию. Настройка и свойство могут быть сокращены,
 если они уникальны.
 Если вы хотите добавить элемент или флаг к существующему значению, используйте
 префикс + для имени свойства или псевдонима. Если вы хотите удалить элементы из
 свойство типа контейнера или флага, используйте - префикс.
 Для определенных свойств вы также можете удалить элементы, указав индекс(ы),
 начинающийся с нуля. + и - модификаторы имеют реальный эффект только для тех
 свойств, которые их поддерживают. Это, например, многозначные (контейнерные)
 свойства или флаги, такие как ipv4.dns, ip4, ipv4.addresses, bond.options, флаги
 802-1x.phase1-auth и т. д.
 Соединение идентифицируется по его имени, UUID или пути D-Bus. Если идентификатор
 неоднозначен, можно использовать идентификатор ключевого слова UUID или путь.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  7)D;echo -en "\e[1;35m"; (E7);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Удаляет параметр из профиля подключения.

 Изменяет свойство «autoconnect» в настройке «connection» соединения «ethernet-2»:
\e[32m nmcli con mod ethernet-2 connection.autoconnect no\e[0m

 Изменяет свойство «mtu» в настройке «wifi» подключения «Домашний Wi-Fi»:
\e[32m nmcli con mod \"Home Wi-Fi\" wifi.mtu 1350\e[0m

 Устанавливает ручную адресацию и адреса в профиле em1-1:
\e[32m nmcli con mod em1-1 ipv4.method manual ipv4.addr \"192.168.1.23/24 192.168.1.1, 10.10.1.5/8, 10.0.0.11\"\e[0m

 Добавляет общедоступный DNS-сервер Google к DNS-серверам в профиле ABC:
\e[32m nmcli con modify ABC +ipv4.dns 8.8.8.8\e[0m

 Удаляет указанный IP-адрес из (статического) профиля ABC:
\e[32m nmcli con modify ABC -ipv4.addresses \"192.168.100.25/24 192.168.1.1\"\e[0m
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  8)D;echo -en "\e[1;35m"; (E8);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;
sleep 0,020;echo -e "
\e[36m Create a new connection using specified properties\e[0m"
sleep 0,020;echo -e "\e[90m Создайте новое соединение, используя указанные свойства\e[0m
";
sleep 0,020;echo -e "\e[32m add [save {yes | no}] {option value | [+|-]setting.property value}...\e[0m
";
sleep 0,020;echo "   Вам необходимо описать вновь созданные соединения с парами свойств и значений.
 Полный справочник смотрите в nm-settings-nmcli.
 Синтаксис такой же, как у команды изменения соединения nmcli.
   Чтобы построить значимое соединение, вам как минимум нужно установить свойство
 connection.type (или использовать псевдоним типа)
 для одного из известных типов соединения NetworkManager:
";
sleep 0,020;echo -e "\e[32m 6lowpan         \e[0m";
sleep 0,020;echo -e "\e[32m 802-11-olpc-mesh\e[0m псевдоним olpc-mesh";
sleep 0,020;echo -e "\e[32m 802-11-wireless \e[0m псевдоним wifi";
sleep 0,020;echo -e "\e[32m 802-3-ethernet  \e[0m псевдоним ethernet";
sleep 0,020;echo -e "\e[32m adsl            \e[0m";
sleep 0,020;echo -e "\e[32m bluetooth       \e[0m";
sleep 0,020;echo -e "\e[32m bond            \e[0m";
sleep 0,020;echo -e "\e[32m bond-slave      \e[0m устарело для Ethernet с мастером";
sleep 0,020;echo -e "\e[32m bridge          \e[0m";
sleep 0,020;echo -e "\e[32m bridge-slave    \e[0m устарело для Ethernet с мастером";
sleep 0,020;echo -e "\e[32m cdma            \e[0m";
sleep 0,020;echo -e "\e[32m dummy           \e[0m";
sleep 0,020;echo -e "\e[32m generic         \e[0m";
sleep 0,020;echo -e "\e[32m gsm             \e[0m";
sleep 0,020;echo -e "\e[32m infiniband      \e[0m";
sleep 0,020;echo -e "\e[32m ip-tunnel       \e[0m";
sleep 0,020;echo -e "\e[32m macsec          \e[0m";
sleep 0,020;echo -e "\e[32m macvlan         \e[0m";
sleep 0,020;echo -e "\e[32m olpc-mesh       \e[0m";
sleep 0,020;echo -e "\e[32m ovs-bridge      \e[0m";
sleep 0,020;echo -e "\e[32m ovs-dpdk        \e[0m";
sleep 0,020;echo -e "\e[32m ovs-interface   \e[0m";
sleep 0,020;echo -e "\e[32m ovs-patch       \e[0m";
sleep 0,020;echo -e "\e[32m ovs-port        \e[0m";
sleep 0,020;echo -e "\e[32m pppoe           \e[0m";
sleep 0,020;echo -e "\e[32m team            \e[0m";
sleep 0,020;echo -e "\e[32m team-slave      \e[0m устарело для Ethernet с мастером";
sleep 0,020;echo -e "\e[32m tun             \e[0m";
sleep 0,020;echo -e "\e[32m veth            \e[0m";
sleep 0,020;echo -e "\e[32m vlan            \e[0m";
sleep 0,020;echo -e "\e[32m vpn             \e[0m";
sleep 0,020;echo -e "\e[32m vrf             \e[0m";
sleep 0,020;echo -e "\e[32m vxlan           \e[0m";
sleep 0,020;echo -e "\e[32m wifi-p2p        \e[0m";
sleep 0,020;echo -e "\e[32m wimax           \e[0m";
sleep 0,020;echo -e "\e[32m wireguard       \e[0m";
sleep 0,020;echo ";
 Наиболее типичные варианты использования описаны в разделе ПРИМЕРЫ.
";
sleep 0,020;echo " Помимо свойств и значений принимаются две специальные опции:";
sleep 0,020;echo -e "\e[32m save\e[0m Определяет, должно ли соединение быть постоянным,
      т. е. NetworkManager должен хранить его на диске (по умолчанию: да).";
sleep 0,020;echo -e "\e[32m --  \e[0m Если встречается один аргумент --, он игнорируется.
      Это сделано для совместимости со старыми версиями nmcli.
";
echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  9)D;echo -en "\e[1;35m"; (E9);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Отредактируйте существующее соединение или добавьте новое с помощью интерактивного
 редактора. Существующее соединение идентифицируется по его имени, UUID или пути
 D-Bus. Если идентификатор неоднозначен, можно использовать идентификатор ключевого
 слова UUID или путь. См. соединение, показанное выше, для описания ключевых слов,
 определяющих идентификатор. Отсутствие идентификатора означает, что будет
 добавлено новое соединение. Интерактивный редактор проведет вас через
 редактирование соединения и позволит вам изменить параметры соединения в
 соответствии с вашими потребностями с помощью простого интерфейса на основе меню.
 Редактор показывает, какие настройки и свойства можно изменить, и предоставляет
 встроенную справку.
 См. также nm-settings-nmcli для всех настроек и свойств NetworkManager,
 а также их описания; и nmcli-examples для сеансов редактора примеров.

 Редактирует существующее соединение «ethernet-em1-2» в интерактивном редакторе:
\e[32m nmcli connection edit ethernet-em1-2\e[0m
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 10)D;echo -en "\e[1;35m";(E10);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m type\e[0m тип нового подключения.
 Допустимые типы такие же, как и для команды добавления соединения.

 В неинтерактивном режиме добавляет соединение Ethernet:
\e[32m nmcli connection add type ethernet autoconnect no ifname eth0\e[0m
 привязанное к интерфейсу eth0, с автоматической настройкой IP (DHCP)
 и отключает флаг автоматического подключения соединения.

 Добавляет новое соединение Ethernet в интерактивный редактор:
\e[32m nmcli connection edit type ethernet con-name \"yet another Ethernet connection\"\e[0m
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 11)D;echo -en "\e[1;35m";(E11);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m con-name\e[0m имя для нового соединения. Его можно изменить позже в редакторе.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 12)D;echo -en "\e[1;35m";(E12);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Клонировать соединение. Клонируемое соединение идентифицируется по имени, UUID
 или пути D-Bus. Если идентификатор неоднозначен, можно использовать идентификатор
 ключевого слова, UUID или путь. См. соединение, показанное выше, для описания
 ключевых слов, определяющих идентификатор. new_name — это имя нового клонирован-
 ного соединения. Новое соединение будет точной копией, за исключением свойств
 connection.id (new_name) и connection.uuid (generated).
 Новый профиль подключения будет сохранен как постоянный, если не указан
 параметр --temporary, в этом случае новый профиль не будет существовать после
 перезапуска NetworkManager.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 13)D;echo -en "\e[1;35m";(E13);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Удалить настроенное соединение. Соединение, которое нужно удалить,
 идентифицируется по его имени, UUID или пути D-Bus. Если идентификатор
 неоднозначен, можно использовать идентификатор ключевого слова, UUID или путь.
 См. соединение, показанное выше, для описания ключевых слов, определяющих
 идентификатор.
 Если параметр --wait не указан, время ожидания по умолчанию равно 10 секундам.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 14)D;echo -en "\e[1;35m";(E14);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Мониторинг активности профиля подключения.
 Эта команда печатает строку всякий раз, когда изменяется указанное соединение.
 Отслеживаемое соединение идентифицируется по имени, UUID или пути D-Bus.
 Если идентификатор неоднозначен, можно использовать идентификатор ключевого
 слова, UUID или путь. См. соединение, показанное выше, для описания ключевых
 слов, определяющих идентификатор. Отслеживает все профили подключения, если ни
 один из них не указан. Команда завершается, когда исчезают все отслеживаемые
 соединения. Если вы хотите отслеживать создание соединения, рассмотрите
 возможность использования глобального монитора с командой монитора nmcli.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 15)D;echo -en "\e[1;35m";(E15);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Перезагрузите все файлы подключения с диска. NetworkManager не отслеживает
 изменения в соединении. Поэтому вам нужно использовать эту команду, чтобы указать
 NetworkManager перечитать профили подключения с диска, когда в них были внесены
 изменения.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 16)D;echo -en "\e[1;35m";(E16);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Загрузить/перезагрузить один или несколько файлов подключения с диска.
 Используйте это после ручного редактирования файла подключения,
 чтобы убедиться, что NetworkManager знает о его последнем состоянии.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 17)D;echo -en "\e[1;35m";(E17);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Импортируйте external/foreign внешний/несоответствующий конфигурацию в качестве
 профиля подключения NetworkManager. Тип входного файла определяется параметром
 type. На данный момент поддерживаются только конфигурации VPN. Конфигурация
 импортируется подключаемыми модулями NetworkManager VPN значения типа такие же,
 как для параметра типа vpn в добавлении соединения nmcli. Конфигурации VPN
 импортируются подключаемыми модулями VPN. Поэтому необходимо установить
 соответствующий плагин VPN, чтобы nmcli мог импортировать данные.
 Импортированный профиль подключения будет сохранен как постоянный, если не указан
 параметр --temporary, в этом случае новый профиль не будет существовать после
 перепуска NetworkManager.

 Импортирует конфигурацию OpenVPN в NetworkManager:
\e[32m nmcli con import type openvpn file ~/Downloads/frootvpn.ovpn\e[0m
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 18)D;echo -en "\e[1;35m";(E18);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 На данный момент поддерживаются только VPN-подключения. Должен быть установлен
 правильный плагин VPN, чтобы nmcli мог экспортировать соединение. Если файл не
 предоставлен, данные конфигурации VPN будут распечатаны на стандартный вывод.

 Экспортирует VPN-профиль NetworkManager corp-vpnc
 как стандартную конфигурацию Cisco (vpnc):
\e[32m nmcli con export corp-vpnc /home/joe/corpvpn.conf\e[0m
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 19)D;echo -en "\e[1;35m";(E19);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m nmcli -p -m multiline -f all con show\e[0m
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 20)D;echo -en "\e[1;35m";(E20);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;fNmcli;fi;;
esac;C;done
}
#================================================================================
#================================================================================
#================================================================================
#================================================================================
fDeviceManagementCommands()
{
 trap 'echo -en "\ec"; stty sane; exit' SIGINT
 aa=0
 A(){ for b in $(seq 0 31);do E${b};done; }
 B()
{
  local c
  IFS= read -s -n1 c 2>/dev/null >&2
  if [[ $c = $(echo -en "\e") ]]; then
    read -s -n1 c 2>/dev/null >&2
    if [[ $c = \[ ]]; then
      read -s -n1 c 2>/dev/null >&2
      case $c in
        A) echo d ;;
        B) echo e ;;
        C) echo f ;;
        D) echo g ;;
      esac
    fi
  elif [[ "$c" == "$(echo -en \\x0A)" ]]; then
    echo enter
  fi
}
 C()
{
 if [[ $i == d ]];then ((aa--));fi
 if [[ $i == e ]];then ((aa++));fi
 if [[ $aa -lt 0  ]];then aa=31;fi
 if [[ $aa -gt 31 ]];then aa=0;fi;
}

 D()
{
 j1=$((aa+1)); k1=$((aa-1))
 if [[ $k1 -lt 0   ]];then k1=31;fi
 if [[ $j1 -gt 31 ]];then j1=0;fi
 if [[ $aa -lt $aa ]];then echo -en "\e[0m";E$k1;else echo -en "\e[0m";E$j1;fi
 if [[ $j1 -eq 0   ]] || [ $k1 -eq 31 ];then
 echo -en "\e[0m" ; E$k1; E$j1;fi;echo -en "\e[0m";E$k1;E$j1;
}
 TXa()
{
 for (( a=2; a<=38; a++ ))
  do
   echo -e "\e[${a};1H\e[35m\xE2\x94\x82                                                                                \xE2\x94\x82\e[0m"
  done
 echo -en "\e[1;1H\e[35m┌────────────────────────────────────────────────────────────────────────────────┐\e[0m";
 echo -en "\e[2;2H\e[36m DEVICE MANAGEMENT COMMANDS\e[0m                     \e[2m Команды управления устройством\e[0m";
 echo -en "\e[3;1H\e[35m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
 echo -en "\e[4;2H\e[2m Отображение сетевых интерфейсов и управление ими\e[0m";
 echo -en "\e[5;1H\e[35m├────────────────────────────────────────────────────────────────────────────────┤\e[0m";
 echo -en "\e[37;1H\e[35m├─ \xE2\x86\x91 Up ───── \xE2\x86\x93 Down ──── \xe2\x86\xb2 Select Enter ────────────────────────────────────────┤\e[0m";
 echo -en "\e[39;1H\e[35m└────────────────────────────────────────────────────────────────────────────────┘\e[0m";
}
  E0(){ echo -en "\e[6;2H Kраткий обзор                                                      \e[32m Synopsis \e[0m";}
  E1(){ echo -en "\e[7;2H Распечатать статус устройств                                         \e[32m status \e[0m";}
  E2(){ echo -en "\e[8;2H Показать подробную информацию об устройствах                  \e[32m show [ifname] \e[0m";}
  E3(){ echo -en "\e[9;2H Задайте свойства\e[32m set[ifname] ifname[autoconnect {yes no}] [managed {yes no}] \e[0m";}
  E4(){ echo -en "\e[10;2H Подключите устройство                                             \e[32m up ifname \e[0m";}
  E5(){ echo -en "\e[11;2H Псевдоним для команды вверх                                  \e[32m connect ifname \e[0m";}
  E6(){ echo -en "\e[12;2H Попытка обновить устройство с изменениями                    \e[32m reapply ifname \e[0m";}
  E7(){ echo -en "\e[13;2H Измените настройки \e[32m modify ifname {option value [+|-]setting.property value} \e[0m";}
  E8(){ echo -en "\e[14;2H Отключите устройство и запретите устройству                  \e[32m down ifname... \e[0m";}
  E9(){ echo -en "\e[15;2H Псевдоним для команды вниз                             \e[32m disconnect ifname... \e[0m";}
 E10(){ echo -en "\e[16;2H Удалить устройство                                         \e[32m delete ifname... \e[0m";}
 E11(){ echo -en "\e[17;2H Следите за активностью устройства                       \e[32m monitor [ifname...] \e[0m";}
 E12(){ echo -en "\e[18;2H Список точек wifi \e[32m [list[--rescan|auto|no|yes] [ifname ifname][bssid BSSID]] \e[0m";}
 E13(){ echo -en "\e[19;2H Подключитесь к сети Wi-Fi, указанной SSID или BSSID            \e[32m wifi connect \e[0m";}
 E14(){ echo -en "\e[20;2H Пароль для защищенных сетей (WEP или WPA)                          \e[32m password \e[0m";}
 E15(){ echo -en "\e[21;2H Tип секрета WEP, либо ключ для ключа ASCII/HEX                 \e[32m wep-key-type \e[0m";}
 E16(){ echo -en "\e[22;2H Интерфейс, который будет использоваться для активации                \e[32m ifname \e[0m";}
 E17(){ echo -en "\e[23;2H Если указано, созданное соединение будет ограничено только для BSSID  \e[32m bssid \e[0m";}
 E18(){ echo -en "\e[24;2H Если указано, соединение будет использовать это имя                    \e[32m name \e[0m";}
 E19(){ echo -en "\e[25;2H Cоединение будет видно только пользователю                          \e[32m private \e[0m";}
 E20(){ echo -en "\e[26;2H Установите значение «да» при первом подключении к точке доступа      \e[32m hidden \e[0m";}
 E21(){ echo -en "\e[27;2H Создайте точку доступа Wi-Fi                                   \e[32m wifi hotspot \e[0m";}
 E22(){ echo -en "\e[28;2H Какое устройство Wi-Fi используется                                  \e[32m ifname \e[0m";}
 E23(){ echo -en "\e[29;2H Имя созданного профиля подключения к точке доступа                 \e[32m con-name \e[0m";}
 E24(){ echo -en "\e[30;2H SSID точки доступа                                                     \e[32m ssid \e[0m";}
 E25(){ echo -en "\e[31;2H Диапазон Wi-Fi для использования                                       \e[32m band \e[0m";}
 E26(){ echo -en "\e[32;2H Канал Wi-Fi для использования                                       \e[32m channel \e[0m";}
 E27(){ echo -en "\e[33;2H Пароль для созданной точки доступа                                 \e[32m password \e[0m";}
 E28(){ echo -en "\e[34;2H Просканировать точки доступа     \e[32m wifi rescan [ifname ifname] [ssid SSID...] \e[0m";}
 E29(){ echo -en "\e[35;2H Показать информацию о активных сетях Wi-Fi\e[32m wifi show-password[ifname ifname] \e[0m";}
 E30(){ echo -en "\e[36;2H Отображение информации о соседних устройствах   \e[32m lldp [list [ifname ifname]] \e[0m";}
 E31(){ echo -en "\e[38;2H                                                                        \e[35m Exit \e[0m";}
 INI(){ echo -en "\ec" ;stty sane;TXa;A; };INI
 while [[ "$l1" != " " ]]; do case $aa in
  0)D;echo -en "\e[1;35m"; (E0);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m
 nmcli device
{
 status|show|set|up|connect|reapply|modify|down|disconnect|delete|monitor|wifi|lldp
}
 [ARGUMENTS...]
\e[0m";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  1)D;echo -en "\e[1;35m"; (E1);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Это действие по умолчанию, если для устройства nmcli не указана команда.
 Команда:\e[32m nmcli device status\e[0m или\e[32m nmcli dev status\e[0m
 Ответ:
 -----------+------+-----------+-----------
 DEVICE     | TYPE | STATE     | CONNECTION
 устройство | тип  | состояние | связь
                     connected | подключено
                  disconnected | не подключено
                   unavailable | недоступен
                     unmanaged | неуправляемый

 В том числе и раздача со смартфона
 Команда:
 nmcli device wifi list
или
 nmcli dev wifi list
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  2)D;echo -en "\e[1;35m"; (E2);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Без пререканий проверяются все устройства:
\e[32m nmcli device show\e[0m или\e[32m nmcli dev show\e[0m

 Получить информацию о конкретном устройстве, необходимо указать имя интерфейса:
\e[32m nmcli device show имя_устройства\e[0m

 Выводит список доступных точек доступа Wi-Fi, известных NetworkManager:
\e[32m nmcli dev wifi\e[0m

 Покажет все доступные профили подключения для вашего интерфейса Wi-Fi wlp3s0:
\e[32m nmcli -f CONNECTIONS device show wlp3s0\e[0m
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  3)D;echo -en "\e[1;35m"; (E3);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m\e[0m";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  4)D;echo -en "\e[1;35m"; (E4);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Подключите устройство. NetworkManager попытается найти подходящее соединение,
 которое будет активировано. Также будут учитываться соединения, для которых не
 настроено автоматическое подключение. Если совместимого соединения не существует,
 будет создан и активирован новый профиль с настройками по умолчанию. Это отличает
 подключение nmcli ifname «\$DEVICE» от подключения nmcli «\$DEVICE». Если опция
 --wait не указана, время ожидания по умолчанию будет составлять 90 секунд.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  5)D;echo -en "\e[1;35m"; (E5);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Псевдоним для команды вверх. До версии 1.34.0 не поддерживалась.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  6)D;echo -en "\e[1;35m"; (E6);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Попытка обновить устройство с изменениями в текущем активном соединении,
 сделанными с момента его последнего применения:
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  7)D;echo -en "\e[1;35m"; (E7);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Измените настройки, которые в данный момент активны на устройстве.
 Эта команда позволяет вам вносить временные изменения в конфигурацию,
 активную на конкретном устройстве. Изменения не сохраняются в профиле подключения
 Смотрите nm-settings-nmcli для списка доступных свойств. Обратите внимание,
 что некоторые свойства нельзя изменить на уже подключенном устройстве.

 Временно добавляет IP-адрес устройству:
\e[32m nmcli dev modify em1 ipv6.address 2001:db8::a:bad:c0de\e[0m
 Адрес будет удален, когда то же соединение будет активировано снова.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  8)D;echo -en "\e[1;35m"; (E8);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Отключите устройство и запретите устройству автоматически активировать дальнейшие
 соединения без вмешательства пользователя/ручного вмешательства. Обратите
 внимание, что отключение программных устройств может означать, что устройства
 исчезнут.
 Если опция --wait не указана, таймаут по умолчанию будет составлять 10 секунд.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
  9)D;echo -en "\e[1;35m"; (E9);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Псевдоним для команды вниз. До версии 1.34.0 не поддерживалась.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 10)D;echo -en "\e[1;35m";(E10);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Команда удаляет интерфейс из системы. Обратите внимание, что это работает
 только для программных устройств, таких как связи, мосты, команды и т. д.
 Аппаратные устройства (например, Ethernet) не могут быть удалены командой.
 Если параметр --wait не указан, время ожидания по умолчанию будет равно 10 сек.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 11)D;echo -en "\e[1;35m";(E11);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Эта команда печатает строку всякий раз, когда указанные устройства изменяют
 состояние. Контролирует все устройства, если интерфейс не указан. Монитор
 прекращает работу, когда все указанные устройства исчезают. Если вы хотите
 отслеживать добавление устройств, рассмотрите возможность использования
 глобального монитора с командой:\e[32m nmcli monitor\e[0m
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 12)D;echo -en "\e[1;35m";(E12);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Параметры ifname и bssid можно использовать для перечисления точек доступа
 для определенного интерфейса или с определенным BSSID соответственно.
 По умолчанию nmcli гарантирует, что список точек доступа не старше 30 секунд,
 и при необходимости запускает сканирование сети.
 --rescan опцию можно использовать как для принудительного, так и для отключения
 сканирования независимо от того, насколько свеж список точек доступа.
 Запустите сканирование внутри nmcli на предмет ближайших беспроводных
 сетей. Сначала запустите команду rescan, чтобы создать новый список:
\e[32m nmcli device wifi rescan\e[0m

 В том числе и раздача со смартфона
 Команда:\e[32m nmcli device wifi list\e[0m или\e[32m nmcli dev wifi list\e[0m
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 13)D;echo -en "\e[1;35m";(E13);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 wifi connect (B)SSID [password password] [wep-key-type {key | phrase}]
 [ifname ifname] [bssid BSSID] [name name] [private {yes | no}] [hidden {yes | no}]
 \e[0m
 Команда находит подходящее соединение или создает его, а затем активирует на
 устройстве. Это аналог командной строки щелчка по SSID в клиенте с графическим
 интерфейсом. Если подключение к сети уже существует, можно вызвать (активировать)
 существующий профиль следующим образом:\e[32m nmcli con up id name\e[0m
 Обратите внимание, что поддерживаются только открытые сети WEP и WPA-PSK, если
 ранее не было подключения.
 Также предполагается, что конфигурация IP получается через DHCP.
 Если параметр --wait не указан, время ожидания по умолчанию равно 90 секундам.

 Команда:          \e[32m sudo nmcli dev wifi connect имя_сети\e[0m

 В качестве альтернативы можно использовать параметр –ask:
\e[32m sudo nmcli --ask dev wifi connect имя_сети\e[0m
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 14)D;echo -en "\e[1;35m";(E14);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Команда с паролем:\e[32m sudo nmcli dev wifi connect имя_сети password \"пароль\"\e[0m
                        \e[32m nmcli dev wifi con имя_сети password \"пароль\"\e[0m
 Теперь система попросит вас ввести сетевой пароль, не делая его видимым.
 Если у вас есть защита WEP или WPA на вашем WI-Fi, вы также можете указать сетевой
 пароль в команде:
\e[32m sudo nmcli dev wifi connect network-ssid password network-password\e[0m
 Можно к смарфону подключиться.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 15)D;echo -en "\e[1;35m";(E15);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 wep-key-type
 тип секрета WEP, либо ключ для ключа ASCII/HEX, либо фраза для фразы-пароля.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 16)D;echo -en "\e[1;35m";(E16);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 17)D;echo -en "\e[1;35m";(E17);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 18)D;echo -en "\e[1;35m";(E18);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 name если указано, соединение будет использовать это имя
 (иначе NM сам создаст имя).
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 19)D;echo -en "\e[1;35m";(E19);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 private если установлено значение «да», соединение будет видно только
 пользователю, который его создал. В противном случае соединение является
 общесистемным, что является значением по умолчанию.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 20)D;echo -en "\e[1;35m";(E20);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 hidden установите значение «да» при первом подключении к точке доступа,
 не передающей свой SSID. В противном случае SSID не будет найден и попытка
 подключения завершится неудачно.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 21)D;echo -en "\e[1;35m";(E21);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 wifi hotspot [ifname ifname    ]
              [con-name name    ]
              [ssid SSID        ]
              [band {a | bg}    ]
              [channel channel  ]
              [password password]
\e[0m
 Команда создает профиль подключения к точке доступа в соответствии с
 возможноcтями устройства Wi-Fi и активирует его на устройстве.
 Точка доступа защищена WPA, если устройство/драйвер поддерживает это,
 в противном случае используется WEP. Используйте разрыв соединения
 или отключение устройства, чтобы остановить точку доступа.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 22)D;echo -en "\e[1;35m";(E22);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 23)D;echo -en "\e[1;35m";(E23);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 24)D;echo -en "\e[1;35m";(E24);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 25)D;echo -en "\e[1;35m";(E25);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 26)D;echo -en "\e[1;35m";(E26);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 27)D;echo -en "\e[1;35m";(E27);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 password пароль для созданной точки доступа. Если он не указан, nmcli сгенерирует
 пароль. Пароль представляет собой либо общий ключ WPA, либо ключ WEP.
 Обратите внимание, что глобальную опцию --show-secrets можно использовать для
 печати пароля точки доступа. Это особенно полезно, когда пароль был сгенерирован.

 Cоздает профиль точки доступа и подключает его:
\e[32m nmcli -s dev wifi hotspot con-name QuickHotspot\e[0m
 Печатает пароль точки доступа, который пользователь должен использовать
 для подключения к точке доступа с других устройств.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 28)D;echo -en "\e[1;35m";(E28);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Запросите, чтобы NetworkManager немедленно повторно просканировал доступные точки
 доступа:
 NetworkManager периодически сканирует сети Wi-Fi, но в некоторых случаях бывает
 полезно запустить сканирование вручную (например, после возобновления работы
 компьютера). Используя ssid, можно сканировать определенный SSID, что полезно для
 точек доступа со скрытыми SSID. Вы можете указать несколько параметров ssid, чтобы
 сканировать больше SSID. Эта команда не показывает точки доступа, для этого
 используйте:\e[32m nmcli device wifi list\e[0m
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 29)D;echo -en "\e[1;35m";(E29);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Показать подробную информацию об активных сетях Wi-Fi, включая секреты:
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 30)D;echo -en "\e[1;35m";(E30);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Отображение информации о соседних устройствах:
 полученной с помощью протокола обнаружения канального уровня (LLDP).
 Опцию ifname можно использовать для вывода списка соседей только для данного
 интерфейса. Протокол должен быть включен в настройках подключения.
";echo -en "\e[1;35m ENTER = main menu ";read;INI;fi;;
 31)D;echo -en "\e[1;35m";(E31);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;fNmcli;fi;;
esac;C;done
}
#================================================================================
#================================================================================
#================================================================================
#================================================================================
fNmcli()
{
 trap 'echo -en "\ec"; stty sane; exit' SIGINT
 aa=0
 A(){ for b in $(seq 0 20);do E${b};done; }
 B()
{
  local c
  IFS= read -s -n1 c 2>/dev/null >&2
  if [[ $c = $(echo -en "\e") ]]; then
    read -s -n1 c 2>/dev/null >&2
    if [[ $c = \[ ]]; then
      read -s -n1 c 2>/dev/null >&2
      case $c in
        A) echo d ;;
        B) echo e ;;
        C) echo f ;;
        D) echo g ;;
      esac
    fi
  elif [[ "$c" == "$(echo -en \\x0A)" ]]; then
    echo enter
  fi
}
 C()
{
 if [[ $i == d ]];then ((aa--));fi
 if [[ $i == e ]];then ((aa++));fi
 if [[ $aa -lt 0  ]];then aa=20;fi
 if [[ $aa -gt 20 ]];then aa=0;fi;
}

 D()
{
 j1=$((aa+1)); k1=$((aa-1))
 if [[ $k1 -lt 0   ]];then k1=20;fi
 if [[ $j1 -gt 20 ]];then j1=0;fi
 if [[ $aa -lt $aa ]];then echo -en "\e[0m";E$k1;else echo -en "\e[0m";E$j1;fi
 if [[ $j1 -eq 0   ]] || [ $k1 -eq 20 ];then
 echo -en "\e[0m" ; E$k1; E$j1;fi;echo -en "\e[0m";E$k1;E$j1;
}
 TXa()
{
 for (( a=2; a<=34; a++ ))
  do
   echo -e "\e[${a};1H\e[\e[45;30m│\e[0m                                                                                \e[45;30m│\e[0m"
  done
 echo -en "\e[0;1H\e[45;30m┌────────────────────────────────────────────────────────────────────────────────┐\e[0m";
 echo -en "\e[3;3H\e[1;35m *** nmcli ***\e[0m";
 echo -en "\e[4;1H\e[45;30m├\e[0m\e[35m────────────────────────────────────────────────────────────────────────────────\e[0m\e[45;30m┤\e[0m";
 echo -en "\e[5;3H\e[2m command-line tool for controlling NetworkManager\e[0m";
 echo -en "\e[6;1H\e[45;30m├\e[0m\e[35m────────────────────────────────────────────────────────────────────────────────\e[0m\e[45;30m┤\e[0m";
 echo -en "\e[19;1H\e[45;30m├\e[0m\e[35m────────────────────────────────────────────────────────────────────────────────\e[0m\e[45;30m┤\e[0m";
 echo -en "\e[21;1H\e[45;30m├\e[0m\e[35m────────────────────────────────────────────────────────────────────────────────\e[0m\e[45;30m┤\e[0m";
 echo -en "\e[22;3H\e[35m COMMANDS\e[0m                                                           \e[2m КОМАНДЫ\e[0m";
 echo -en "\e[28;1H\e[45;30m├\e[0m\e[35m────────────────────────────────────────────────────────────────────────────────\e[0m\e[45;30m┤\e[0m";
 echo -en "\e[30;1H\e[45;30m├\e[0m\e[35m────────────────────────────────────────────────────────────────────────────────\e[0m\e[45;30m┤\e[0m";
 echo -en "\e[32;1H\e[45;30m├\e[0m\e[35m─ \xE2\x86\x91 Up ───── \xE2\x86\x93 Down ──── \xe2\x86\xb2 Select Enter ────────────────────────────────────────\e[0m\e[45;30m┤\e[0m";
 echo -en "\e[35;1H\e[45;30m└────────────────────────────────────────────────────────────────────────────────┘\e[0m";
}
  E0(){ echo -en "\e[7;3H Установка                                                          \e[32m INSTALL \e[0m";}
  E1(){ echo -en "\e[8;3H Kраткий обзор                                                     \e[32m SYNOPSIS \e[0m";}
  E2(){ echo -en "\e[9;3H Описание                                                       \e[32m DESCRIPTION \e[0m";}
  E3(){ echo -en "\e[10;3H Переменные среды                                     \e[32m ENVIRONMENT VARIABLES \e[0m";}
  E4(){ echo -en "\e[11;3H Примечания по интернационализации               \e[32m INTERNATIONALIZATION NOTES \e[0m";}
  E5(){ echo -en "\e[12;3H Примечания                                                           \e[32m NOTES \e[0m";}
  E6(){ echo -en "\e[13;3H Ошибки                                                                \e[32m BUGS \e[0m";}
  E7(){ echo -en "\e[14;3H Смотри также                                                      \e[32m SEE ALSO \e[0m";}
  E8(){ echo -en "\e[15;3H Статус выхода                                                  \e[32m EXIT STATUS \e[0m";}
  E9(){ echo -en "\e[16;3H Oкраска                                                             \e[32m COLORS \e[0m";}
 E10(){ echo -en "\e[17;3H Секретный агент                                               \e[32m SECRET AGENT \e[0m";}
 E11(){ echo -en "\e[18;3H Монитор активности                                        \e[32m ACTIVITY MONITOR \e[0m";}
 E12(){ echo -en "\e[20;3H Опции                                                              \e[36m OPTIONS \e[0m";}
 E13(){ echo -en "\e[23;3H Общие команды                                             \e[36m GENERAL COMMANDS \e[0m";}
 E14(){ echo -en "\e[24;3H Команды управления сетью                       \e[36m NETWORKING CONTROL COMMANDS \e[0m";}
 E15(){ echo -en "\e[25;3H Команды управления радиопередачей      \e[32m RADIO TRANSMISSION CONTROL COMMANDS \e[0m";}
 E16(){ echo -en "\e[26;3H Команды управления подключением             \e[36m CONNECTION MANAGEMENT COMMANDS \e[0m";}
 E17(){ echo -en "\e[27;3H Команды управления устройством                  \e[36m DEVICE MANAGEMENT COMMANDS \e[0m";}
 E18(){ echo -en "\e[29;3H Псевдографический интерфейс на Whiptail                              \e[36m nmtui \e[0m";}
 E19(){ echo -en "\e[31;3H                                                                        \e[36m Git \e[0m";}
 E20(){ echo -en "\e[33;3H                                                                       \e[35m Exit \e[0m";}
 INI(){ echo -en "\ec" ;stty sane;TXa;A; };INI
 while [[ "$l1" != " " ]]; do case $aa in
  0)D;echo -en "\e[45;30m"; (E0);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m sudo apt install nmcli\e[0m
";echo -en "\e[45;30m ENTER = main menu ";read;INI;fi;;
  1)D;echo -en "\e[45;30m"; (E1);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m
 nmcli [OPTIONS...  ]
 {help | general | networking | radio | connection | device | agent | monitor}
       [COMMAND     ]
       [ARGUMENTS...]
\e[0m";echo -en "\e[45;30m ENTER = main menu ";read;INI;fi;;
  2)D;echo -en "\e[45;30m"; (E2);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
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
";echo -en "\e[45;30m ENTER = main menu ";read;INI;fi;;
  3)D;echo -en "\e[45;30m"; (E3);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
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
";echo -en "\e[45;30m ENTER = main menu ";read;INI;fi;;
  4)D;echo -en "\e[45;30m"; (E4);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Имейте в виду, что nmcli локализован, и поэтому вывод зависит от вашей среды.
 Это важно понимать, особенно когда вы анализируете вывод.
 Вызовите nmcli как LC_ALL=C nmcli, чтобы убедиться, что языковой стандарт
 установлен на C при выполнении скрипта.
 Переменные: \e[34mLC_ALL\e[0m,\e[34m LC_MESSAGES\e[0m,\e[34m LANG\e[0m определяют категорию локали\e[34m LC_MESSAGES\e[0m
 (в указанном порядке), которая определяет язык, используемый nmcli для сообщений.
 Локаль C используется, если ни одна из этих переменных не установлена,
 и эта локаль использует сообщения на английском языке.
";echo -en "\e[45;30m ENTER = main menu ";read;INI;fi;;
  5)D;echo -en "\e[45;30m"; (E5);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 nmcli принимает сокращения, если они являются уникальным префиксом в наборе
 возможных параметров. По мере добавления новых опций эти сокращения не
 обязательно останутся уникальными. Поэтому для сценариев и долгосрочной
 совместимости настоятельно рекомендуется указывать полные имена опций.
";echo -en "\e[45;30m ENTER = main menu ";read;INI;fi;;
  6)D;echo -en "\e[45;30m"; (E6);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Вероятно, есть какие-то баги. Если вы обнаружите ошибку,
 сообщите об этом своему дистрибутиву или воспитателю по адресу:
\e[36m https://gitlab.freedesktop.org/NetworkManager/NetworkManager\e[0m
";echo -en "\e[45;30m ENTER = main menu ";read;INI;fi;;
  7)D;echo -en "\e[45;30m"; (E7);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "\e[32m
 nmcli-examples
 nm-settings-nmcli
 nm-online
 NetworkManager
 NetworkManager.conf
 nm-applet
 nm-connection-editor
 terminal-colors.d
\e[0m";echo -en "\e[45;30m ENTER = main menu ";read;INI;fi;;
  8)D;echo -en "\e[45;30m"; (E8);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
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
";echo -en "\e[45;30m ENTER = main menu ";read;INI;fi;;
  9)D;echo -en "\e[45;30m"; (E9);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;
sleep 0,020;echo -e "
\e[1;36m COLORS\e[0m";
sleep 0,020;echo -e " Неявная окраска может быть отключена пустым файлом
\e[32m /etc/terminal-colors.d/nmcli.disable\e[0m";
sleep 0,020;echo -e "\e[32m terminal-colors.d \e[0m      См. для получения более подробной информации о настройке
 раскрашивания. Логические имена цветов, поддерживаемые nmcli:";
sleep 0,020;echo -e "\e[32m connection-activated    \e[0m Соединение, которое активно.";
sleep 0,020;echo -e "\e[32m connection-activating   \e[0m Соединение, которое активируется.";
sleep 0,020;echo -e "\e[32m connection-disconnecting\e[0m Соединение, которое разрывается.";
sleep 0,020;echo -e "\e[32m connection-invisible    \e[0m Соединение, сведения о котором пользователю не разрешено
                          просматривать.";
sleep 0,020;echo -e "\e[32m connectivity-full       \e[0m Состояние подключения, когда Интернет доступен.";
sleep 0,020;echo -e "\e[32m connectivity-limited    \e[0m Состояние подключения, когда доступна только локальная
                          сеть.";
sleep 0,020;echo -e "\e[32m connectivity-none       \e[0m Состояние подключения, когда сеть отключена.";
sleep 0,020;echo -e "\e[32m connectivity-portal     \e[0m Состояние подключения, когда авторизованный портал
                          перехватил соединение.";
sleep 0,020;echo -e "\e[32m connectivity-unknown    \e[0m Состояние подключения, когда проверка подключения не
                          выполнялась.";
sleep 0,020;echo -e "\e[32m device-activated        \e[0m Подключенное устройство.";
sleep 0,020;echo -e "\e[32m device-activating       \e[0m Устройство, которое настраивается.";
sleep 0,020;echo -e "\e[32m device-disconnected     \e[0m Устройство, которое не подключено.";
sleep 0,020;echo -e "\e[32m device-firmware-missing \e[0m Предупреждение об отсутствующей прошивке устройства.";
sleep 0,020;echo -e "\e[32m device-plugin-missing   \e[0m Предупреждение об отсутствующем плагине устройства.";
sleep 0,020;echo -e "\e[32m device-unavailable      \e[0m Устройство, недоступное для активации.";
sleep 0,020;echo -e "\e[32m device-disabled         \e[0m Устройство отключено программным или аппаратным
                          аварийным выключателем.";
sleep 0,020;echo -e "\e[32m manager-running         \e[0m Обратите внимание, что демон NetworkManager доступен.";
sleep 0,020;echo -e "\e[32m manager-starting        \e[0m Обратите внимание, что демон NetworkManager изначально
                          подключен.";
sleep 0,020;echo -e "\e[32m manager-stopped         \e[0m Обратите внимание, что демон NetworkManager недоступен.";
sleep 0,020;echo -e "\e[32m permission-auth         \e[0m Действие, требующее аутентификации пользователя для
                          получения разрешения.";
sleep 0,020;echo -e "\e[32m permission-no           \e[0m Действие, которое не разрешено.";
sleep 0,020;echo -e "\e[32m permission-yes          \e[0m Действие, которое разрешено.";
sleep 0,020;echo -e "\e[32m prompt                  \e[0m Подскажите в интерактивном режиме.";
sleep 0,020;echo -e "\e[32m state-asleep            \e[0m Индикация того, что NetworkManager находится в
                          приостановленном состоянии.";
sleep 0,020;echo -e "\e[32m state-connected-global  \e[0m Индикация того, что NetworkManager подключен к Интернету";
sleep 0,020;echo -e "\e[32m state-connected-local   \e[0m Указание на то, что NetworkManager в локальной сети.";
sleep 0,020;echo -e "\e[32m state-connected-site    \e[0m Индикация того, что NetworkManager подключен к сетям,
                          отличным от Интернета.";
sleep 0,020;echo -e "\e[32m state-connecting        \e[0m Индикация того, что NetworkManager устанавливает сетевое
                          соединение.";
sleep 0,020;echo -e "\e[32m state-disconnected      \e[0m Индикация того, что NetworkManager отключен от сети.";
sleep 0,020;echo -e "\e[32m state-disconnecting     \e[0m Индикация того, что NetworkManager отключается от сети.";
sleep 0,020;echo -e "\e[32m wifi-signal-excellent   \e[0m Сеть Wi-Fi с отличным уровнем сигнала.";
sleep 0,020;echo -e "\e[32m wifi-signal-fair        \e[0m Сеть Wi-Fi со средним уровнем сигнала.";
sleep 0,020;echo -e "\e[32m wifi-signal-good        \e[0m Wi-Fi сеть с хорошим уровнем сигнала.";
sleep 0,020;echo -e "\e[32m wifi-signal-poor        \e[0m Сеть Wi-Fi с плохим уровнем сигнала.";
sleep 0,020;echo -e "\e[32m wifi-signal-unknown     \e[0m Невидимая сеть Wi-Fi (скрытая точка доступа).";
sleep 0,020;echo -e "\e[31m disabled                \e[0m Отключенное свойство.";
sleep 0,020;echo -e "\e[32m enabled                 \e[0m Свойство, которое включено.";
echo -en "\e[45;30m ENTER = main menu ";read;INI;fi;;
 10)D;echo -en "\e[45;30m";(E10);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
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
";echo -en "\e[45;30m ENTER = main menu ";read;INI;fi;;
 11)D;echo -en "\e[45;30m";(E11);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m nmcli monitor\e[0m Наблюдайте за активностью NetworkManager.
 Отслеживает изменения состояния подключения, устройств или профилей подключения.
 См. также монитор соединений nmcli и монитор устройств nmcli, чтобы следить за
 изменениями в определенных устройствах или соединениях.
";echo -en "\e[45;30m ENTER = main menu ";read;INI;fi;;
 12)D;echo -en "\e[45;30m";(E12);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;fNmcliOptions;echo -en "\e[45;30m ENTER = main menu ";read;INI;fi;;
 13)D;echo -en "\e[45;30m";(E13);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;fGeneralCommands;echo -en "\e[45;30m ENTER = main menu ";read;INI;fi;;
 14)D;echo -en "\e[45;30m";(E14);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;fNetworkingControlCommands;echo -en "\e[45;30m ENTER = main menu ";read;INI;fi;;
 15)D;echo -en "\e[45;30m";(E15);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
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
";echo -en "\e[45;30m ENTER = main menu ";read;INI;fi;;
 16)D;echo -en "\e[45;30m";(E16);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;fConnectionManagementCommands;echo -en "\e[45;30m ENTER = main menu ";read;INI;fi;;
 17)D;echo -en "\e[45;30m";(E17);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;fDeviceManagementCommands;echo -en "\e[45;30m ENTER = main menu ";read;INI;fi;;
 18)D;echo -en "\e[45;30m";(E18);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Псевдографический интерфейс на Whiptail \e[32m nmtui \e[0m
 Подключение Wifi в Ubuntu из терминала с помощью nmtui
 nmtui – это сокращение от Network Manager Text User Interface в Linux. Его
 можно использовать для управления беспроводными сетями на вашей поверхности.
 Инструменты nmtui работают по методу полуCLI. В этом методе необходимо
 использовать командную строку на базе терминала, но для выбора и управления
 инструментом также требуется указатель курсора.
 Шаг 1: Исполнительный пользовательский интерфейс Network Manager
 В этом методе мы рассмотрим, как подключить Wifi в Linux из терминала с помощью
 nmtui. Сначала вам нужно набрать nmtui в оболочке терминала, чтобы запустить
 инструмент текстового пользовательского интерфейса Network Manager в вашей
 системе.
 nmtui
 Команда покажет вам выпадающее меню для выбора настроек сети. В меню выберите
 пункт ‘Подключиться’, чтобы выбрать SSID с терминала.
 Шаг 2: Выберите SSID WiFi
 На следующем шаге вы увидите список сетей Wifi (SSID), доступных вокруг вас, в
 оболочке терминала. Пожалуйста, используйте курсор мыши или клавиши со
 стрелками на клавиатуре, чтобы выбрать SSID, затем нажмите кнопку ввода, чтобы
 выбрать сеть.
 На следующем шаге оболочка терминала попросит вас ввести пароль SSID, чтобы ваш
 рабочий стол Linux мог подключиться к сети. Если ваш Wifi не имеет пароля, он
 не будет запрашивать пароль. Если все идет правильно, на экране появится
 сообщение о подключении и вскоре произойдет соединение.
";echo -en "\e[45;30m ENTER = main menu ";read;INI;fi;;
 19)D;echo -en "\e[45;30m";(E19);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Mo 28 Aug 2023 23:26:22 CEST
 mNmcli Описание утилиты nmcli на русском языке.
 Command-line tool for controlling NetworkManager.
 Asciinema:  \e[36m https://asciinema.org/a/608002\e[0m
 Github:     \e[36m \e[0m
 Codeberg:   \e[36m https://codeberg.org/Grannik/mNmcli\e[0m
 Gitlab:     \e[36m https://gitlab.com/grannik/mnmcli\e[0m
 Sourceforge:\e[36m https://sourceforge.net/p/mnmcli/code/ci/master/tree/\e[0m
 Notabug:    \e[36m https://notabug.org/Grannik/mNmcli\e[0m
 Bitbucket:  \e[36m https://bitbucket.org/grannikoleg/mnmcli/src/main/\e[0m
 Framagit:   \e[36m https://framagit.org/Grannik/mnmcli\e[0m
 GFogs:      \e[36m https://try.gogs.io/Grannik3/mNmcli\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 20)D;echo -en "\e[45;2m";(E20);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;exit 0;fi;;
esac;C;done
}
fNmcli

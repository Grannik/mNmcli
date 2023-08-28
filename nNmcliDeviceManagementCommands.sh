#!/bin/bash
source "sNmcli.sh"
# это цвет текста списка перед курсором при значении 0 в переменной  UNMARK(){ $e "\e[0m";}
 UNMARK(){ $e "\e[0m";}
 MARK(){ $e "\e[1;37m";}
#
 HEAD()
{
 for (( a=2; a<=41; a++ ))
  do
   TPUT $a 1
    $E "$na";
  done
   TPUT  1 1;$E "$nb";UNMARK;
   TPUT  2 2;$E "\e[1;36m DEVICE MANAGEMENT COMMANDS\e[0m                     \e[2m Команды управления устройством\e[0m";
   TPUT  3 2;$E "\e[2m Отображение сетевых интерфейсов и управление ими\e[0m";
   TPUT  4 1;$E "$nc";
   TPUT 18 1;$E "$nc";
   TPUT 20 2;$E "\e[2m Available options are:\e[0m";
   TPUT 28 1;$E "$nc";
   TPUT 30 2;$E "\e[2m На параметры точки доступа могут влиять дополнительные параметры:\e[0m";
   TPUT 37 1;$E "$nc";
#   TPUT 41 1;$E "$nd";
}
 FOOT(){ MARK;TPUT 42 1;$E "$ne";UNMARK;}
#
  M0(){ TPUT  5 3; $e "Kраткий обзор                                                      \e[32m Synopsis \e[0m";}
  M1(){ TPUT  6 3; $e "Распечатать статус устройств                                         \e[32m status \e[0m";}
  M2(){ TPUT  7 3; $e "Показать подробную информацию об устройствах                  \e[32m show [ifname] \e[0m";}
  M3(){ TPUT  8 3; $e "Задайте свойства\e[32m set[ifname] ifname[autoconnect {yes no}] [managed {yes no}] \e[0m";}
  M4(){ TPUT  9 3; $e "Подключите устройство                                             \e[32m up ifname \e[0m";}
  M5(){ TPUT 10 3; $e "Псевдоним для команды вверх                                  \e[32m connect ifname \e[0m";}
  M6(){ TPUT 11 3; $e "Попытка обновить устройство с изменениями                    \e[32m reapply ifname \e[0m";}
  M7(){ TPUT 12 3; $e "Измените настройки \e[32m modify ifname {option value [+|-]setting.property value} \e[0m";}
  M8(){ TPUT 13 3; $e "Отключите устройство и запретите устройству                  \e[32m down ifname... \e[0m";}
  M9(){ TPUT 14 3; $e "Псевдоним для команды вниз                             \e[32m disconnect ifname... \e[0m";}
 M10(){ TPUT 15 3; $e "Удалить устройство                                         \e[32m delete ifname... \e[0m";}
 M11(){ TPUT 16 3; $e "Следите за активностью устройства                       \e[32m monitor [ifname...] \e[0m";}
 M12(){ TPUT 17 3; $e "Список точек wifi \e[32m [list[--rescan|auto|no|yes] [ifname ifname][bssid BSSID]] \e[0m";}
 M13(){ TPUT 19 3; $e "Подключитесь к сети Wi-Fi, указанной SSID или BSSID            \e[32m wifi connect \e[0m";}
 M14(){ TPUT 21 3; $e "Пароль для защищенных сетей (WEP или WPA)                          \e[32m password \e[0m";}
 M15(){ TPUT 22 3; $e "тип секрета WEP, либо ключ для ключа ASCII/HEX                 \e[32m wep-key-type \e[0m";}
 M16(){ TPUT 23 3; $e "Интерфейс, который будет использоваться для активации                \e[32m ifname \e[0m";}
 M17(){ TPUT 24 3; $e "Если указано, созданное соединение будет ограничено только для BSSID  \e[32m bssid \e[0m";}
 M18(){ TPUT 25 3; $e "Если указано, соединение будет использовать это имя                    \e[32m name \e[0m";}
 M19(){ TPUT 26 3; $e "Cоединение будет видно только пользователю                          \e[32m private \e[0m";}
 M20(){ TPUT 27 3; $e "Установите значение «да» при первом подключении к точке доступа      \e[32m hidden \e[0m";}
 M21(){ TPUT 29 3; $e "Создайте точку доступа Wi-Fi                                    \e[32m wifi hotspot\e[0m";}
 M22(){ TPUT 31 3; $e "Какое устройство Wi-Fi используется                                  \e[32m ifname \e[0m";}
 M23(){ TPUT 32 3; $e "Имя созданного профиля подключения к точке доступа                 \e[32m con-name \e[0m";}
 M24(){ TPUT 33 3; $e "SSID точки доступа                                                     \e[32m ssid \e[0m";}
 M25(){ TPUT 34 3; $e "Диапазон Wi-Fi для использования                                       \e[32m band \e[0m";}
 M26(){ TPUT 35 3; $e "Канал Wi-Fi для использования                                       \e[32m channel \e[0m";}
 M27(){ TPUT 36 3; $e "Пароль для созданной точки доступа                                 \e[32m password \e[0m";}
 M28(){ TPUT 38 3; $e "Просканировать точки доступа     \e[32m wifi rescan [ifname ifname] [ssid SSID...] \e[0m";}
 M29(){ TPUT 39 3; $e "Показать информацию о активных сетях Wi-Fi\e[32m wifi show-password[ifname ifname] \e[0m";}
 M30(){ TPUT 40 3; $e "Отображение информации о соседних устройствах   \e[32m lldp [list [ifname ifname]] \e[0m";}
 M31(){ TPUT 41 3; $e "\e[32mExit                                                                         \e[0m";}
LM=31
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
 nmcli device
{
 status|show|set|up|connect|reapply|modify|down|disconnect|delete|monitor|wifi|lldp
}
 [ARGUMENTS...]
\e[0m";ES;fi;;
  1) S=M1;SC; if [[ $cur == enter ]];then R;echo -e "
 Это действие по умолчанию, если для устройства nmcli не указана команда.
 Команда:\e[32m nmcli device status\e[0m или\e[32m nmcli dev status\e[0m

 Ответ:
 -----------+------+-----------+-----------
 DEVICE     | TYPE | STATE     | CONNECTION
$(tput setaf 2) устройство | тип  | состояние | связь      $(tput sgr 0)

$(tput setaf 2)    connected $(tput sgr 0) | подключено
$(tput setaf 1) disconnected $(tput sgr 0) | не подключено
$(tput setaf 7)  unavailable $(tput sgr 0) | недоступен
$(tput setaf 7)    unmanaged $(tput sgr 0) | неуправляемый
";ES;fi;;
       15) S=M15;SC;if [[ $cur == enter ]];then R;echo " ";ES;fi;;
       16) S=M16;SC;if [[ $cur == enter ]];then R;echo "  ";ES;fi;;
       17) S=M17;SC;if [[ $cur == enter ]];then R;echo "
 В том числе и раздача со смартфона
 Команда:
 nmcli device wifi list
или
 nmcli dev wifi list

";ES;fi;;
  2) S=M2;SC; if [[ $cur == enter ]];then R;echo -e "
 Без пререканий проверяются все устройства:
\e[32m nmcli device show\e[0m или\e[32m nmcli dev show\e[0m

 Получить информацию о конкретном устройстве, необходимо указать имя интерфейса:
\e[32m nmcli device show имя_устройства\e[0m

 Выводит список доступных точек доступа Wi-Fi, известных NetworkManager:
\e[32m nmcli dev wifi\e[0m

 Покажет все доступные профили подключения для вашего интерфейса Wi-Fi wlp3s0:
\e[32m nmcli -f CONNECTIONS device show wlp3s0\e[0m
";ES;fi;;
  3) S=M3;SC; if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
  4) S=M4;SC; if [[ $cur == enter ]];then R;echo -e "
 Подключите устройство. NetworkManager попытается найти подходящее соединение,
 которое будет активировано. Также будут учитываться соединения, для которых не
 настроено автоматическое подключение. Если совместимого соединения не существует,
 будет создан и активирован новый профиль с настройками по умолчанию. Это отличает
 подключение nmcli ifname «\$DEVICE» от подключения nmcli «\$DEVICE». Если опция
 --wait не указана, время ожидания по умолчанию будет составлять 90 секунд.
";ES;fi;;
  5) S=M5;SC; if [[ $cur == enter ]];then R;echo -e "
 Псевдоним для команды вверх. До версии 1.34.0 не поддерживалась.
";ES;fi;;
  6) S=M6;SC; if [[ $cur == enter ]];then R;echo -e "
 Попытка обновить устройство с изменениями в текущем активном соединении,
 сделанными с момента его последнего применения:
";ES;fi;;
  7) S=M7;SC; if [[ $cur == enter ]];then R;echo -e "
 Измените настройки, которые в данный момент активны на устройстве.
 Эта команда позволяет вам вносить временные изменения в конфигурацию,
 активную на конкретном устройстве. Изменения не сохраняются в профиле подключения
 Смотрите nm-settings-nmcli для списка доступных свойств. Обратите внимание,
 что некоторые свойства нельзя изменить на уже подключенном устройстве.

 Временно добавляет IP-адрес устройству:
\e[32m nmcli dev modify em1 ipv6.address 2001:db8::a:bad:c0de\e[0m
 Адрес будет удален, когда то же соединение будет активировано снова.
";ES;fi;;
  8) S=M8;SC; if [[ $cur == enter ]];then R;echo -e "
 Отключите устройство и запретите устройству автоматически активировать дальнейшие
 соединения без вмешательства пользователя/ручного вмешательства. Обратите
 внимание, что отключение программных устройств может означать, что устройства
 исчезнут.
 Если опция --wait не указана, таймаут по умолчанию будет составлять 10 секунд.
";ES;fi;;
  9) S=M9;SC; if [[ $cur == enter ]];then R;echo -e "
 Псевдоним для команды вниз. До версии 1.34.0 не поддерживалась.
";ES;fi;;
 10) S=M10;SC;if [[ $cur == enter ]];then R;echo -e "
 Команда удаляет интерфейс из системы. Обратите внимание, что это работает
 только для программных устройств, таких как связи, мосты, команды и т. д.
 Аппаратные устройства (например, Ethernet) не могут быть удалены командой.
 Если параметр --wait не указан, время ожидания по умолчанию будет равно 10 сек.
";ES;fi;;
 11) S=M11;SC;if [[ $cur == enter ]];then R;echo -e "
 Эта команда печатает строку всякий раз, когда указанные устройства изменяют
 состояние. Контролирует все устройства, если интерфейс не указан. Монитор
 прекращает работу, когда все указанные устройства исчезают. Если вы хотите
 отслеживать добавление устройств, рассмотрите возможность использования
 глобального монитора с командой:\e[32m nmcli monitor\e[0m
";ES;fi;;
 12) S=M12;SC;if [[ $cur == enter ]];then R;echo -e "
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
";ES;fi;;
 13) S=M13;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m
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

 Команда с паролем:\e[32m sudo nmcli dev wifi connect имя_сети password \"пароль\"\e[0m
                        \e[32m nmcli dev wifi con имя_сети password \"пароль\"\e[0m

 В качестве альтернативы можно использовать параметр –ask:
\e[32m sudo nmcli --ask dev wifi connect имя_сети\e[0m
 Теперь система попросит вас ввести сетевой пароль, не делая его видимым.
 Если у вас есть защита WEP или WPA на вашем WI-Fi, вы также можете указать сетевой
 пароль в команде:
\e[32m sudo nmcli dev wifi connect network-ssid password network-password\e[0m
 Можно к смарфону подключиться.
";ES;fi;;
 14) S=M14;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
 15) S=M15;SC;if [[ $cur == enter ]];then R;echo -e "
 wep-key-type
 тип секрета WEP, либо ключ для ключа ASCII/HEX, либо фраза для фразы-пароля.
";ES;fi;;
 16) S=M16;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
 17) S=M17;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
 18) S=M18;SC;if [[ $cur == enter ]];then R;echo -e "
 name если указано, соединение будет использовать это имя
 (иначе NM сам создаст имя).
";ES;fi;;
 19) S=M19;SC;if [[ $cur == enter ]];then R;echo -e "
 private если установлено значение «да», соединение будет видно только
 пользователю, который его создал. В противном случае соединение является
 общесистемным, что является значением по умолчанию.
";ES;fi;;
 20) S=M20;SC;if [[ $cur == enter ]];then R;echo -e "
 hidden установите значение «да» при первом подключении к точке доступа,
 не передающей свой SSID. В противном случае SSID не будет найден и попытка
 подключения завершится неудачно.
";ES;fi;;
 21) S=M21;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m
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
";ES;fi;;
 22) S=M22;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
 23) S=M23;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
 24) S=M24;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
 25) S=M25;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
 26) S=M26;SC;if [[ $cur == enter ]];then R;echo -e "\e[32m \e[0m";ES;fi;;
 27) S=M27;SC;if [[ $cur == enter ]];then R;echo -e "
 password пароль для созданной точки доступа. Если он не указан, nmcli сгенерирует
 пароль. Пароль представляет собой либо общий ключ WPA, либо ключ WEP.
 Обратите внимание, что глобальную опцию --show-secrets можно использовать для
 печати пароля точки доступа. Это особенно полезно, когда пароль был сгенерирован.

 Cоздает профиль точки доступа и подключает его:
\e[32m nmcli -s dev wifi hotspot con-name QuickHotspot\e[0m
 Печатает пароль точки доступа, который пользователь должен использовать
 для подключения к точке доступа с других устройств.
";ES;fi;;
 28) S=M28;SC;if [[ $cur == enter ]];then R;echo -e "
 Запросите, чтобы NetworkManager немедленно повторно просканировал доступные точки
 доступа:
 NetworkManager периодически сканирует сети Wi-Fi, но в некоторых случаях бывает
 полезно запустить сканирование вручную (например, после возобновления работы
 компьютера). Используя ssid, можно сканировать определенный SSID, что полезно для
 точек доступа со скрытыми SSID. Вы можете указать несколько параметров ssid, чтобы
 сканировать больше SSID. Эта команда не показывает точки доступа, для этого
 используйте:\e[32m nmcli device wifi list\e[m
";ES;fi;;
 29) S=M29;SC;if [[ $cur == enter ]];then R;echo -e "
 Показать подробную информацию об активных сетях Wi-Fi, включая секреты:
";ES;fi;;
 30) S=M30;SC;if [[ $cur == enter ]];then R;echo -e "
 Отображение информации о соседних устройствах:
 полученной с помощью протокола обнаружения канального уровня (LLDP).
 Опцию ifname можно использовать для вывода списка соседей только для данного
 интерфейса. Протокол должен быть включен в настройках подключения.
";ES;fi;;
 31) S=M31;SC;if [[ $cur == enter ]];then R;exit 0;fi;;
 esac;POS;done

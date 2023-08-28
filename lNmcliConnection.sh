#!/bin/bash
clear
sleep 0,020;echo -e "
\e[36m Create a new connection using specified properties\e[0m"
sleep 0,020;echo -e "\e[90m Создайте новое соединение, используя указанные свойства\e[0m
"
sleep 0,020;echo -e "\e[32m add [save {yes | no}] {option value | [+|-]setting.property value}...\e[0m
"
sleep 0,020;echo "   Вам необходимо описать вновь созданные соединения с парами свойств и значений.
 Полный справочник смотрите в nm-settings-nmcli.
 Синтаксис такой же, как у команды изменения соединения nmcli.
   Чтобы построить значимое соединение, вам как минимум нужно установить свойство
 connection.type (или использовать псевдоним типа)
 для одного из известных типов соединения NetworkManager:
"
sleep 0,020;echo -e "\e[32m 6lowpan         \e[0m"
sleep 0,020;echo -e "\e[32m 802-11-olpc-mesh\e[0m псевдоним olpc-mesh"
sleep 0,020;echo -e "\e[32m 802-11-wireless \e[0m псевдоним wifi"
sleep 0,020;echo -e "\e[32m 802-3-ethernet  \e[0m псевдоним ethernet"
sleep 0,020;echo -e "\e[32m adsl            \e[0m"
sleep 0,020;echo -e "\e[32m bluetooth       \e[0m"
sleep 0,020;echo -e "\e[32m bond            \e[0m"
sleep 0,020;echo -e "\e[32m bond-slave      \e[0m устарело для Ethernet с мастером"
sleep 0,020;echo -e "\e[32m bridge          \e[0m"
sleep 0,020;echo -e "\e[32m bridge-slave    \e[0m устарело для Ethernet с мастером"
sleep 0,020;echo -e "\e[32m cdma            \e[0m"
sleep 0,020;echo -e "\e[32m dummy           \e[0m"
sleep 0,020;echo -e "\e[32m generic         \e[0m"
sleep 0,020;echo -e "\e[32m gsm             \e[0m"
sleep 0,020;echo -e "\e[32m infiniband      \e[0m"
sleep 0,020;echo -e "\e[32m ip-tunnel       \e[0m"
sleep 0,020;echo -e "\e[32m macsec          \e[0m"
sleep 0,020;echo -e "\e[32m macvlan         \e[0m"
sleep 0,020;echo -e "\e[32m olpc-mesh       \e[0m"
sleep 0,020;echo -e "\e[32m ovs-bridge      \e[0m"
sleep 0,020;echo -e "\e[32m ovs-dpdk        \e[0m"
sleep 0,020;echo -e "\e[32m ovs-interface   \e[0m"
sleep 0,020;echo -e "\e[32m ovs-patch       \e[0m"
sleep 0,020;echo -e "\e[32m ovs-port        \e[0m"
sleep 0,020;echo -e "\e[32m pppoe           \e[0m"
sleep 0,020;echo -e "\e[32m team            \e[0m"
sleep 0,020;echo -e "\e[32m team-slave      \e[0m устарело для Ethernet с мастером"
sleep 0,020;echo -e "\e[32m tun             \e[0m"
sleep 0,020;echo -e "\e[32m veth            \e[0m"
sleep 0,020;echo -e "\e[32m vlan            \e[0m"
sleep 0,020;echo -e "\e[32m vpn             \e[0m"
sleep 0,020;echo -e "\e[32m vrf             \e[0m"
sleep 0,020;echo -e "\e[32m vxlan           \e[0m"
sleep 0,020;echo -e "\e[32m wifi-p2p        \e[0m"
sleep 0,020;echo -e "\e[32m wimax           \e[0m"
sleep 0,020;echo -e "\e[32m wireguard       \e[0m"
sleep 0,020;echo "
 Наиболее типичные варианты использования описаны в разделе ПРИМЕРЫ.
"
sleep 0,020;echo " Помимо свойств и значений принимаются две специальные опции:"
sleep 0,020;echo -e "\e[32m save\e[0m Определяет, должно ли соединение быть постоянным,
      т. е. NetworkManager должен хранить его на диске (по умолчанию: да)."
sleep 0,020;echo -e "\e[32m --  \e[0m Если встречается один аргумент --, он игнорируется.
      Это сделано для совместимости со старыми версиями nmcli.
"


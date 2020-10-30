echo "======================================================================="
echo "==                      System Information                           =="
echo "======================================================================="
    
    echo -e "\e[44m>>>>> CPU <<<<<\e[0m"
    cat /proc/cpuinfo | grep -m1 'model name'
    echo -e ""
		
    echo -e "\e[44m>>>>> RAM <<<<<\e[0m"
		free | grep -m1 'Mem'
		echo -e ""
		
    echo -e "\e[44m>>>>> GPU <<<<<\e[0m"
		lspci -v | grep 'VGA'
		echo -e ""
		
    echo -e "\e[44m>>>> System <<<\e[0m"
		echo sudo grep | dmidecode | grep -A3 '^System Information'
		echo -e ""
		
    echo -e "\e[44m>>>> Disks <<<<\e[0m"
		echo sudo grep | lsblk -o SIZE,TYPE,KNAME | grep disk
		echo -e ""
		
    echo -e "\e[44m>>>> Release <<<<\e[0m"
		echo sudo grep | lsb_release -a
		echo -e ""
		
    echo -e "\e[44m>>>> Storage <<<<\e[0m"
		echo sudo grep | mount | grep storage
		echo -e ""

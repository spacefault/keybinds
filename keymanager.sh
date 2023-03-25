#!/bin/bash


echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "\033[1mkeybind manager\033[0m"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "\033[1ma ninetyninebytes project!\033[0m"
echo "built on 25-03-2023"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "welcome to the keybind manager! this application lets you import and export your keybinds from and to GNOME shell."
echo "Please choose an option"
echo
echo "(I)mport keybinds from existing keybinds.conf file"
echo "(E)xport current system keybinds [warning! removes existing keybinds.conf file]"
echo "(Q)uit the application"
echo

while true; do
    read -p "Your Selection: " ieq
    case $ieq in
        [Ii]* )
            dconf load /org/gnome/desktop/wm/keybindings/ < keybinds.conf
            break ;;
        [Ee]* )
            rm keybinds.conf
            dconf dump /org/gnome/desktop/wm/keybindings/ > keybinds.conf
            echo "file exported."
            echo location:
            pwd
            break ;;
        [Qq]* )
            echo "program quit.";
            exit;;
        * ) echo "Please choose a valid selection";;
    esac
done

echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo -e "\033[1msuccess!\033[0m"
echo "the operation was successful. thanks for using this script!"
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
exit 0

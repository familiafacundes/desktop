echo "                   $(tput setaf 4)^                      ______________           ________         ___             ___
$(tput setaf 14)Arch Linux        $(tput setaf 4)/$(tput setaf 14)#$(tput setaf 4)\                    /##############\         /########\       |###|           |###|
                 $(tput setaf 4)/$(tput setaf 14)###$(tput setaf 4)\                  /################\      /############\     |###|           |###|
                $(tput setaf 4)/$(tput setaf 14)#####$(tput setaf 4)\                |##################|    /##############\    |###|           |###|
               $(tput setaf 4)/$(tput setaf 14)#######$(tput setaf 4)\               |####           ###|   /#####/     |####|   |###|           |###|
              $(tput setaf 4)/$(tput setaf 14)#########$(tput setaf 4)\              |####           ###|  /#####/               |###|           |###|
             $(tput setaf 4)/$(tput setaf 14)###########$(tput setaf 4)\             |####           ###/  |####/                |###|           |###|
            $(tput setaf 4)/$(tput setaf 14)#############$(tput setaf 4)\            |#################/   |###|                 |###|           |###|
           $(tput setaf 4)/$(tput setaf 14)###############$(tput setaf 4)\           |################/    |###|                 |###|___________|###|
          $(tput setaf 4)/$(tput setaf 14)#################$(tput setaf 4)\          |###########          |###|                 |###################|
         $(tput setaf 4)/$(tput setaf 14)######$(tput setaf 24)#######$(tput setaf 14)######$(tput setaf 4)\         |###########\         |###|                 |###################|
        $(tput setaf 4)/$(tput setaf 24)########     ########$(tput setaf 4)\        |####    ####\        |###|                 |###|           |###|
       $(tput setaf 4)/$(tput setaf 24)########       ########$(tput setaf 4)\       |####     ####\       |###|                 |###|           |###|
      $(tput setaf 4)/$(tput setaf 24)########         ########$(tput setaf 4)\      |####      ####\      |####\                |###|           |###|
     $(tput setaf 4)/$(tput setaf 24)#########         #########$(tput setaf 4)\     |####       ####\     |#####\               |###|           |###|
    $(tput setaf 4)/$(tput setaf 24)##########         ##########$(tput setaf 4)\    |####        ####\     \#####\     |####|   |###|           |###|
   $(tput setaf 4)/$(tput setaf 24)######                   ######$(tput setaf 4)\   |####         ####\     \##############/    |###|           |###|
  $(tput setaf 4)/$(tput setaf 24)##                             ##$(tput setaf 4)\  |####          ####\     \############/     |###|           |###|
 $(tput setaf 4)/$(tput setaf 24)#                                 #$(tput setaf 4)\ |####           ####\      \########/       |###|           |###|  "

echo
echo $(tput setaf 190)OS:
tput setaf 82
toilet -f term --gay $(uname -o)
echo
echo $(tput setaf 190)Kernel:;
tput setaf 82 #47
uname -rm
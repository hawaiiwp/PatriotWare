#!/bin/bash

#
## giving executable permissions to the scripts
#

chmod +x individual_scripts/EXTERMINATE.sh
chmod +x individual_scripts/deleteFiles.sh
chmod +x individual_scripts/passReq.sh
chmod +x individual_scripts/admin.sh
chmod +x individual_scripts/services.sh
chmod +x individual_scripts/packages.sh
chmod +x individual_scripts/passwords.sh
chmod +x individual_scripts/apt.sh
chmod +x individual_scripts/missingUsers.sh
chmod +x individual_scripts/cron.sh
#
## making the necessary files and directories to pass around information, read information from, and write information to.
#

touch data_files/adminWhitelist.txt
touch data_files/sudoers.txt
touch data_files/admins.txt
touch data_files/isUser.txt
touch data_files/users.txt
touch data_files/users2.txt
touch data_files/goodUsers.txt
touch data_files/goodUsers2.txt
touch data_files/badUsers.txt
touch data_files/foundFiles.txt
touch data_files/services.txt
touch data_files/services2.txt
touch data_files/servicesWhitelist2.txt
touch data_files/badServices.txt
touch data_files/sourcelist.txt
touch data_files/sources.txt
touch data_files/missingUsers.txt
touch data_files/uid.txt
touch data_files/uid2.txt
touch data_files/crontabs.txt
touch data_files/cronjobs.txt
mkdir rawCronJobs

#
## installing necessary tools
#

apt-get install net-tools -y > /dev/null

#
## making a fancy littl ascii art
#

echo "
        _____           _  ___  ___          _               
       |  __ \         | | |  \/  |         | |              
       | |  \/ ___   __| | | .  . | ___   __| | ___          
       | | __ / _ \ / _| | | |\/| |/ _ \ / _| |/ _ \         
       | |_\ | (_) | (_| | | |  | | (_) | (_| |  __/         
        \____/\___/ \__,_| \_|  |_/\___/ \__,_|\___|         
                                                             
                                                             
  __ __          __      __            __                    __  
 / / | |         | |    / _|           | (_)                 \ \ 
| |  | |__  _   _| |_  | |_ ___  _ __  | |_ _ __  _   ___  _  | |
| |  | |_ \| | | | __| |  _/ _ \| '__| | | | '_ \| | | \ \/ / | |
| |  | |_) | |_| | |_  | || (_) | |    | | | | | | |_| |>  <  | |
| |  |_.__/ \__,_|\__| |_| \___/|_|    |_|_|_| |_|\__,_/_/\_\ | |
 \_\                                                         /_/ 
                                                             "

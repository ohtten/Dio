#!/bin/bash
#
# infrastructure.sh - infrastructure as code
#
# Site        : Dio https://web.dio.me/
# Course      : Linux Experience
# Instructor  : Denilson Bonatti
# Author      : Alexandre Rodrigues Nettho <ohtten@gmail.com>
#
#
# Version History
# v1.0 2022, Alexandre Rodrigues Nettho
# -------------------------------------------------------------

# Creating Directories

# First storing in array
directories=("/public" "/adm" "/ven" "/sec")

for directory in "${directories[@]}"
do

# Checks if the directories exist. If they exist, they are deleted and creating again.
    echo "Checks if the directories exist."
    if [ ! -d "$directory" ];
        then
            sudo mkdir /$directory
            echo "$directory Directory Created Sucessfully."   
    else
        sudo rm -rf $directory
        sudo mkdir /$directory
        echo "The Directory $directory Exists. Deleting and creating a new directory. Directory Created Sucessfully."
        
        
    fi
done

# Creating Groups

# First storing in array
groups=("GRP_ADM" "GRP_VEN" "GRP_SEC")

for group in "${groups[@]}"
do

# Checks if the group exist. If they exist, they are deleted and creating again.
    echo "Checks if the group exist."
    if compgen -g | grep $group;
        then
           echo "$group found, it will be deleted and recreated."
            sudo groupdel $group    
            sudo groupadd $group
            
            
    else
        echo "$group Not Exists."
        sudo groupadd $group
        echo "$group Created Sucessfully."
    fi
done

# Creating users

# First storing in array
users=("carlos" "maria" "joao" "debora" "sebastiana" "roberto" "josefina" "amanda" "rogerio")

for user in "${users[@]}"
do

# Checks if the user exist. If they exist, they are deleted and creating again.
    echo "Checks if the user exist."
    if id -u "$user" > /dev/null 2>&1;
        then
            echo "$user found, it will be deleted and recreated."    
            sudo userdel -r -f $user
            sudo useradd $user -m -c "$user" -s /bin/bash
            
    else
        sudo useradd $user -m -c "$user" -s /bin/bash
        echo "User $user does not exist, it was created successfully"
                
    fi
done

# Add users to their respective groups

ADM=("carlos" "maria" "joao")
VEN=("debora" "sebastiana" "roberto")
SEC=("josefina" "amanda" "rogerio")

for adm in "${ADM[@]}"
do
    sudo gpasswd -a $adm GRP_ADM
   
done

for ven in "${VEN[@]}"
do
    sudo gpasswd -a $ven GRP_VEN
   
done

for sec in "${SEC[@]}"
do
    sudo gpasswd -a $sec GRP_SEC
   
done

# Add groups to their respective directories

sudo chgrp -R GRP_ADM /adm
sudo chgrp -R GRP_VEN /ven
sudo chgrp -R GRP_SEC /sec


# Define permissions in directories

sudo chmod 777 /public
sudo chmod 770 /adm
sudo chmod 770 /ven
sudo chmod 770 /sec


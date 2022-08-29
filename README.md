# minecraft-server-termux

use termux on your phone to run a django server with custom url.

NOTES :
does not require root
does not use a virtual machine inside termux
does not require a domain
does not require payment

## Overall steps

0. settings up your phone ip as static.
1. setup your ssh to connect from your laptop for easy copy paste (optional).
2. Get termux to run on phone boot (optional).
3. installing django
4. setting up network permitios
5. installing local tunnel for outside lan connection

## step 0

### in your device

settings > connections > wifi > press on your wifi > advanced > ip settings > set to static

### note

copy your ip to use it later ex: 192.168.1.105

## step 1

1. change your account password:

    ``` shell
    passwd
    ```

2. run this in termux

    ``` shell
    pkg upgrade
    pkg install openssh
    ssh-keygen
    ```

3. press enter 3 times

4. get your username

    ``` shell
    whoami
    ```

    ex output : u0_a166

5. ssh command syntax (you need to be on the same network)

### Notes

  run this command on your laptop, not termux.
  replace u0_a166 with the output from last step
  replace the ip with your ip from step 0

  ``` shell
  ssh u0_a166@192.168.1.105  -p8022
  ```

## step 2

1. Install the Termux:Boot app.

2. Go to Android settings and turn off battery optimizations for Termux and Termux:Boot applications.

3. Start the Termux:Boot app once by clicking on its launcher icon. This allows the app to be run at boot.

4. Create the ~/.termux/boot/ directory (we will add scripts later)

    ``` shell
    mkdir ~/.termux/boot/
    cd ~/.termux/boot/
    ```

5. if you have setup ssh :  (inside the boot directory)

    ``` shell
    wget -O 1-runsshd.sh https://raw.githubusercontent.com/virous360/minecraft-server-termux/main/1-runsshd.sh 
    ```

6. setup server start on boot for later (change testsite to the folder name and my website to your website subdomain you choose):

    ``` shell
    wget -O 2-rundjango.sh  https://raw.githubusercontent.com/virous360/django-server-termux/main/run-django.sh
    ```

## Step 3

1. create a folder to host your server in (change testsite to whatever you want) :

    ```shell
    cd ~
    mkdir django-server
    cd django-server/
    apt-get update && apt-get -y upgrade
    apt-get install python3
    django-admin startproject testsite
    cd testsite/
    cd testsite/
    ```

### info

Let’s go over what each of these files are:

1. \__init__.py acts as the entry point for your Python project.
2. settings.py describes the configuration of your Django installation and lets Django know which settings are available.
3. urls.py contains a urlpatterns list, that routes and maps URLs to their views.
4. wsgi.py contains the configuration for the Web Server Gateway Interface. The Web Server Gateway Interface (WSGI) is the Python platform standard for the deployment of web servers and applications.

## step 4

1. modify the settings file

    ``` shell
    nano settings.py
    ```

2. change ALLOWED_HOSTS to look like this (replacing mywebsite with your custom subdomain)

    ``` shell
    ALLOWED_HOSTS = ['mywebsite.loca.lt', 'localhost']
    ```

3. press ctrl-s ctrl-x to exit nano then do this (replacing testsite to the folder name and my website to your website subdomain)

    ``` shell
    cd ~
    wget -O run-django.sh https://raw.githubusercontent.com/virous360/django-server-termux/main/run-django.sh
    chmod +x run-django.sh
    ```

## step 5

1. install localtunnel

    ``` shell
    pkg install nodejs -y
    npm install -g localtunnel
    cd /data/data/com.termux/files/usr/lib/node_modules/localtunnel/node_modules/openurl/
    nano openurl.js
    ```

2. change the file by adding this under linux :

    ```shell
    ...
    case 'linux':
        command = 'xdg-open';
        break;
    case 'android':
        command = 'termux';
        break;
    default:
    ...
    ```

3. press ctrl-s ctrl-x then cd ~

## done

you can now start your server using :

``` shell
./run-django.sh
```

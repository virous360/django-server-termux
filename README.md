# minecraft-server-termux

use termux on your phone to run a django server with custom url.

NOTES :
does not require root
does not use a virtual machine inside termux

## Overall steps

0. settings up your phone ip as static.
1. setup your ssh to connect from your laptop for easy copy paste (optional).
2. Get termux to run on phone boot (optional).

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

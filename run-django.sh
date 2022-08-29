#!/data/data/com.termux/files/usr/bin/sh
termux-wake-lock
cd ~/django-server/testsite
lt -p 8000 -s mywebsite &
python manage.py runserver localhost:8000 
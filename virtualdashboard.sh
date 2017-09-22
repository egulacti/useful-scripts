# create virtual display
Xvfb :0 -screen 0 1900x1050x16 & disown

# start VNC server
export DISPLAY=":0"
x11vnc -rfbport 5900 -rfbauth /tmp/vncpass -display :0 -forever -auth /tmp/xvfb.auth -bg

# start window manager
export DISPLAY=":0"
openbox-session & disown

export DISPLAY=":0"
firefox lapisserver.logo.com.tr/siteshow/siteshow1.html & disown

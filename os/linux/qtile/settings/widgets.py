from libqtile import widget
from .theme import colors
import requests
import os


def base(fg='text', bg='dark'):
    return {
        'foreground': colors[fg],
        'background': colors[bg]
    }


def getInterface():
    # For network Widget
    # Get the network interfaces
    interfaces = os.listdir('/sys/class/net')
    # Remove the loopback interface
    interfaces.remove('lo')
    # If there is only one interface, use it
    upinterface = interfaces[0]
    # If there are multiple interfaces, use the one that is not a virtual interface
    if len(interfaces) > 1:
        for interface in interfaces:
            # get status of interface
            status = os.popen('cat /sys/class/net/' +
                              interface + '/operstate').read()
            # if status is down, remove it from the list
            if status == 'down':
                interfaces.remove(interface)
            # if status is up, check if it is a virtual interface
            elif status == 'up':
                # get the device type
                device_type = os.popen(
                    'cat /sys/class/net/' + interface + '/device/type').read()
                # if device type is 1, it is a virtual interface
                if device_type == '1':
                    interfaces.remove(interface)

        # if there is only one interface left, use it
        if len(interfaces) >= 1:
            return interfaces[0]
        
        # if there are multiple interfaces left, use the first one
        else:
            return null


def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)


def icon(fg='text', bg='dark', fontsize=16, text="?"):
    return widget.TextBox(
        **base(fg, bg),
        fontsize=fontsize,
        text=text,
        padding=3
    )

def GetWeather(fg='text', bg='dark'):
     url = 'https://wttr.in/?format=3'
     response = requests.get(url)
     # If response is not 200, return error message
     if response.status_code != 200:
         return "Error al obtener el clima"
     # If response is 200, return the weather
     # Delete second line of response which is white space
     response = response.text.splitlines()[0]
     # Split response into city and weather
     # City is the first part of the response before the comma
     city = response.split(',')[0]
     # Weather is the second part of the response after the :
     weather = response.split(':')[1]
     return city + " " + weather

def WeatherWidget():
    try:
        return powerline('color4', 'dark') + icon(bg="color4", text=GetWeather()) + powerline('color3', 'color4')
    except:
        return ""

def powerline(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg),
        text="",  # Icon: nf-oct-triangle_left
        fontsize=37,
        padding=-5
    )


def workspaces():
    return [
        widget.GroupBox(
            **base(fg='light'),
            disable_drag=True,
            fontsize=16,
            center_aligned=True,
            margin=5,
            padding=20,
            
             borderwidth=3,
             active=colors['active'],
             inactive=colors['inactive'],
             highlight_method='block',
             urgent_alert_method='block',
             urgent_border=colors['urgent'],
             this_current_screen_border=colors['focus'],
             this_screen_border=colors['grey'],
             other_current_screen_border=colors['dark'],
             other_screen_border=colors['dark'],
        ),
        widget.WindowName(**base(fg='focus'), fontsize=14, padding=5),
    ]



primary_widgets = [
    *workspaces(),
    separator(),
    powerline('color3', 'dark'),
    icon(bg="color3", fontsize=17, text=' '),  # Icon: nf-fa-download
    widget.Net(**base(bg='color3'), interface=getInterface(),format='{down} ↓↑ {up}'),
    powerline('color2', 'color3'),
    widget.CurrentLayoutIcon(**base(bg='color2'), scale=0.65),
    widget.CurrentLayout(**base(bg='color2'), padding=5),
    powerline('color1', 'color2'),
    icon(bg="color1", fontsize=17, text=' '),  # Icon: nf-mdi-calendar_clock
    widget.Clock(**base(bg='color1'), format='%d/%m/%y - %H:%M '),
    powerline('dark', 'color1'),
    widget.Systray(background=colors['dark'], padding=5),
]

secondary_widgets = [
    *workspaces(),
    separator(),
    powerline('color1', 'dark'),
    widget.CurrentLayoutIcon(**base(bg='color1'), scale=0.65),
    widget.CurrentLayout(**base(bg='color1'), padding=5),
    powerline('color2', 'color1'),
    widget.Clock(**base(bg='color2'), format='%d/%m/%Y - %H:%M '),
    powerline('dark', 'color2'),
]

widget_defaults = {
    'font': 'CaskaydiaCove NF',
    'fontsize': 14,
    'padding': 1,
}
extension_defaults = widget_defaults.copy()

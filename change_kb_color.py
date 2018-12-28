#!/usr/bin/python3

from i3ipc import Connection
import xml.etree.ElementTree as ET
import os


CONFIG_LOCATION = '~/.config/clevo_fx/apps.xml'
SYS_DEVICE_LOCATION = '/sys/devices/platform/clevo_xsm_wmi/kb_color'

def get_xml_tree():
    absolute_path = os.path.expanduser(CONFIG_LOCATION)
    tree = ET.parse(absolute_path)
    root = tree.getroot()
    return root

def change_kb_color(colors):
    with open(SYS_DEVICE_LOCATION, 'w') as f:
        f.write(colors)

def detect_and_change(i3, event):
    window_name = event.container.window_class
    tree = get_xml_tree()
    default_conf = 'red green blue'
    current_conf = ''
    # print(window_name)
    for child in tree:
        for children in child:
            if child.tag == 'application':
                if child[0].attrib.get('window').lower() == window_name.lower():
                    current_conf = child[0].text.strip()
                    break
            elif child.tag == 'default':
                default_conf = child[0].text
    if len(current_conf)==0:
        current_conf = default_conf
    change_kb_color(current_conf)


if __name__ == '__main__':
    i3 = Connection()
    i3.on('window',detect_and_change)
    i3.main()




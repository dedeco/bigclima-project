# -*- coding: utf-8 -*-
import re
import time

def dms2dd(degrees, minutes, seconds, direction):
    dd = float(degrees) + float(minutes)/60 + float(seconds)/(60*60);
    if direction == 'S' or direction == 'W':
        dd *= -1
    return dd

def dd2dms(deg):
    d = int(deg)
    md = abs(deg - d) * 60
    m = int(md)
    sd = (md - m) * 60
    return [d, m, sd]

def parse_dms(dms):
    parts = re.split('[^\d\w]+', dms)
    lat = dms2dd(parts[0], parts[1], parts[2], parts[3])
    lng = dms2dd(parts[4], parts[5], parts[6], parts[7])
    return (lat, lng)

def datestring_to_date(datestr, formatstr="%Y-%m-%d %H:%M:%S"):
    try:
        dt = time.strptime(datestr, formatstr)
    except ValueError:
        dt = None

    if dt:
        dd = datetime.date(*dt[:3])
    else:
        dd = None

    return dd

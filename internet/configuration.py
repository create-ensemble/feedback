#!/usr/bin/env python

# Create Ensemble - Internet Ensemble Feedback Configuration
#
# Eventually, this script may be used to start up jackd and jacktrip
# for each node in our Internet Ensemble Feedback setup. This is just
# a draft/proposal for now. It's a proof of concept.
#
# Immediate configutation required!
#

import argparse
parser = argparse.ArgumentParser()
parser.add_argument("-c", "--clientname", help = "the name of the thing your connecting to")
parser.add_argument("-u", "--url", help = "url of the json configuration for the system")
parser.add_argument("-t", "--test", help = "don't actually spawn processes, starting jacd and jacktrip")
args = parser.parse_args()

# are we the server? we assume so...
#
server = True

clientName = None
if (args.clientname):
    # ...until we know that we're a client
    #
    server = False
    clientName = args.clientname

# where online can we find the configuration file?
#
url = 'https://raw.githubusercontent.com/create-ensemble/feedback/master/internet/configuration.json'
if (args.url):
    url = args.url

# is this for real or only a test?
#
this_is_only_a_test = False
if (args.test):
    this_is_only_a_test = True

# import library modules we'll use later
#
import json
import shlex
import signal
import socket
import subprocess
import urllib # install with: pip install urllib

# download the current configuration and parse out various parameters
#
print("downloading configuration...")
response = urllib.urlopen(url)
string = response.read()
data = json.loads(string)
configuration = data['configuration']
blockSize = configuration['blockSize']
sampleRate = configuration['sampleRate']

if (server):
    print("as the server, i will start each of these sessions:")
    for node in configuration['node']:
        jacktrip = "jacktrip -s -o {} -n {} --clientname {}".format(
                node['portOffset'],
                node['channelCount'],
                node['clientName'])
        print(jacktrip)
        #p = subprocess.Popen(jacktrip)
        # append p to a list
else:
    print("as client {}, i will start this session:".format(clientName))
    node = configuration['node'][clientNumber]
    jacktrip = "jacktrip -c {} -o {} -n {} --clientname {}".format(
            node['ip'],
            node['portOffset'],
            node['channelCount'],
            node['clientName'])
    print(jacktrip)
    #p = subprocess.Popen(jacktrip)
    # append p to a list

# wait for all subprocesses in the list

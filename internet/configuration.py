#!/usr/bin/env python

# Create Ensemble - Internet Ensemble Feedback Configuration
#
# Eventually, this script may be used to start up jackd and jacktrip for each
# node in our Internet Ensemble Feedback setup. This is just a draft/proposal
# for now. It's a proof of concept.
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
if (args.clientname):
    # ...until we know that we're a client
    #
    server = False

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
import sys
import urllib # install with: pip install urllib

# download the current configuration and parse out various parameters
#
print("Downloading configuration...")
#try:
#    urllib.urlopen("http://example.com", timeout = 1)
#    response = urllib.urlopen(url, timeout = 1)
#except urllib.URLError, e:
#    print("Error. We could not download the configuration file. Are you online?")
#    sys.exit(2)

response = urllib.urlopen(url)
print("...download successful")

string = response.read()
data = json.loads(string)
configuration = data['configuration']

# these will be used for jackd, i think...
#
blockSize = configuration['blockSize']
sampleRate = configuration['sampleRate']

#
#
if (server):
    print("I am the server!")
    print("I should run these commands:")
    for client in configuration['node']:
        node = configuration['node'][client]
        jacktrip = "jacktrip -s -o {} -n {} --clientname {}".format(
                node['portOffset'],
                node['channelCount'],
                client)
        print(jacktrip)
        #p = subprocess.Popen(jacktrip)
        # append p to a list
else:
    if (args.clientname not in configuration['node']):
        print("Client name '" + args.clientname + "' was not found in the list of configurations. The choices were:")
        print("  " + ", ".join(configuration['node'].keys()))
        sys.exit(1)

    print("I am client {}!".format(args.clientname))
    print("I should run this command:")
    node = configuration['node'][args.clientname]
    jacktrip = "jacktrip -c {} -o {} -n {} --clientname {}".format(
            node['ipAddress'],
            node['portOffset'],
            node['channelCount'],
            args.clientname)
    print(jacktrip)
    #p = subprocess.Popen(jacktrip)
    # append p to a list

# wait for all subprocesses in the list

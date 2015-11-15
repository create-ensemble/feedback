#!/usr/bin/env python

# Create Ensemble - Internet Ensemble Feedback Configuration
#
# Eventually, this script may be used to start up jackd and jacktrip for each
# node in our Internet Ensemble Feedback setup. This is just a draft/proposal
# for now. It's a proof of concept.
#

# default configuration url
#
url = 'https://raw.githubusercontent.com/create-ensemble/feedback/master/internet/configuration.json'

# handle various command line arguments
#
import argparse
parser = argparse.ArgumentParser()

parser.add_argument("-c", "--clientname", help =
'''If you are going to be a client, provide 'clientname' of the jacktrip
session you are to connect to. Try anything. If you're wrong, we'll give you a
list of possibilities.'''
)

parser.add_argument("-u", "--url", help =
'''Provide the URL of the JSON configuration file for the system. If you do not
provide this, the default will be {}'''.format(url)
)

parser.add_argument("-t", "--test", action = 'store_true', help =
'''Show all the commands that would be run if this were not a test. Don't
actually spawn any processes. Don't start jackd and jacktrip.'''
)

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
if (args.url):
    url = args.url

# is this for real or only a test?
#
this_is_only_a_test = False
if (args.test):
    this_is_only_a_test = True

# import library modules we'll use later
#
import shlex, signal, socket, subprocess, sys

# try to import the 'requests' module
#
try:
    import requests
except ImportError:
    print("You need the 'requests' module'. Try 'pip install requests' in your terminal.")
    sys.exit(1)

# download the current configuration and parse out various parameters
#
print("Downloading configuration...")
try:
    resp = requests.get(url, timeout = 1.0)
except requests.exceptions.RequestException:
    print(" ...download failed! Are you online?")
    sys.exit(1)
print(" ...download successful")
data = resp.json()

configuration = data['configuration']

# these will be used for jackd, if we ever get that into this script
#
blockSize = configuration['blockSize']
sampleRate = configuration['sampleRate']

# a list of processes
#
process = []

#
#
if (server):

    print("I am the server!")
    print("I should run these commands:")
    command = []

    #jackd = "jackd -d {} -p {} -r {}".format(jackBackend, blockSize, sampleRate)
    #print(jackd)

    for client in configuration['node']:
        node = configuration['node'][client]
        jacktrip = "jacktrip -s -o {} -n {} --clientname {}".format(
                node['portOffset'],
                node['channelCount'],
                client)
        print(jacktrip)

        command.append(shlex.split(jacktrip))

    if (not this_is_only_a_test):
        from multiprocessing.dummy import Pool
        pool = Pool(len(configuration['node']))

        def signal_handler(signal, frame):
            print('You pressed control-c. Terminating subprocess.')
            pool.terminate()
        signal.signal(signal.SIGINT, signal_handler)

        def work(c):
            return subprocess.Popen(c, shell=False)

        r = pool.map_async(work, command)
        r.wait()

else:

    if (args.clientname not in configuration['node']):
        print("Client name '" + args.clientname + "' was not found in the list of configurations. The choices were:")
        print("  " + ", ".join(configuration['node'].keys()))
        sys.exit(1)

    print("I am client '{}'!".format(args.clientname))
    print("I should run these commands:")

    #jackd = "jackd -d {} -p {} -r {}".format(jackBackend, blockSize, sampleRate)
    #print(jackd)

    node = configuration['node'][args.clientname]
    jacktrip = "jacktrip -c {} -o {} -n {} --clientname {}".format(
            node['ipAddress'],
            node['portOffset'],
            node['channelCount'],
            args.clientname)
    print(jacktrip)

    if (not this_is_only_a_test):
        p = subprocess.Popen(shlex.split(jacktrip), shell=False)
        #p = subprocess.Popen(shlex.split(jacktrip))

        def signal_handler(signal, frame):
            print('You pressed control-c. Terminating subprocess.')
            p.terminate()
        signal.signal(signal.SIGINT, signal_handler)

        p.wait()

# fin

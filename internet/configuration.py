# Create Ensemble - Internet Ensemble Feedback Configuration
#
# Eventually, this script may be used to start up jackd and jacktrip
# for each node in our Internet Ensemble Feedback setup. This is just
# a draft/proposal for now. It's a proof of concept.
#
# Immediate configutation required!
#

# are you the server?
#
iAmServer = True
#iAmServer = False

# are you the client? which one?
#
clientNumber = 0

# where online can we find the configuration file?
#
url = 'https://raw.githubusercontent.com/create-ensemble/feedback/master/internet/configuration.json'

# is this for real or just a test?
#
just_a_test = False
#just_a_test = True

import urllib # install with: pip install urllib
import json
import socket
from subprocess import check_call # not used yet

response = urllib.urlopen(url)
string = response.read()
data = json.loads(string)
configuration = data['configuration']

blockSize = configuration['blockSize']
sampleRate = configuration['sampleRate']

if (iAmServer):
    print("as the server, i will start each of these sessions:")
    for node in configuration['node']:
        command = ["jacktrip", "-s", "-o", str(node['portOffset']), "-n", str(node['channelCount']), "--clientname", node['clientName'] ]
        print(' '.join(command));
else:
    print("as client {}, i will start this session:".format(clientNumber))
    node = configuration['node'][clientNumber]
    command = ["jacktrip", "-c", node['ip'], "-o", str(node['portOffset']), "-n", str(node['channelCount']), "--clientname", node['clientName'] ]
    print(' '.join(command))

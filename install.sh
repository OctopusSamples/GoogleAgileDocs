#!/bin/bash

wget https://apt.puppetlabs.com/puppet6-release-bionic.deb
sudo dpkg -i puppet6-release-bionic.deb
sudo apt-get update
sudo apt-get install puppet-agent

sudo /opt/puppetlabs/bin/puppet module install puppetlabs/apt
sudo /opt/puppetlabs/bin/puppet module install puppet/archive

for var in "$@"
do
    for i in {1..2}
    do
      # sudo -E is required to get the FACTER_ environment variables
      sudo -E /opt/puppetlabs/bin/puppet apply $var --detailed-exitcodes
      if [[ $? -eq 0 ]] || [[ $? -eq 2 ]]
      then
        break
      fi
    done

    if [[ $? -ne 0 ]] && [[ $? -ne 2 ]]
    then
      exit 100
    fi
done

exit 0
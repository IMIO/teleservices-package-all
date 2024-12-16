#!/bin/sh

set -e # Exit immediately if a command exits with a non-zero status.

# installation path
install_path="/usr/lib/teleservices_package_all"

echo "--- Install passerelle settings casier judiciaire"
if [ ! -f "/etc/passerelle/settings.d/casier_judiciaire.py" ] || [ ! -s "/etc/passerelle/settings.d/casier_judiciaire.py" ]; then
  cp $install_path/passerelle/casier_judiciaire.py /etc/passerelle/settings.d/
fi

echo "--- Install passerelle settings BAEC"
if [ ! -f "/etc/passerelle/settings.d/baec.py" ] || [ ! -s "/etc/passerelle/settings.d/baec.py" ]; then
  cp $install_path/passerelle/baec.py /etc/passerelle/settings.d/
fi

echo "--- Install passerelle settings certificats population"
if [ ! -f "/etc/passerelle/settings.d/certificats_population.py" ] || [ ! -s "/etc/passerelle/settings.d/certificats_population.py" ]; then
  cp $install_path/passerelle/certificats_population.py /etc/passerelle/settings.d/
fi

service passerelle restart

sudo -u hobo hobo-manage imio_indus_deploy --directory $install_path
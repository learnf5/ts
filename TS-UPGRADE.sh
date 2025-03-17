# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

# set scf name
SCF=waf_rdp.scf

# download config from GitHub, copy to bigip1 and load/merge onto bigip1
curl --silent https://raw.githubusercontent.com/learnf5/ts/main/$SCF --output /tmp/$SCF
sudo scp /tmp/$SCF 192.168.1.31:/var/local/scf
sudo ssh 192.168.1.31 tmsh load sys config merge file $SCF

# confirm bigip1 is active
for i in {1..12}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done

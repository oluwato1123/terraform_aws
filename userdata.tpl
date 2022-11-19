#!/bin/bash
sudo hostnamectl set-hostname ${nodename} &&
curl -sfL https://get.k3s.io | sh -s - server \
--datastore-endpoint="mysql://${dbuser}:${dbpass}@tcp(${db_endpoint})/${dbname}" \
--write-kubeconfig-mode 644 \
--tls-san=$(curl http://169.254.169.254/latest/meta-data/public-ipv4) \
--token="JmzyL4dHqfbcgg.atlasv1.HcQzByiyEZM2MG765nfCxzfCl3wdq2ir4yd2ifLAdddaenQe1WeFTMQHgfjTWoyzbKE"
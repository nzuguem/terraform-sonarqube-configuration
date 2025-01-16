#!/bin/bash

set -e

# Configure Bash
cat <<EOF >> /home/vscode/.bashrc
source <(fzf --bash)
EOF

sudo sh -c 'task --completion bash > /etc/bash_completion.d/task'

# Fix "max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]"
# https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#_set_vm_max_map_count_to_at_least_262144
sudo sysctl -w vm.max_map_count=262144

# Start SonarQube Server
docker compose up --wait
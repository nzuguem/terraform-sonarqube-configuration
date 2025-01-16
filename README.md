# Terraform Sonarqube Configuration

## Environment 🚀

[![Open in Dev Containers](https://img.shields.io/static/v1?label=Dev%20Containers&message=Open&color=blue&logo=visualstudiocode)](https://vscode.dev/redirect?url=vscode://ms-vscode-remote.remote-containers/cloneInVolume?url=https://github.com/nzuguem/terraform-sonarqube-configuration)

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/nzuguem/terraform-sonarqube-configuration)

## Execute Analysis

```bash
## For Team 1
docker run --net host -v ./:/usr/src --rm -i sonarsource/sonar-scanner-cli \
    -Dsonar.projectName=team-1-sonar-configuration \
    -Dsonar.projectKey=me.nzuguem.team-1:sonar-configuration \
    -Dsonar.host.url=http://localhost:9000 \
    -Dsonar.token=$(terraform output -raw token_team_1)
    
## For Team 2
docker run --net host -v ./:/usr/src --rm -i sonarsource/sonar-scanner-cli \
    -Dsonar.projectName=team-2-sonar-configuration \
    -Dsonar.projectKey=me.nzuguem.team-2:sonar-configuration \
    -Dsonar.host.url=http://localhost:9000 \
    -Dsonar.token=$(terraform output -raw token_team_2) 
```
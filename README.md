# Terraform Sonarqube Configuration

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
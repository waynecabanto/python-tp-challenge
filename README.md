Application
---
A dockerized python backend application using Flask. 

The application inside the container is served using Gunicorn. 
Using the default Flask server is not recommended for production and should only be used for development.

GH Actions workflow:
---
#### testing:

on: push, pr  
branch: main  
steps:  
- repo clone
- run tests using `pytest` command  
  
#### build and aws ecs push:
on: push  
branch: main  
steps:  
- repo clone
- aws login
- build, tag, push to ECR
- configure ecs task definition locally
- deploy new image version using task definition
- get existing target ips and ports
- deregister existing targets in the target group of the ALB
- get IPs and ports of the newly deployed ECS tasks
- register tasks as new targets in the target group of the ALB

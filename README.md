# TestTech
prerequis 
installation docker 
installation Ansible 

# question 6
       option 1
executer le playbook avec ansible via la commande suivante 
--  ansible-playbook -i Ansible/hosts playbook.yml

      option 2 : sans ansible
build image 
- docker build -t mon-app-go .

run image 

docker run -d --name mon-app-go-container -p 8080:8080 mon-app-go

# question 7
solution 1 
construire un cluster kubernetes qui inclus toutes les machines et deployer l'application sur tous les noeuds du cluster  

solution 2 
utiliser un un provider cloud  par exemple AWS et deployer l'application a travers les regions  avec AWS ECS 

# question 9
 Centreon 
 prometheus et Grafana


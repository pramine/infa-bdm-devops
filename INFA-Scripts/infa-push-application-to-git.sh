#!/bin/bash

#Recieve inputs from Jenkins
export INFA_DEVOPS_GIT_BASE_DIR=$1
export INFA_DEVOPS_BLD_REQ_NUM=$2
export INFA_DEVOPS_BLD_REQ_MRS_APP_NAME=$3

#Go to GIT directory
cd ${INFA_DEVOPS_GIT_BASE_DIR}/INFA-Builds

#Configure GIT user
#chown --recursive $(whoami) .
#git config --global user.name  "infabdmpm"
#git config --global user.email "pbellamkonda@informatica.com"
#git remote -v 
#git remote remove origin 
#git remote add origin infabdmpm@github.com:infabmdpm/infa-bdm-devops.git
#git remote set-url origin infabdmpm@github.com:/infabdmpm/infa-bdm-devops.git
#Add file to GIT

#eval `ssh-agent -s`
#ssh-add

git add ${INFA_DEVOPS_GIT_BASE_DIR}/INFA-Builds/${INFA_DEVOPS_BLD_REQ_NUM}/${INFA_DEVOPS_BLD_REQ_MRS_APP_NAME}.iar

#Commit to GIT
git commit -m "Application ${INFA_DEVOPS_BLD_REQ_MRS_APP_NAME} is built with ${INFA_DEVOPS_BLD_REQ_NUM}"

#Push to GIT
git push origin master

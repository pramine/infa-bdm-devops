#!/bin/bash

#Recieve inputs from Jenkins
export INFA_DEVOPS_BLD_REQ_DOMAIN=$1
export INFA_DEVOPS_BLD_REQ_MRS=$2
export INFA_DEVOPS_BLD_REQ_NUM=$3
export INFA_DEVOPS_BLD_REQ_MRS_APP_NAME=$4
export INFA_DEVOPS_BLD_REQ_MRS_APP_PATH=$5
export INFA_DEVOPS_GIT_BASE_DIR=$6

#Load Environment variables
source ${INFA_DEVOPS_GIT_BASE_DIR}/INFA-Scripts/Domain.sh

#Cleanup previous file if it exists
rm -f ${INFA_DEVOPS_GIT_BASE_DIR}/INFA-Builds/${INFA_DEVOPS_BLD_REQ_NUM}/* 2>/dev/null

#Create sub directory for build
mkdir -p ${INFA_DEVOPS_GIT_BASE_DIR}/INFA-Builds/${INFA_DEVOPS_BLD_REQ_NUM}
 
#Deploy Application to File
${INFA_HOME}/server/bin/infacmd.sh tools deployApplication \
	-domainName ${INFA_DEVOPS_DOMAIN} \
	-userName ${INFA_DEVOPS_USER} \
	-securityDomain ${INFA_DEVOPS_SEC_DOMAIN} \
	-repositoryService ${INFA_DEVOPS_BLD_REQ_MRS} \
	-od ${INFA_DEVOPS_GIT_BASE_DIR}/INFA-Builds/${INFA_DEVOPS_BLD_REQ_NUM} \
	-applicationPath ${INFA_DEVOPS_BLD_REQ_MRS_APP_PATH}/${INFA_DEVOPS_BLD_REQ_MRS_APP_NAME}


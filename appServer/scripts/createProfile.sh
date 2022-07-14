#!/bin/sh
#Creation of node (nodeagent)
export WAS_BINARY="/opt/middleware/cloudapp/WebSphere/85-64"
export PROFILE_NAME="pawRschDev"
export Node_PROFILE_Path="/opt/middleware/cloudapp/cloudapp_Runtime/profiles/cloudappCell/${PROFILE_NAME}"
export Node_templatePath="/opt/middleware/cloudapp/WebSphere/85-64/profileTemplates/managed"
#export cell_name="cloudappCell"
export NODE_NAME="pawRschDevNode"
export HOST="vm-2e3b-f14b.nam.nsroot.net"
export Base_Starting_Port="33100"
export DMGR_HOST="vm-2e3b-f14b.nam.nsroot.net"
export DMGR_SOAP_PORT="32003"
export DMGR_ADMIN_USER="cloudappAdmin"
export DMGR_ADMIN_PASSWORD="alakazotland123"


${WAS_BINARY}/bin/manageprofiles.sh -create -profileName ${PROFILE_NAME} -profilePath ${Node_PROFILE_Path} -templatePath ${Node_templatePath} -nodeName ${NODE_NAME} -hostName ${HOST} -enableAdminSecurity true -federateLater true -startingPort ${Base_Starting_Port} -dmgrHost ${DMGR_HOST} -dmgrPort ${DMGR_SOAP_PORT} -dmgrAdminUserName ${cloudappAdmin} -dmgrAdminPassword ${DMGR_ADMIN_PASSWORD}

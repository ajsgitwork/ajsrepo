#!/bin/sh

env=$ENV_NAME
appName="raws-SNAPSHOT-war"
earFile=/opt/middleware/raws/ear/raws-SNAPSHOT.war

if [ "$env" = "dev" ]; then

     export WAS_HOME=/opt/middleware/cloudapp/WebSphere/85-64
	 export JAVA_HOME=$WAS_HOME/java/jre/bin
	 export PATH=$PATH:$JAVA_HOME
	 #export security=""
     DMGR_HOME=/opt/middleware/cloudapp/cloudapp_Runtime/profiles/cloudappCell/cloudappDmgr
	 Profile_Home=/opt/middleware/cloudapp/cloudapp_Runtime/profiles/cloudappCell/cloudapp2
	       
	 vHost="paw_host"
     appName="${appName}_dev"
     serverName="pawRschServerDEV"
     serverNode="cloudapp2Nodevm-2e3b-f14b"
     serverCell="cloudappCell"
     serverProfile="cloudapp2"
     serverMaps="\"WebSphere:cell=${serverCell},node=${serverNode},server=${serverName}\""
     

	 jaclString="\$AdminApp install $earFile {-MapModulesToServers {{".*" raws-SNAPSHOT.war,WEB-INF/web.xml ${serverMaps}}} -MapWebModToVH {{".*" raws-SNAPSHOT.war,WEB-INF/web.xml ${vHost}}} -MapResRefToEJB {{.* .* raws-SNAPSHOT.war,WEB-INF/web.xml mail/jbpmMailSession javax.mail.Session mail/jbpmMailSession "" "" ""} {.* .* raws-SNAPSHOT.war,WEB-INF/web.xml jdbc/jbpmAWDS javax.sql.DataSource jdbc/jbpmAWDS DefaultPrincipalMapping cloudappDmgrNode/jbpmAWDev ""}} -CtxRootForWebMod {{".*" raws-SNAPSHOT.war,WEB-INF/web.xml /raws}} -MetadataCompleteForModules {{.* raws-SNAPSHOT.war,WEB-INF/web.xml true}} -appname ${appName} -distributeApp -nouseMetaDataFromBinary  -createMBeansForResources -noreloadEnabled -nodeployws}"
                
fi

if [ "$env" = "uat1" ]; then

     export WAS_HOME=/opt/middleware/cloudapp/WebSphere/85-64
	 export JAVA_HOME=$WAS_HOME/java/jre/bin
	 export PATH=$PATH:$JAVA_HOME
	 #export security=""
     DMGR_HOME=/opt/middleware/cloudapp/cloudapp_Runtime/profiles/cloudappCell/cloudappDmgr
	 Profile_Home=/opt/middleware/cloudapp/cloudapp_Runtime/profiles/cloudappCell/cloudapp2
	       
	 vHost="paw_host_uat"   
	 appName="${appName}_uat"
     serverName="pawRschServerUAT"
     serverNode="cloudapp2Nodevm-2e3b-f14b"
	 serverCell="cloudappCell"
	 serverProfile="cloudapp2"
     
     serverMaps="\"WebSphere:cell=${serverCell},node=${serverNode},server=${serverName}\""
     
     jaclString="\$AdminApp install $earFile {-MapModulesToServers {{".*" raws-SNAPSHOT.war,WEB-INF/web.xml ${serverMaps}}} -MapWebModToVH {{".*" raws-SNAPSHOT.war,WEB-INF/web.xml ${vHost}}} -MapResRefToEJB {{.* .* raws-SNAPSHOT.war,WEB-INF/web.xml mail/jbpmMailSession javax.mail.Session mail/jbpmMailSession "" "" ""} {.* .* raws-SNAPSHOT.war,WEB-INF/web.xml jdbc/jbpmAWDS javax.sql.DataSource jdbc/jbpmAWDS DefaultPrincipalMapping cloudappDmgrNode/jbpmAWstg ""}} -CtxRootForWebMod {{".*" raws-SNAPSHOT.war,WEB-INF/web.xml /raws}} -MetadataCompleteForModules {{.* raws-SNAPSHOT.war,WEB-INF/web.xml true}} -appname ${appName} -distributeApp -nouseMetaDataFromBinary  -createMBeansForResources -noreloadEnabled -nodeployws}"
                
fi

if [ "$env" = "uat" ]; then

     export WAS_HOME=/opt/middleware/jbpm2/WebSphere/85-64
	 export JAVA_HOME=$WAS_HOME/java/jre/bin
	 export PATH=$PATH:$JAVA_HOME
	 #export security=""
     DMGR_HOME=/opt/middleware/jbpm2/jbpm2_Runtime/profiles/jbpm2Cell/jbpm2Dmgr
	 Profile_Home=/opt/middleware/jbpm2/jbpm2_Runtime/profiles/jbpm2Cell/jbpm2Profile
	       
	 vHost="paw_host"
	 appName="${appName}_uat"	 
     serverName="pawRschServer"
	 clusterName="pawRschCluster"
     serverNode="jbpm2ProfileNodeibdcajbpm1u"
	 serverCell="jbpm2Cell"
	 serverProfile="jbpm2Profile"
     
     serverMaps="\"WebSphere:cell=${serverCell},node=${serverNode},cluster=${clusterName}\""
     
     jaclString="\$AdminApp install $earFile {-MapModulesToServers {{".*" raws-SNAPSHOT.war,WEB-INF/web.xml ${serverMaps}}} -MapWebModToVH {{".*" raws-SNAPSHOT.war,WEB-INF/web.xml ${vHost}}} -MapResRefToEJB {{.* .* raws-SNAPSHOT.war,WEB-INF/web.xml mail/jbpmMailSession javax.mail.Session mail/jbpmMailSession "" "" ""} {.* .* raws-SNAPSHOT.war,WEB-INF/web.xml jdbc/jbpmAWDS javax.sql.DataSource jdbc/jbpmAWDS DefaultPrincipalMapping jbpm2DmgrNode/jbpmAWstg ""}} -CtxRootForWebMod {{".*" raws-SNAPSHOT.war,WEB-INF/web.xml /raws}} -MetadataCompleteForModules {{.* raws-SNAPSHOT.war,WEB-INF/web.xml true}} -appname ${appName} -distributeApp -nouseMetaDataFromBinary  -createMBeansForResources -noreloadEnabled -nodeployws}"
                
fi

if [ "$env" = "prod" ]; then

     export WAS_HOME=/opt/middleware/jbpm2/WebSphere/85-64
	 export JAVA_HOME=$WAS_HOME/java/jre/bin
	 export PATH=$PATH:$JAVA_HOME
	 #export security=""
     DMGR_HOME=/opt/middleware/jbpm2/jbpm2_Runtime/profiles/jbpm2Cell/jbpm2Dmgr
	 Profile_Home=/opt/middleware/jbpm2/jbpm2_Runtime/profiles/jbpm2Cell/jbpm2Profile
	       
	 vHost="paw_host"   
	 appName="${appName}_prod"
     serverName="pawRschServer"
	 clusterName="pawRschCluster"
     serverNode="jbpm2ProfileNodeibdcajbpm1p"
	 serverCell="jbpm2Cell"
	 serverProfile="jbpm2Profile"
     
     serverMaps="\"WebSphere:cell=${serverCell},node=${serverNode},cluster=${clusterName}\""
     
     jaclString="\$AdminApp install $earFile {-MapModulesToServers {{".*" raws-SNAPSHOT.war,WEB-INF/web.xml ${serverMaps}}} -MapWebModToVH {{".*" raws-SNAPSHOT.war,WEB-INF/web.xml ${vHost}}} -MapResRefToEJB {{.* .* raws-SNAPSHOT.war,WEB-INF/web.xml mail/jbpmMailSession javax.mail.Session mail/jbpmMailSession "" "" ""} {.* .* raws-SNAPSHOT.war,WEB-INF/web.xml jdbc/jbpmAWDS javax.sql.DataSource jdbc/jbpmAWDS DefaultPrincipalMapping jbpm2DmgrNode/jbpmAWprod ""}} -CtxRootForWebMod {{".*" raws-SNAPSHOT.war,WEB-INF/web.xml /raws}} -MetadataCompleteForModules {{.* raws-SNAPSHOT.war,WEB-INF/web.xml true}} -appname ${appName} -distributeApp -nouseMetaDataFromBinary  -createMBeansForResources -noreloadEnabled -nodeployws}"
                
fi

if [ "$env" = "cob" ]; then

     export WAS_HOME=/opt/middleware/jbpm2/WebSphere/85-64
	 export JAVA_HOME=$WAS_HOME/java/jre/bin
	 export PATH=$PATH:$JAVA_HOME
	 #export security=""
     DMGR_HOME=/opt/middleware/jbpm2/jbpm2_Runtime/profiles/jbpm2Cell/jbpm2Dmgr
	 Profile_Home=/opt/middleware/jbpm2/jbpm2_Runtime/profiles/jbpm2Cell/jbpm2Profile
	       
	 vHost="paw_host"   
	 appName="${appName}_cob"
     serverName="pawRschServer"
	 clusterName="pawRschCluster"
     serverNode="jbpm2ProfileNodeibdcajbpm1c"
	 serverCell="jbpm2Cell"
	 serverProfile="jbpm2Profile"
     
     serverMaps="\"WebSphere:cell=${serverCell},node=${serverNode},cluster=${clusterName}\""
     
     jaclString="\$AdminApp install $earFile {-MapModulesToServers {{".*" raws-SNAPSHOT.war,WEB-INF/web.xml ${serverMaps}}} -MapWebModToVH {{".*" raws-SNAPSHOT.war,WEB-INF/web.xml ${vHost}}} -MapResRefToEJB {{.* .* raws-SNAPSHOT.war,WEB-INF/web.xml mail/jbpmMailSession javax.mail.Session mail/jbpmMailSession "" "" ""} {.* .* raws-SNAPSHOT.war,WEB-INF/web.xml jdbc/jbpmAWDS javax.sql.DataSource jdbc/jbpmAWDS DefaultPrincipalMapping jbpm2DmgrNode/jbpmAWprod ""}} -CtxRootForWebMod {{".*" raws-SNAPSHOT.war,WEB-INF/web.xml /raws}} -MetadataCompleteForModules {{.* raws-SNAPSHOT.war,WEB-INF/web.xml true}} -appname ${appName} -distributeApp -nouseMetaDataFromBinary  -createMBeansForResources -noreloadEnabled -nodeployws}"
                
fi

echo "******** Application Under consideration is ${env} ************"

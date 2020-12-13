#infra-maven-project
######Managing terraform with nexus under maven type repository using pom.xml

####maven clean
mvn -s settings-nexus.xml clean


####maven create zip
mvn -s settings-nexus.xml package

####maven upload to nexus
mvn -s settings-nexus.xml deploy

####maven artifact download
mvn -s settings-nexus.xml dependency:copy




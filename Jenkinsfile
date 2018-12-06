node {
    def server = Artifactory.server 'ART'
    def rtMaven = Artifactory.newMavenBuild()
    def buildInfo
    def registry = "sergioboroid/docker-test"
    def registryCredential = "dockerhub"
    def pcImg
    
    stage ('Clone') {
        checkout scm
    }

    stage ('Artifactory configuration') {
        rtMaven.tool = 'M3'
        rtMaven.deployer releaseRepo: 'libs-release-local', snapshotRepo: 'libs-snapshot-local', server: server
        rtMaven.resolver releaseRepo: 'libs-release', snapshotRepo: 'libs-snapshot', server: server
        buildInfo = Artifactory.newBuildInfo()
        buildInfo.env.capture = true
    }

    try{
        stage ('Exec Maven') {
            rtMaven.run pom: 'pom.xml', goals: 'clean -Dbuild.number=${BUILD_NUMBER} package', buildInfo: buildInfo
        }
    } finally {
        //junit '**/surefire-reports/**/*.xml'
    }

    //if (env.BRANCH_NAME == 'dev') {
    //stage ('Publish build info') {
      //  server.publishBuildInfo buildInfo
    //}
    //}
    
    //stage('Cloning Git') {
      //  git 'https://github.com/SergioBoro/showcase.git'
    //}
  
     stage('Building image') {
         pcImg = docker.build(registry + ":showcase-6.1-SNAPSHOT-$BUILD_NUMBER", '.')
   }
  
  stage('Deploy Image') {
          docker.withRegistry("https://registry.hub.docker.com/", registryCredential) {
             pcImg.push()
      }
    }
}

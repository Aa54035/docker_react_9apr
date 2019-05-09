node {
  try {
    stage('Checkout') {
      checkout scm
    }
    stage('Environment') {
      sh 'git --version'
      echo "Branch: ${env.BRANCH_NAME}"
      sh 'docker -v'
      sh 'printenv'
    }
    stage('Build Docker test'){
       sh 'docker build -t react-test4 -f Dockerfile --no-cache .'
    }
    stage('Docker test'){
      //sh 'docker run -it -p 80:80 -d react-test3'
      sh 'docker images'
    }
      stage('Docker run'){
      sh 'docker ps -a'
      sh 'export DOCKER_HOST=tcp://http://13.125.53.177:2375'
      sh 'docker run -t -p 3000:3000 react-test4'
    }
    /*
    stage('Clean Docker test'){
      sh 'docker rmi react-test'
    }
    stage('Deploy'){
      if(env.BRANCH_NAME == 'master'){
        sh 'docker build -t docker-react-app --no-cache .'
        sh 'docker image -a'
        sh 'docker container run -it -p 3000:3000 docker-react-app'
        }
    }*/
  }
  catch (err) {
    throw err
  }
}

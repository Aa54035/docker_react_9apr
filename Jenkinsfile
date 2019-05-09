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
       sh 'docker build -t react-test3 -f Dockerfile --no-cache .'
    }
    stage('Docker test'){
      //sh 'docker run -it -p 80:80 -d react-test3'
      sh 'docker images'
    }
      stage('Docker run'){
      sh 'docker container run -it -p 3000:3000 react-test3'
      sh 'docker ps -a'
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

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
       sh 'docker build -t react-test1 -f Dockerfile --no-cache .'
    }
    stage('Docker test'){
      sh 'docker run -d react-test1'
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

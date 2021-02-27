pipeline {
    agent any
    
    parameters {
        choice(name: 'GIT_BRANCH', choices: ['development', 'feature-1.2.3', 'production'], description: 'Pick something')
    }
    
    
    environment {
        BRANCH_NAME = "${params.GIT_BRANCH}"
    }

    
    stages {
        stage("build") {
            steps {
                script {
                    def version = "1.2"
                    switch(env.BRANCH_NAME) {
                        case "develop":
			    result = "branch is set:" + "dev"
                            break
                        case ~/^feature-[0-9].[0-9].[0-9]+$/:
			    result = "branch is set:" + env.BRANCH_NAME
			    build (job: 'TFE/individual/feature', parameters: [string(name: 'BRANCH_NAME', value: env.BRANCH_NAME)])
			    break
			default:
			    result = "branch is set:" + "def"
			    break
                    }
                    echo "${result}"
                }
            }
        }
    }
}

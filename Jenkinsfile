pipeline {
    agent {
        label any
    }

     
    stages {

        stage("build") {
            steps {
                script {
                    switch (env.BRANCH_NAME) {
						case ~/feature/:
							println "branch is set: env.BRANCH_NAME"
							break
						case development:
							println "branch is set: env.BRANCH_NAME"
							break			

						default:
							println "Branch name was not set!"
							break
					}
                }
            }
        }
	}
}

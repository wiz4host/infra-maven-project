pipeline {
    agent any
    
    parameters {
        choice(name: 'VERSION_NUM', choices: ['ver-1.2.3', 'ver-2.0.0', 'ver-2.0.2'], description: 'get version number from git tag')
    }
    
    
    environment {
        BRANCH_NAME = "${env.BRANCH_NAME}"
	
    }

    
    stages {
        stage("build") {
            steps {
                script {
                    def version = "1.2"
                    switch(env.BRANCH_NAME) {
                        case "development":
			    result = "branch is set:" + "development"
			    build ( 
    				    job: 'TFE/individual/development', 
    				    parameters: [
    					    string(name: 'BRANCH_NAME', value: env.BRANCH_NAME),
    					    string(name: 'VERSION_NUM', value: params.VERSION_NUM)
    				    ]
			    )
                            break
                        case ~/^feature-[0-9].[0-9].[0-9]+$/:
			    result = "branch is set:" + env.BRANCH_NAME
			    build ( 
    				    job: 'TFE/individual/feature', 
    				    parameters: [
    					    string(name: 'BRANCH_NAME', value: env.BRANCH_NAME),
    					    string(name: 'VERSION_NUM', value: params.VERSION_NUM)
    				    ]
			    )
			    break
			default:
			    result = "branch is set:" + "default"
			    break
                    }
                    echo "${result}"
                }
            }
        }
    }
}

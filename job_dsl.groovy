pipelineJob('lior_backend') {
    definition {
        cps {
            script(readFileFromWorkspace('lior_backend.groovy'))
        }
    }
}

pipelineJob('lior_frontend') {
    definition {
        cps {
            script(readFileFromWorkspace('lior_frontend.groovy'))
        }
    }
}

pipelineJob('lior_backend') {
    definition {
        cps {
            script(readFileFromWorkspace('deploy.groovy'))
        }
    }
}

jenkins.model.Jenkins.instance.setDisableScriptSecurity(true)
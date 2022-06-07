pipelineJob('lior_backend') {
    definition {
        cps {
            // https://stackoverflow.com/questions/43699190/seed-job-asks-for-script-approval-in-jenkins
            script(readFileFromWorkspace('lior_backend.groovy'))
        }
    }
}

pipelineJob('lior_frontend') {
    definition {
        cps {
            // https://stackoverflow.com/questions/43699190/seed-job-asks-for-script-approval-in-jenkins
            script(readFileFromWorkspace('lior_frontend.groovy'))
        }
    }
}
import org.jenkinsci.plugins.scriptsecurity.scripts.ScriptApproval

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

// https://stackoverflow.com/a/55940005/13630006
ScriptApproval scriptApproval = ScriptApproval.get()
scriptApproval.pendingScripts.each {
    scriptApproval.approveScript(it.hash)
}
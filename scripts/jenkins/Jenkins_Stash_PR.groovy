// ********** LOGGING ************** //
def DEBUG = true;
def logger = { logThis, msg -> logThis ? manager.listener.logger.println(msg) : null } 
logger(true, "*** Groovy Postbuild Script ***")
logger(DEBUG, " *** DEBUGGING ENABLED")

// ********** ENVIRONMENT ************** //
def BUILD_NUMBER  = manager.getEnvVariable('BUILD_NUMBER')
def JOB_NAME      = manager.getEnvVariable('JOB_NAME')
def USER          = manager.getEnvVariable('JENKINS_SECRET')
def REPO_KEY      = manager.getEnvVariable('PULL_REQUEST_FROM_REPO_PROJECT_KEY')
def REPO_SLUG     = manager.getEnvVariable('PULL_REQUEST_FROM_REPO_SLUG')
def PR_ID         = manager.getEnvVariable('PULL_REQUEST_ID')
def buildLink = "http://jenkins.gtsservices.com/job/${JOB_NAME}/${BUILD_NUMBER}/"

// ********** COMMENT ************** //
def commentURI =  "https://stash.gtsservices.com:8443/rest/api/1.0/projects/${REPO_KEY}/repos/${REPO_SLUG}/pull-requests/${PR_ID}/comments"
def buildResult = manager.getResult()
def comment = "[BUILD ${JOB_NAME}-${BUILD_NUMBER} ${buildResult}](${buildLink})"

// ********** METRICS ************** //
// desired coverage
def COV = 70 
// max violations
def VIO = 10
def jslintViolations = 0
def actionCount = 0

// ********** NOTIFY IF CONFIGURATION FAILURE ************** //
logger((USER==null)," !!! NO STASH-JENKINS CREDENTIALS FOUND !!!")

logger(DEBUG, " *** Variables configured, checking build actions:")
manager.build.actions.each { action ->
    if(action.class.simpleName == "ViolationsBuildAction") {
        jslintViolations = action.report.violations.get("jslint") ?: 0
    }
    actionCount++
    manager.listener.logger.println("manager build action name: "+action.class.simpleName);
}

// *********************  GET COVERAGE AND ADD TO COMMENT ****************** //
// Detect: "Lines        : 91.19% ( 435/477 )"
def coverage = "No Coverage Found!!"
def lineCountRegex =".*Lines.*?([0-9]+\\.[0-9]+).*"
def lineCov = 0

def matcher = manager.getLogMatcher(lineCountRegex)
logger(DEBUG, " *** Checking matcher..."+(matcher)+"  -  "+(matcher?.matches()))
if (matcher?.matches() == null ) { 
    logger(DEBUG," *** No matches found.") 
} else {
    manager.addShortText(matcher.group(1), "grey", "white", "0px", "white")
    coverage = "Line Coverage: "+matcher.group(1)
    lineCov = matcher.group(1)
}

def happyCov = (lineCov > COV) ? "✔":"🐼"
def happyVio = (VIO > jslintViolations) ? "✔":"🐼"
comment += "\\n\\nViolations | Line Coverage\\n------|-------\\n${jslintViolations} ${happyVio}  | ${lineCov}%  ${happyCov} "
data =  "{ \"text\": \"${comment}\" }" 

if (USER && data && commentURI) {
    response = ["curl","-D-","-u",USER, "-H", "Content-Type: application/json", "-H", "Accept: application/json", "-X", "POST", "-d", data, commentURI].execute().text
    logger(DEBUG, " *** curl sent... Response: "+response)
}

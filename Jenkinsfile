node {
  checkout()
  archive 'pom.xml, src/'
}

def splits = splitTests([$class: 'CountDrivenParallelism', size: 2])
def branches = [:]
stage ("Running tests on ${splits.size()} nodes")
for (int i = 0; i < splits.size(); i++) {
  def exclusions = splits.get(i);
  branches["split${i}"] = {
    node() {
      sh 'rm -rf *'
      unarchive mapping: ['pom.xml' : '.', 'src/' : '.']
      writeFile file: 'exclusions.txt', text: exclusions.join("\n")
      sh "${tool 'Maven 3.x'}/bin/mvn -B -Dmaven.test.failure.ignore test"
      step([$class: 'JUnitResultArchiver', testResults: 'target/surefire-reports/*.xml'])
      echo "Build result: ${currentBuild.result}"
    }
  }
}
parallel branches
echo "Final result: ${currentBuild.result}"

def checkout () {
    stage 'Checkout code'
    checkout scm
}

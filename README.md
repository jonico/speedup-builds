# How to speed up builds and tests

* What is taking most of the time in your builds? Cloning, building, testing?
* Improve cloning times by
  - [shallow clones](https://issues.jenkins-ci.org/browse/JENKINS-24728) ([only if a fresh clone is needed every time](https://github.com/jonico/speedup-builds/issues/1))
  - reduced repository sizes by moving large binary files to Git LFS using [bfg-repo cleaner](https://github.com/rtyley/bfg-repo-cleaner/releases/tag/v1.12.5)
  - [push based build triggering](https://wiki.jenkins-ci.org/display/JENKINS/GitHub+Plugin#GitHubPlugin-TriggerabuildwhenachangeispushedtoGitHub), + use [ngrok](https://ngrok.com/) or open a port if needed
  - get version control system server and artifact repository closer to the build server (maybe by hosting it yourself or moving the build server closer to the rest)
* Improve build times by
  - [only building components once and transport them to all downstream build jobs and machines](https://wiki.jenkins-ci.org/display/JENKINS/Copy+Artifact+Plugin)
  - [using an artifact repository for shared components](http://www.slideshare.net/SonatypeCorp/white-paper-concepts-and-benefits-of-repository-management)
  - SSDs, more cores and more memory
  - [Optimized compiler switches](https://rogerkeays.com/why-is-maven-so-slow) - mvn client VM, -j option, memory options
  - [use a build system that is caching build results globally and does build parallelization automatically](http://prezi.com/20fxomjc_goy/?utm_campaign=share&utm_medium=copy&rc=ex0share)
* Improve test times by
  - identifying which tests are still testing used functionality and disable the rest
  - rewriting integration and system tests to use more mocking (one process without IPC and file system interaction preferred)
  - analyze bottlenecks and silent exceptions using New Relic, Dynatrace, OverOps or just VisualVM
  - dedicate a person per team to improve test execution time
  - [test partitioning across multiple machines using Jenkins Parallel Test Executor Plugin](https://github.com/jenkinsci/pipeline-plugin/blob/master/TUTORIAL.md) (this repository)
  - SSDs, more cores and more memory
  - learn more about [Jenkins Pipelines](https://jenkins.io/solutions/pipeline/), its job resuming functionalities and its [GitHub Integration](https://go.cloudbees.com/docs/cloudbees-documentation/cje-user-guide/chapter-github-branch-source.html#github-branch-source)
  - if you like to use a pre-setup environment using Docker that integrates with GitHub.com, you can follow [this tutorial](https://hub.docker.com/r/jenkinsci/pipeline-as-code-github-demo/).
  - pre-heating of integration test systems (e.g. by unfreezing memory snapshots of already fully up and running application server and database VMs)
  - only do smoke tests in build, all tests in nightly build (CI result is now also shown in code browser out of the pull request)
  - [optimized compiler switches](https://rogerkeays.com/why-is-maven-so-slow)
  - [use different commit status contexts for different tests](https://wiki.jenkins-ci.org/display/JENKINS/GitHub+Plugin), only make smoke test status checks [mandatory](https://help.github.com/articles/enabling-required-status-checks/)
  - [use a build system that is automatically caching test results parallelizing tests](http://prezi.com/20fxomjc_goy/?utm_campaign=share&utm_medium=copy&rc=ex0share) (if code tested and test have not changed)

# Interesting links

* [Tools for Continuous Integration at Google Scale](https://www.youtube.com/watch?v=KH2_sB1A6lA)
* [Facebook's Build Environment](https://www.youtube.com/watch?v=X0VH78ye4yY)
* [Speeding up builds with buck](https://buckbuild.com/)
* [Culture as code](https://www.youtube.com/watch?v=YIpNpptGX6Q)
* [Inner Source](https://paypal.github.io/InnerSourceCommons/)

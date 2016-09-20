# How to speed up builds and tests

* What is taking most of the time in your builds? Cloning, building, testing?
* Improve cloning times by
  - [shallow clones](https://issues.jenkins-ci.org/browse/JENKINS-24728)
  - [push based build triggering](https://wiki.jenkins-ci.org/display/JENKINS/GitHub+Plugin#GitHubPlugin-TriggerabuildwhenachangeispushedtoGitHub)
  - reduced repository sizes by moving large binary files to Git LFS using [bfg-repo cleaner](https://github.com/rtyley/bfg-repo-cleaner/releases/tag/v1.12.5)
* Improve build times by
  - [using an artifact repository for shared components](http://www.slideshare.net/SonatypeCorp/white-paper-concepts-and-benefits-of-repository-management)
  - [only build components once and transport them to all build slaves](https://wiki.jenkins-ci.org/display/JENKINS/Copy+Artifact+Plugin)
  - [use a build system that is caching build results globally](https://buckbuild.com/concept/what_makes_buck_so_fast.html)
  - SSDs and more memory
  - [build parallelization and optimized compiler switches](https://rogerkeays.com/why-is-maven-so-slow)
* Improve test times by
  - [caching test results] (if code tested and test have not changed)
  - SSDs and more memory
  - [test parallelization including partitioning](https://github.com/jenkinsci/pipeline-plugin/blob/master/TUTORIAL.md) (this repository)
  - only do smoke tests in build, all tests in nightly build (CI result is now also shown in code browser out of the pull request)
  - [use different commit status contexts for different tests](https://wiki.jenkins-ci.org/display/JENKINS/GitHub+Plugin), only make smoke test status checks [mandatory](https://help.github.com/articles/enabling-required-status-checks/)

# Great videos to watch

* [Tools for Continuous Integration at Google Scale](https://www.youtube.com/watch?v=KH2_sB1A6lA)
* [https://www.youtube.com/watch?v=X0VH78ye4yY](https://www.youtube.com/watch?v=X0VH78ye4yY) 

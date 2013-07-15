# Basic Puppet Apache manifest

import "nodes"
import "git"

class development {
  
  exec { "apt-update":
    command => "/usr/bin/apt-get update"
 }
  
  package { ["git", "createrepo", "alien", "openjdk-7-jdk"]:
    ensure => latest,
    require  => Exec['apt-update'],
  }
    
  ## prepare handling of java and tomcat dependency with puppet instead of the rpm itself
  
  #package { ["java-1.7.0-openjdk-devel"]:
  #  ensure => present,
  #  require => File['/usr/java/latest/']
  #}
  
  #package { ["apache-tomcat-7.0.41-1.noarch"]:
  #  ensure => present,
  #  require => Package["java-1.7.0-openjdk-devel"],
  #} 
  
  
}
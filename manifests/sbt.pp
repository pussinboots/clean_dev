class sbt {
  
  $version = "0.12.4"
  
  exec { 'download sbt':
    command => "/usr/bin/wget http://scalasbt.artifactoryonline.com/scalasbt/sbt-native-packages/org/scala-sbt/sbt/$version/sbt.rpm",
    require => Package["openjdk-7-jdk"],
    creates => '/vagrant/manifests/sbt.rpm',
  }
  # not working 
  exec { 'convertsbt rpm to deb':
    command => '/usr/bin/alien /vagrant/manifests/sbt.rpm',
    path =>  "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
    creates => "/vagrant/manifests/sbt_$version-2_all.deb",
    require => Exec["download sbt"],
  }
  
  package { 'sbt':
    ensure   => installed,
    provider => dpkg,
    source   => "/vagrant/manifests/sbt_$version-2_all.deb",
    require => Exec["convertsbt rpm to deb"],    
  }
}
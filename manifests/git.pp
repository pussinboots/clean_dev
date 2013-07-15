class git {

    $project = "sbt-rpm"
    $gitdir = "/var/git"
    $projectdir = "$gitdir/$project"
    $giturl = "https://github.com/pussinboots/sbt-rpm.git"
    file { $gitdir:
        ensure  =>  directory,
    }
    exec { "git clone sysadmin":
        command     =>  "/usr/bin/git clone $giturl $projectdir",
        require     =>  File[$gitdir],
        creates     =>  "$projectdir",
    }
}+
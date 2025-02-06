#!/bin/bash
    echo hi123
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u subiksha17 -p s1705sha17
    docker tag my_app subiksha17/myreact
    docker push subiksha17/myreact
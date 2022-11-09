#! /bin/bash
nohup java -jar -Djasypt.encryptor.password= -Dserver.port=49600 build/libs/cancer-library-app-0.0.1-SNAPSHOT.jar &

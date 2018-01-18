#!/bin/sh

#=======================================================
# functions declaration
#=======================================================

usage() {
cat <<-EOF

  USAGE: stack.sh [OPTIONS] [TEXT]

  OPTIONS

    -b, --build       build Dockerfiles and push to registry
    -h, --help        usage help
    -u, --up          start Dockerfiles based on docker-compose.yml

EOF
return;
};

build_stack() {
    echo "building vote application stack ..."
    #(TBD) faas
    # database
    # queue
    # cache
    # worker
    docker build -t registry.gitlab.com/bootcamp-juniors/vote/worker:build-$CI_PIPELINE_ID -f ./src/worker/Dockerfile ./src/worker/.
    docker push registry.gitlab.com/bootcamp-juniors/vote/worker:build-$CI_PIPELINE_ID
    # app
    docker build -t registry.gitlab.com/bootcamp-juniors/vote/vote:build-$CI_PIPELINE_ID -f ./src/vote/Dockerfile ./src/vote/.
    docker push registry.gitlab.com/bootcamp-juniors/vote/vote:build-$CI_PIPELINE_ID
    # api
    # UX
    # Monitoring
    docker build -t registry.gitlab.com/bootcamp-juniors/vote/auditor:build-$CI_PIPELINE_ID -f ./src/auditor/Dockerfile ./src/auditor/.
    docker push registry.gitlab.com/bootcamp-juniors/vote/auditor:build-$CI_PIPELINE_ID
    return;
};

start_stack() {
    echo "start vote application ..."
    docker-compose up
    return;
};

#=======================================================
# Argument handling
#=======================================================

args=`getopt -o hbu --long help,build,up: -- "$@"`
if [ $? != 0 ] ; then usage; exit 1 ; fi
eval set -- args

# verification - before

echo "Before =================================="
for i
do
  echo i
done

# verification - after

echo "============================ After getopt"
for i
do
  echo ">i"
  case "i" in
        -h | --help) usage;exit;;
        -b | --build) echo "build Dockerfiles";build_stack;shift;;
        -u | --up) echo "start Dockerfiles";start_stack;shift;;
  esac
done

#=======================================================
# Main scripts
#=======================================================



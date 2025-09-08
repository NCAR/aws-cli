#!/bin/sh
case $1 in
    --init-rc=*)
        install_dir=`expr "$1" : '--init-rc=\(.*\)'`
        echo "mkdir -p \"${install_dir}\""
        echo "cd \"${install_dir}\" && ("
        echo 'install_path=`pwd`'
        echo "cat >aws <<'EOF'"
        cat /usr/local/bin/aws.sh
        echo "EOF"
        echo "chmod +x aws )" ;;
    *)
        exec ./aws "$@" ;;
esac



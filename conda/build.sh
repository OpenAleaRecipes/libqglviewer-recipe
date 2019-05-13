#!/bin/bash

set -x -e

export CXXFLAGS=""
export LINKFLAGS=""

if [ "$(uname)" == "Darwin" ];
then
    export CC=clang
    export CXX=clang++

    export MACOSX_VERSION_MIN=10.9
    export QMAKESPEC=macx-g++
	
	CXXFLAGS="${CXXFLAGS} -stdlib=libc++ -mmacosx-version-min=${MACOSX_VERSION_MIN}"
    LINKFLAGS="${LINKFLAGS} -stdlib=libc++ -mmacosx-version-min=${MACOSX_VERSION_MIN}"

fi

if [ "$(uname)" == "Linux" ];
then
    export QMAKESPEC=linux-g++
fi

[ -d build ]] || mkdir build
cd build

qmake PREFIX=$PREFIX NO_QT_VERSION_SUFFIX=1 ../libQGLViewer.pro

make
make install
cd ..

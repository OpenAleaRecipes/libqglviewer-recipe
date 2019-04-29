#!/bin/bash

set -x -e

export CXXFLAGS="-stdlib=libc++ -std=c++14"
export LINKFLAGS="-stdlib=libc++ -std=c++14"

if [ "$(uname)" == "Darwin" ];
then
    export CC=clang
    export CXX=clang++

    export MACOSX_VERSION_MIN=10.11
    export QMAKESPEC=macx-g++
	
	CXXFLAGS="${CXXFLAGS} -mmacosx-version-min=${MACOSX_VERSION_MIN}"
    LINKFLAGS="${LINKFLAGS} -mmacosx-version-min=${MACOSX_VERSION_MIN}"

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

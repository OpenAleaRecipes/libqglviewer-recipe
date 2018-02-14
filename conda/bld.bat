qmake PREFIX=$PREFIX NO_QT_VERSION_SUFFIX=1 ../libQGLViewer.pro

nmake
nmake install
cd ..

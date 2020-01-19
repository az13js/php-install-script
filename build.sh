#!/bin/bash

PHP_INSTALL=/opt/php_7_3_13
DEFAULT_USER=root
DEFAULT_USER_GROUP=root
LIB_XML2_PFIX=/opt/libxml2-2-9-10
OPENSSL_PFIX=/opt/openssl-111d
PCRE_PFIX=/opt/pcre2_10_34
ZLIB_PFIX=/opt/zlib_1_2_11
BZIP2_PFIX=/opt/bzip2_1_0_6
CURL_PFIX=/opt/curl
#GD_PFIX=/opt/libgd_2_2_5
#WEBP_PFIX=/opt/libwebp_1_0_3
#JPG_PFIX=/opt/libjpeg9c
#PNG_PFIX=/opt/libpng_1_6_37
#FTYPE2_PFIX=/opt/freetype2_10_1
#XSL_PFIX=/opt/XSLT_library
#ZIP_PFIX=/opt/???
#RL_PFIX=/opt/readline
GMP_PFIX=/opt/library_gmp
ICU_PFIX=/opt/lib_icu
ONI_PFIX=/opt/oniguruma
MM_PFIX=/opt/oosp_mm

rm -fr php_7_3_13
tar -axf php_7_3_13.tar.gz
cd php_7_3_13

./configure \
CC=/opt/gcc_9/bin/gcc \
CFLAGS="-O3" \
CXX=/opt/gcc_9/bin/g++ \
--prefix=$PHP_INSTALL --enable-fpm --with-fpm-user=$DEFAULT_USER \
--with-fpm-group=$DEFAULT_USER_GROUP --enable-phpdbg \
--enable-phpdbg-readline --enable-sigchild --enable-libgcc \
--with-libxml-dir=$LIB_XML2_PFIX --with-openssl=$OPENSSL_PFIX \
--with-pcre-regex=$PCRE_PFIX --with-pcre-jit --with-zlib=$ZLIB_PFIX \
--with-zlib-dir=$ZLIB_PFIX --enable-bcmath --with-bz2=$BZIP2_PFIX \
--with-curl=$CURL_PFIX --enable-exif --with-pcre-dir=$PCRE_PFIX --enable-ftp \
--with-openssl-dir=$OPENSSL_PFIX --with-gmp=$GMP_PFIX --with-onig=$ONI_PFIX \
--enable-intl --with-icu-dir=$ICU_PFIX --enable-mbstring \
--with-mysqli --with-mysql-sock --enable-pcntl --with-pdo-mysql \
--with-mm=$MM_PFIX --enable-shmop --enable-soap --enable-phpdbg-webhelper \
--enable-sockets --enable-sysvmsg --enable-sysvsem --enable-sysvshm \
--enable-wddx --enable-zend-test --enable-mysqlnd --with-gnu-ld

#--with-libzip=$ZIP_PFIX --with-readline=$RL_PFIX --with-xsl=$XSL_PFIX \
#--enable-zip --with-gd=$GD_PFIX --with-webp-dir=$WEBP_PFIX \
#--with-jpeg-dir=$JPG_PFIX --with-png-dir=$PNG_PFIX --enable-gd-jis-conv \
#--with-freetype-dir=$FTYPE2_PFIX

make
make install

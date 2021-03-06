ARG centos=7.9.2009
ARG image=php-apcu-7.4

FROM aursu/peclbuild:${centos}-${image}

COPY SOURCES ${BUILD_TOPDIR}/SOURCES
COPY SPECS ${BUILD_TOPDIR}/SPECS

RUN chown -R $BUILD_USER ${BUILD_TOPDIR}/{SOURCES,SPECS}

USER $BUILD_USER

ENTRYPOINT ["/usr/bin/rpmbuild", "php-pecl-igbinary.spec"]
CMD ["-ba"]

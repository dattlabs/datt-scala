FROM datt/datt-openjdk7:latest
MAINTAINER John Albietz "inthecloud247@gmail.com"

RUN `# install scala;` \
  \
  `# libjansi + deps needed for scala`; \
  apt-get update; \
  apt-get install -y libhawtjni-runtime-java libjansi-java libjansi-native-java; \
  \
  export SCALA_PKG="scala-2.10.3.deb"; \
  wget http://www.scala-lang.org/files/archive/$SCALA_PKG; \
  dpkg -i $SCALA_PKG; \
  rm -vf $SCALA_PKG; \
  which scala; \
  apt-get clean;

RUN `# install sbt;` \
  export SBT_PKG="sbt.deb"; \
  wget http://repo.scala-sbt.org/scalasbt/sbt-native-packages/org/scala-sbt/sbt/0.13.1/$SBT_PKG; \
  dpkg -i $SBT_PKG; \
  rm -vf $SBT_PKG; \
  which sbt;

# update java, scala and sbt jars by running the commands

RUN java -version

# the `true` is needed for the image to build w/o errors.
# not sure why.
RUN scala -version || true

# start sbt up so that it downloads/caches some scala libraries and they get stored into the docker image. This speeds up the boot time a lot. error output is given though, so this should be cleaned up with a different command that achieves the same thing if possible.
RUN sbt clean || true

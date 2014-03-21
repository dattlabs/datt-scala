FROM datt/datt-openjdk7:latest
MAINTAINER inthecloud247 "inthecloud247@gmail.com"

RUN `# install scala;` \
  export SCALA_PKG="scala-2.10.3.deb"; \
  apt-get install -y libhawtjni-runtime-java libjansi-java libjansi-native-java; \
  wget http://www.scala-lang.org/files/archive/$SCALA_PKG; \
  dpkg -i $SCALA_PKG; \
  rm -vf $SCALA_PKG; \
  which scala;

RUN `# install sbt;` \
  export SBT_PKG="sbt.deb"; \
  wget http://repo.scala-sbt.org/scalasbt/sbt-native-packages/org/scala-sbt/sbt/0.13.1/$SBT_PKG; \
  dpkg -i $SBT_PKG; \
  rm -vf $SBT_PKG; \
  which sbt;

# update java, scala and sbt jars
RUN java -version
RUN scala -version || true
RUN sbt --version

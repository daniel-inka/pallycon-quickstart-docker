FROM deliveryagent/centos7-node
MAINTAINER Daniel Kim <daniel@inka.co.kr>

# Install required utils
RUN yum -y install unzip

# Create node app and packager directory

# Download app source from pallycon server (will be added later)
WORKDIR /usr/src
RUN wget "http://pallycon.com/pallycon-contents/qs_node_app.zip" && unzip qs_node_app.zip

# Install app dependencies
WORKDIR /usr/src/app
RUN npm install

# Bundle app source and give scripts permission
# COPY app/. /usr/src/app
# RUN chmod 744 /usr/src/app/packager/*.sh

# Download and unzip prepacked sample video from pallycon server
RUN mkdir -p /usr/src/app/website/contents
WORKDIR /usr/src/app/website/contents
RUN wget "http://pallycon.com/pallycon-contents/bbb.zip" && unzip bbb.zip

# Download CLI packager and Bento4 from pallycon server
RUN mkdir -p /usr/src/app/packager
WORKDIR /usr/src/app/packager
RUN wget "http://pallycon.com/pallycon-contents/PallyCon_Packager_DASHCENC_CLI_CentOS_20160607.zip"
RUN unzip PallyCon_Packager_DASHCENC_CLI_CentOS_20160607.zip
RUN chmod 744 /usr/src/app/packager/PallyConPackager

RUN wget "http://pallycon.com/pallycon-contents/Bento4-SDK-1-5-0-613.x86_64-unknown-linux.zip"
RUN unzip Bento4-SDK-1-5-0-613.x86_64-unknown-linux.zip && mv Bento4-SDK-1-5-0-613.x86_64-unknown-linux Bento4

# setting directory for host volume
RUN mkdir -p /usr/local/work
VOLUME ["/usr/local/work"]

EXPOSE 8120
CMD ["npm", "start"]

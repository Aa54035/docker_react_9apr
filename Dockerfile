#First of all we're basing this on the official Node v8 repository on Docker Hub. That gives you a Node and Yarn by default.
FROM node:8

#yarn file not present so un commented 
#ADD yarn.lock /yarn.lock
ADD package.json /package.json

#Note how the NODE_PATH environment variable puts the node_modules in the root of the container. 
#That's so that it doesn't get added in "here" (i.e. the current working directory). If you didn't do this, the node_modules directory would be part of the mounted volume which not only slows down Docker (since there are so many files) it also isn't necessary to see those files.

ENV NODE_PATH=/node_modules
ENV PATH=$PATH:/node_modules/.bin
#since Run yarn giving error code on jenkins commented
#RUN yarn
RUN npm set progress=false
RUN npm onfig set registry http://registry.npmjs.org/
RUN npm install

WORKDIR /app
ADD . /app

EXPOSE 3000
EXPOSE 35729
#Note how the ENTRYPOINT points to run.sh. That's a file we need to create too, alongside the Dockerfile file.

ENTRYPOINT ["/bin/bash", "/app/run.sh"]
CMD ["start"]
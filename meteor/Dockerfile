FROM meteor/meteor-base:20211013T200759Z_489f5fe
USER mt
WORKDIR /home/mt
ENV MONGO_URL "mongodb://host.docker.internal:27017/ii"
RUN export MONGO_URL="${MONGO_URL}"
EXPOSE 3000
CMD ["meteor"];

# COPY --chown=mt app/ cloned-repo-inside-host-pc/

# RUN	cd app && meteor deploy


# FROM node:14-alpine
# WORKDIR /home/node
# RUN apk --no-cache add curl
# RUN apk add --no-cache bash
# RUN curl https://install.meteor.com/ | sh
# ENV MONGO_URL "mongodb://host.docker.internal:27017/it"
# RUN export MONGO_URL="${MONGO_URL}"
# USER node
# EXPOSE 3000
# RUN meteor npm i
# CMD ["meteor","-s", "/app/iticks/settings.json"];

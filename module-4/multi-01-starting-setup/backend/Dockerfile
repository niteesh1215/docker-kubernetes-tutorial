FROM node:14
WORKDIR /app
COPY package.json .
RUN npm i
COPY . .
ENV PORT 80
ENV MONGO_URL "mongodb://localhost:27017/course-goals"
EXPOSE 80
CMD ["npm","start"];
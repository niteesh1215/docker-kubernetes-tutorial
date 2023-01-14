BACKEND_PORT="80"
BACKEND_CONTAINER_NAME="module4backend"
BACKEND_IMAGE_NAME="m4backend"
FRONTEND_PORT="3000"
FRONTEND_IMAGE_NAME="m4frontend"
FRONTEND_CONTAINER_NAME="module4frontend"

MONGO_CONTAINER_NAME="mongodb"
MONGO_PORT="27017"
MONGO_USER="niteesh"
MONGO_PASS="niteesh"

APP_NETWORK_NAME="module-4-app"

echo "creating network"
docker network create $APP_NETWORK_NAME
docker network ls
echo "*********************************\n\n"
echo "building backend image"
docker build -t $BACKEND_IMAGE_NAME ./multi-01-starting-setup/backend
docker images
echo "*********************************\n\n"
echo "building frontend image"
docker build -t $FRONTEND_IMAGE_NAME ./multi-01-starting-setup/frontend
docker images
echo "*********************************\n\n"
echo "running mongo container";
docker run --name $MONGO_CONTAINER_NAME -d --rm --network $APP_NETWORK_NAME \
    -e MONGO_INITDB_ROOT_USERNAME=$MONGO_USER \
    -e MONGO_INITDB_ROOT_PASSWORD=$MONGO_PASS \
    -v $(pwd)/mongo-data:/data/db \
    mongo
docker ps
echo "*********************************\n\n"
echo "running backend app container";
docker run --name $BACKEND_CONTAINER_NAME -d --rm \
    --network $APP_NETWORK_NAME \
    -p $BACKEND_PORT:3000 \
    -e PORT=3000 \
    -e MONGO_URL="mongodb://${MONGO_USER}:${MONGO_PASS}@${MONGO_CONTAINER_NAME}:27017/course-goals?authSource=admin" \
    -v $(pwd)/multi-01-starting-setup/backend:/app \
    -v /app/node_modules \
    -v m4backend-logs:/app/logs \
    $BACKEND_IMAGE_NAME
docker ps
echo "*********************************\n\n"
echo "running frontend app container";
docker run --name $FRONTEND_CONTAINER_NAME --rm \
    -p $FRONTEND_PORT:$FRONTEND_PORT \
    -e PORT=$FRONTEND_PORT \
    -v /app/node_modules \
    -v $(pwd)/multi-01-starting-setup/frontend:/app \
    $FRONTEND_IMAGE_NAME





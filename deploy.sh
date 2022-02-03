SERVICE_NAME="foo-service"
TAG_VERSION="latest"
PROJECT_ID=$(gcloud config get-value project)
REGION="us-east1"

IMAGE_TAG_URL=${REGION}-docker.pkg.dev/${PROJECT_ID}/${SERVICE_NAME}/${SERVICE_NAME}:${TAG_VERSION}

docker build -t ${SERVICE_NAME}:${TAG_VERSION} .
docker tag ${SERVICE_NAME}:${TAG_VERSION} ${IMAGE_TAG_URL}
docker push ${IMAGE_TAG_URL}

gcloud beta run deploy ${SERVICE_NAME} --image ${IMAGE_TAG_URL}  --region ${REGION} --allow-unauthenticated --platform managed

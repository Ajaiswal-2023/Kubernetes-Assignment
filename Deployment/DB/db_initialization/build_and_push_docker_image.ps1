# Set variables
$DOCKER_USERNAME = "anujais2017"
$VERSION_FILE = "VERSION"
$IMAGE = "init-db"

# Read the current version
$CURRENT_VERSION = Get-Content $VERSION_FILE

$IMAGE_NAME = "${DOCKER_USERNAME}/${IMAGE}"

# Split the version into parts
$VERSION_PARTS = $CURRENT_VERSION -split '\.'
$MAJOR = [int]$VERSION_PARTS[0]
$MINOR = [int]$VERSION_PARTS[1]
$PATCH = [int]$VERSION_PARTS[2]

# Increment the patch version
$NEW_PATCH = $PATCH + 1
$NEW_VERSION = "$MAJOR.$MINOR.$NEW_PATCH"

# Build the new Docker image
docker build -t "${IMAGE_NAME}" .

# Tag the new image as latest
docker tag "${IMAGE_NAME}" "${IMAGE_NAME}:${NEW_VERSION}"
docker tag "${IMAGE_NAME}" "${IMAGE_NAME}:latest"

# Push the new image to Docker Hub
docker push "${IMAGE_NAME}:${NEW_VERSION}"
docker push "${IMAGE_NAME}:latest"

# Update the version file
Set-Content $VERSION_FILE $NEW_VERSION

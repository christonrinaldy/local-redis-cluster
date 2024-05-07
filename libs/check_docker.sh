# Check if docker command exists
if command -v docker &> /dev/null; then
    exit 0  # Exit with success code
else
    echo "Docker is not installed."
    exit 1  # Exit with failure code
fi
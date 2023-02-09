# Imagizer Load Tests

## Setup

> Install the load tester on a server with a fast network to Imagizer servers
```bash
# Install python3 and pip3 (Example for Ubuntu)
sudo apt update
sudo apt-get install python3-pip

# Install Taurus Load tester (https://gettaurus.org/)
pip3 install bzt

# Clone this repo
git clone https://github.com/Nventify/imagizer-load-tests.git
```

> Copy a set of images to the server
```bash
rsync -ra images/ example.com:/images
```

> Generate a CSV file from the images path on the server
```bash
./imagizer-load-tests/generate_csv.sh images
```

## Redeye & Colorize on POST

> Purge the Imagizers' cache before running the tests
```bash
curl -X DELETE http://10.1.2.248:17006/cache
curl -X DELETE http://10.1.2.247:17006/cache
```

> Run the tests
```bash
bzt ./imagizer-load-tests/redeye_post_tests.yml -o settings.ENV.USERS=10 -o settings.ENV.HOST1=10.1.2.248  -o settings.ENV.HOST1=10.1.2.247
```

Note:
- The `HOST1` and `HOST2` variables specify the Imagizer servers to test. The USERs variable specifies the number of concurrent users to test with.

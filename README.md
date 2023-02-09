# Imagizer Load Tests

## Setup

> Install the load tester on a server with a fast network to Imagizer servers
```bash
# Install python3 and pip3 (Example for Ubuntu)
sudo apt update
sudo apt-get install python3-pip

# Install Taurus Load tester (https://gettaurus.org/)
pip3 install bzt
```

> Copy a set of images to the server
```bash
rsync -ra images/ example.com:/images
```

> Generate a CSV file from the images path on the server
```bash
./generate_csv.sh images
```

## Redeye & Colorize on POST
```bash
bzt redeye_post_tests.yml -o settings.ENV.USERS=10 -o settings.ENV.HOST1=10.1.2.248  -o settings.ENV.HOST1=10.1.2.247
```

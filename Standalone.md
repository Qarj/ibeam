# How to set up for local development

References
- https://github.com/Voyz/ibeam/wiki/Runtime-environment#standalone-environment


# Setup IBKR Client Portal API Gateway

Installed at `$HOME/Jts/ibgateway/1012/ibgateway`

# Setup Java

```
java --version
.
openjdk 11.0.13 2021-10-19
OpenJDK Runtime Environment (build 11.0.13+8-Ubuntu-0ubuntu1.20.04)
OpenJDK 64-Bit Server VM (build 11.0.13+8-Ubuntu-0ubuntu1.20.04, mixed mode, sharing)
```

# Setup ChromeDriver

```sh
cd /usr/local/bin
sudo mkdir selenium
sudo chmod 777 selenium

cd /usr/local/bin/selenium
sudo wget http://chromedriver.storage.googleapis.com/LATEST_RELEASE -O LATEST_RELEASE
latest=$(cat LATEST_RELEASE)
wget -N https://chromedriver.storage.googleapis.com/$latest/chromedriver_linux64.zip -O chromedriver_linux64.zip
sudo apt install unzip
unzip -o chromedriver_linux64.zip -d .
./chromedriver --version
.
ChromeDriver 98.0.4758.80 (7f0488e8ba0d8e019187c6325a16c29d9b7f4989-refs/branch-heads/4758@{#972})
```

# Setup Outputs folder

Will crash without this
```
FileNotFoundError: [Errno 2] No such file or directory: '/home/user/git/ibeam/outputs/ibeam_log__2022-02-13.txt'
```

```sh
cd $HOME/git/ibeam
mkdir outputs
```

# Install required pip packages

```
pip install -r $HOME/git/ibeam/requirements.txt
```

# Install required dependencies

```
sudo apt install xvfb
```

# Start IBEAM

Create a `ibeamlocal` script in path

```sh
#!/bin/bash
export IBEAM_ACCOUNT=user
export IBEAM_PASSWORD=pass
export IBEAM_MAX_IMMEDIATE_ATTEMPTS=2
export IBEAM_TWO_FA_HANDLER=GOOGLE_MSG
export IBEAM_GATEWAY_DIR=$HOME/git/ibeam/copy_cache/clientportal.gw
export IBEAM_CHROME_DRIVER_PATH=/usr/local/bin/selenium/chromedriver
export IBEAM_LOG_LEVEL=DEBUG
export IBEAM_ERROR_SCREENSHOTS=True
python3 $HOME/git/ibeam/ibeam/ibeam_starter.py
```

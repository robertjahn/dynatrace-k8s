#!/bin/bash

# jq
# https://stedolan.github.io/jq
if ! [ -x "$(command -v jq)" ]; then
  echo "----------------------------------------------------"
  echo "Installing 'jq' utility ..."
  sudo yum install jq -y
fi

# kubectl
# https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html
if ! [ -x "$(command -v kubectl)" ]; then
  echo "----------------------------------------------------"
  #rm kubectl
  echo "Downloading 'kubectl' ..."
  curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.15.10/2020-02-22/bin/linux/amd64/kubectl
  echo "Installing 'kubectl' ..."
  chmod +x ./kubectl
  mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
  #rm kubectl
fi

# aws-iam-authenicator`
# https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html
if ! [ -x "$(command -v aws-iam-authenicator)" ]; then
  echo "----------------------------------------------------"
  echo "Downloading 'aws-iam-authenticator' ..."
  rm aws-iam-authenticator
  curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.15.10/2020-02-22/bin/linux/amd64/aws-iam-authenticator
  echo "Installing 'aws-iam-authenticator' ..."
  chmod +x ./aws-iam-authenticator
  mkdir -p $HOME/bin && cp ./aws-iam-authenticator $HOME/bin/aws-iam-authenticator && export PATH=$PATH:$HOME/bin
  rm aws-iam-authenticator
fi

# Upgrade AWS cli
sudo rm /usr/bin/aws
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bashrc
export PATH="/usr/local/bin:$PATH"

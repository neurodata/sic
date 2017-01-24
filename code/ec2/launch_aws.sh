#!/bin/bash

# Step 0: Get instructions
# Go to http://docs.aws.amazon.com/cli/latest/userguide/tutorial-ec2-ubuntu.html


# Step 1: Install awscli
#sudo pip install awscli


# Step 2: Configure aws
#aws configure


# Step 3: Setup security group
#aws ec2 create-security-group --group-name gk-sic \
#                              --description "security group for sic deployment in EC2"
#aws ec2 authorize-security-group-ingress --group-name gk-sic \
#                                         --protocol tcp \
#                                         --port 22 \
#                                         --cidr 0.0.0.0/0
#aws ec2 authorize-security-group-ingress --group-name gk-sic \
#                                         --protocol tcp \
#                                         --port 80 \
#                                         --cidr 0.0.0.0/0
#aws ec2 authorize-security-group-ingress --group-name gk-sic \
#                                         --protocol tcp \
#                                         --port 443 \
#                                         --cidr 0.0.0.0/0
#aws ec2 authorize-security-group-ingress --group-name gk-sic \
#                                         --protocol tcp \
#                                         --port 8888 \
#                                         --cidr 0.0.0.0/0


# Step 4: Create keys
#aws ec2 create-key-pair --key-name gk-sic \
#                        --query 'KeyMaterial' \
#                        --output text > gk-sic.pem
#chmod 400 gk-sic.pem


# Step 5: Launch instance
image_id=ami-a58760b3
instance_id=$(aws ec2 run-instances --image-id ${image_id} \
                                 --security-group-ids gk-sic \
                                 --count  1 \
                                 --instance-type t2.micro \
                                 --key-name gk-sic \
                                 --query 'Instances[0].InstanceId' \
                                 2> /dev/null | cut -d '"' -f 2)
echo "Instance ID:" ${instance_id}

echo "Waiting for instance to exist..."
aws ec2 wait instance-exists --instance-ids ${instance_id} \
                             2> /dev/null

echo "Waiting for instance status to be 'OK'..."
aws ec2 wait instance-status-ok --instance-ids ${instance_id} \
                                2> /dev/null

instance_name="my_instance_bro"
echo "Naming instance:" ${instance_name}
aws ec2 create-tags --resources ${instance_id} \
                    --tags Key=Name,Value=${instance_name} \
                    2> /dev/null

instance_ip=$(aws ec2 describe-instances --instance-ids ${instance_id} \
                                         --query 'Reservations[0].Instances[0].PublicIpAddress' \
                                         2> /dev/null | cut -d '"' -f 2)
echo "Instance IP:" ${instance_ip}


# Step 7: Send command to instance
echo "Terminating instance:" ${instance_id}
aws ec2 terminate-instances --instance-ids ${instance_id} \
                            2> /dev/null \
                            1> /dev/null
echo "Done!"

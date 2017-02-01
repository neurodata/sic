#!/bin/bash

aws batch create-job-queue --cli-input-json file://json_files/queue.json

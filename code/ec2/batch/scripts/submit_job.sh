#!/bin/bash

aws batch submit-job --cli-input-json file://json_files/job.json

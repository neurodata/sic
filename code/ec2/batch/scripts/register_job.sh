#!/bin/bash

aws batch register-job-definition --cli-input-json file://json_files/definition.json

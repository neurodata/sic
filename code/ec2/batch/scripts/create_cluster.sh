#!/bin/bash

aws batch create-compute-environment --cli-input-json file://json_files/environment.json

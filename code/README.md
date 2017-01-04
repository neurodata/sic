# SIC Jupyter Server

This guide assumes you are using the home directory as your working direcotyr

### Step 1: Compile Docker Image

```
cd ~/sic/code/jupyter
docker build -t sic/ndmg .
```

### Step 2: Launch Docker Image

```
docker run -d -p 80:8888  sic/ndmg
```

### Step 3: Interact

Go to the IP address of the system you launched this on in your web broswer

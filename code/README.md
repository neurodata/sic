# SIC Jupyter Server

This guide assumes you are using the home directory as your working direcotyr

### Step 1: Compile Docker Image

```
cd ~/extensible-science-paper/code/jupyter
docker build -t sic/ndmg .
```

### Step 2: Clone ndmg

```
cd ~
git clone https://github.com/neurodata/ndmg ndmg
```

### Step 3: Launch Docker Image

```
docker run -d -p 80:8888 -v ~/ndmg/tests/data:/home/sic-user/data sic/ndmg
```

### Step 4: Interact

Go to the IP address of the system you launched this on in your web broswer

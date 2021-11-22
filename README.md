# platform-rk3399
Volumio rk3399 platform

# buiding

```
volumioBuildrootM4Build.sh
```

# rebuilding

```
cd /tmp/buildroot.volumio/buildroot.volumio
make
```

# developing

Alter code in /tmp/buildroot.volumio/buildroot.rk3399.external
As this is in the /tmp directory, you may want to clone the repo somewhere that wont dissappear when you reboot.

Then follow the last few lines of code in volumioBuildrootM4Build.sh to first run setup.sh. Then lastly make again.

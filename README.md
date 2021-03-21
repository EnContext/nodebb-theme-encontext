EnContext theme for NodeBB
====================
Solely owned by EnContext

Forked from nodebb-theme-persona


## Developing

### Environment setup

1.  Install VirtualBox
2. Install Vagrant
3. Run `vagrant up` in this directory. This will provision an Ubuntu 20 VM with NodeBB installed under the `/usr/src/app`.
4. Run `vagrant ssh` to connect to the VM.
5. Setup NodeBB by running:
```
cd /usr/src/app
./nodebb setup
```
DEPRECIATED Create a symbolic link from this folder to `node_modules` on the VM. This will allow you to edit this theme locally and automatically share the updates with the VM:
```
ln -fs /vagrant /usr/src/app/node_modules/nodebb-theme-encontext
```

6. Add our module to the package.json
```
npm install --save /vagrant
```

### Running NodeBB

```
./nodebb build
./nodebb dev
```
Vagrant is configured to run NodeBB at port 4567. To change, edit the `Vagrantfile` and run `vagrant reload`.

### Killing NodeBB when it gets stuck on a port
```
fuser -n tcp -k 4567
````

## Addons


## Screenshots


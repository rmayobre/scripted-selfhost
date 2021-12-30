# File Browser
[File Browser](https://filebrowser.org/) is a web based file manager/cloud interface. It provides a full file manager, with some additional features (including user authentication and a terminal). 

## FreeBSD (or TrueNas) Jail Setup
Create a jail, then mount any directorie(s) you want to manage using the File Browser webpage. NOTE: for multiple directories, make sure to have a parent directory to target; File Browser can only target one directory to host.

### Installing File Browser
For an up-to-date installation, follow the [Quick Setup](https://filebrowser.org/installation) guide under `Unix` to get the install script. Do **NOT** run `File Browser` yet. If it is running, stop the task. The initial install runs `File Browser` on `127.0.0.1:8080`; and if you are installing on a seperate machine, this is unaccessable. 

### Local Network Configuration
**NOTE: This section can be skipped if using rc script.**

First, get the ip address of your jail: For `TrueNas` you can use the web portal to find your jail's ip address, otherwise, use:
```shell
ifconfig
```
Now, configure `File Browser` to use the jail's ip address instead of `Local Host`.
```shell
# Replace "<JAIL_IP_ADDRESS_HERE>" with the actual address.
filebrowser config set --address <JAIL_IP_ADDRESS_HERE>
```
This is all you need to get up and running on a local network. For more configurations, look at the [config set](https://filebrowser.org/cli/filebrowser-config-set) reference page. For public access, look into using a `reverse proxy` on your network that is exposed to the public.

Now that networking is configured, you can run `File Browser` with the following command:
```shell
# Replace "/path/to/your/files" with the actual path.
filebrowser -r /path/to/your/files
```
However, this will not run `File Browser` in the background, nor will it re-start `File Browser` on reboot. To have `File Browser` start with jail on boot, continue to the next section about `rc scripting`

### RC Script
The [filebrowser_web](./filebrowser_web) script will help solve this problem. Make sure to exit the `filebrowser_web` at the line you see "`filebrowser_dir="/path/to/your/files"`". Replace `"/path/to/your/files"` with the actual path to your files.

Place the `filebrowser_web` file in the following directory: `/etc/rc.d/` and give it executable permissions:
```shell
mv filebrowser_web /etc/rc.d/      # Move from current directory
chmod +x /usr/local/etc/rc.d/filebrowser_web # Executable permissions
```

Append `filebrowser_web_enable='YES'` to `/etc/rc.conf`.
```shell
echo "filebrowser_web_enable='YES'" >> /etc/rc.conf
```

Now you can start your `File Browser` service with the following command:
```shell
service filebrowser_web start
```
# DEPRECATION NOTICE

Please note that this repository has been deprecated and is no longer actively maintained by Polyverse Corporation.  It may be removed in the future, but for now remains public for the benefit of any users.

Importantly, as the repository has not been maintained, it may contain unpatched security issues and other critical issues.  Use at your own risk.

While it is not maintained, we would graciously consider any pull requests in accordance with our Individual Contributor License Agreement.  https://github.com/polyverse/contributor-license-agreement

For any other issues, please feel free to contact info@polyverse.com

---
# readhook-node-echo-server
Test bed for using readhook to hook node-echo-server application.
## Running
```
docker run -d --rm -p 8080:8080 polyverse/readhook-node-echo-server
```
## Running interactively
```
docker run -it --rm -p 8080:8080 polyverse/readhook-node-echo-server /bin/sh
node echo-server.js
```

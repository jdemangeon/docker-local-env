# Docker Local Env

This project aims to demonstrate how we can create a simple, multi-repository setup to enhance local development using only `docker` / `docker-compose` and a simple `Makefile`.

It also demonstrate own we can share a common container stack by using a special ".devstack" folder (see README.md in this folder, it explain how to use it on another project).

Just open the two projects in their own console.

On `userbook`, just type `make install`. After install, type `make start db-migrate logs`
On `website`, just type `make install start logs`

Add the following lines into your `/etc/hosts` file.

```
127.0.0.1 website.dev.local
127.0.0.1 userbook_admin.dev.local
127.0.0.1 userbook_api.dev.local
```

Then, you'll be able to:

- See rails api on "http://userbook_api.dev.local/users"
- See admin backoffice on "http://userbook_admin.dev.local/#/users"
- See the front website on "http://website.dev.local/"

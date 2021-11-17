# Docker Local Env

This project aims to demonstrate how we can create a simple, multi-repository setup to enhance local development using only `docker` / `docker-compose` and a simple `Makefile`.

Just open the two projects in their own console.

On `userbook`, just type `make install`. After install, type `make start db-migrate logs`
On `website`, just type `make install start logs`

Then, you'll be able to:

- See rails api on "http://localhost:3000/users"
- See admin backoffice on "http://localhost:3002"
- See the front website on "http://localhost:3003"

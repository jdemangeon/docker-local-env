# DEVSTACK

This folder aims to provide all we need to run a common service stack between our containers from any project.

It allows to:

- Start and stop the common docker network
- Provide an `help` target to all makefiles that describe our current commands
- Start and stop shared containers for our projects

## Implementation notes

Just copy this folder anywhere in your project (usually at root) and follow the todo list bellow.

- Include this Makefile at the top our yours own (eg: `include ../.devstack/Makefile`)
- Include `install-stack` in front of your `install` target (eg: `install: install-stack`)
- Include `start-stack` in front of your `start` target (eg: `start: start-stack`)
- Include `stop-stack` at the end of your `stop` target (eg: `$(MAKE) stop-stack)`)

Set `sharednetwork` (the network used by this devstack) as your default (usually, if all your services are communicate with the common stack) docker network in your own docker-compose file. For example:

```
networks:
  default:
    external:
      name: sharednetwork
```

## Usage note

To add an entry on the `help` command output for one of our target, just add a double "#" sign after your target definition (in front of your comment).

Eg:

```bash
mytarget: ## My super command
    echo "It works!"
```

And that's it ! It'll handle all the rest ;)

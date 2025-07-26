# Hidale Documentation

This repository contains source content, markdown, html, code, etc. for
<https://docs.hidale.com>.

## Building

The environment to build the docs is within a Docker container managed
by `docker compose`.

1. `docker compose build` will build the container and install needed tools
2. `docker compose up -d` will start the container
3. Use any tool to get a prompt within the running container,
   e.g. `docker exec -ti jekyll bash`
4. `cd dp.docs` to enter into the `docs` folder mounted into the container

## Testing

1. Build the container
2. Get a prompt in the container's `/dp.docs/docs` folder
3. Start a local webserver on port 4000 with `bundle exec jekyll serve`
4. Use your browser and tools to view and test the content

## Contributing

Please follow our guidelines of [CONTRIBUTING.md](CONTRIBUTING.md). In short...

* Contributions, PRs, and corrections are welcome. Thank you! 🙂
* Please be kind and constructive.
* We reserve our right to deny contributions.

Often on each page of <https://docs.hidale.com> is a link to easily
"Edit this page on GitHub".

## License

The documentation content (e.g. markdown, html, source data, etc.)
is licensed under the [LICENSE](LICENSE).

All code in this repository is licensed under the [LICENSE-CODE](LICENSE-CODE).

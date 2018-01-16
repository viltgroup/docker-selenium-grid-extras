# Docker images for selenium grid extras Hub and Node with Chrome and Firefox


Images included:

- __minium/selenium-grid-extras-hub__: Image for running grid extras hub. Based on Alpine
- __minium/selenium-grid-extras-base__: Base images for selenium nodes. Based on Ubuntu LTS
- __minium/selenium-grid-extras-chrome__: Selenium Grid Extras Node with Chrome Latest
- __minium/selenium-grid-extras-firefox__: Selenium Grid Extras Node with Firefox Latest

All images are versioned after the [Selenium-Grid-Extras](https://github.com/groupon/Selenium-Grid-Extras) release number.

The images can be found in the [Docker Hub](https://hub.docker.com/u/minium/)


## Running the images

The easiest way is to run with docker-compose. There is at the root of the project a compose file (`hub-chrome-firefox.yml`) for running a Hub with 2 connected Nodes running Chrome and Firefox as an example:

``` bash
docker-compose -f hub-chrome-firefox.yml up 
```

Obviously you can also use the same configuration with just plain docker command line.

## Configuring the containers

### JAVA_OPTS Java Environment Options

You can pass `JAVA_OPTS` environment variable to java process in the docker command line, or by editing your docker-compose:

``` bash
    environment:
      - JAVA_OPTS=-Xms512m -Xmx512m
```

### SE_OPTS Selenium Configuration Options

You can pass `SE_OPTS` variable with additional commandline parameters for starting a hub or a node.

``` bash
    environment:
      - SE_OPTS=-debug true   
```


## Building the images

Clone the repo and from inside of each directoy you can build using docker-compose:

``` bash
docker-compose build
```

Keep in mind the `NodeBase` needs to be built before `NodeChrome` and `NodeFirefox`

Using Makefile to build all:

``` bash
SELENIUM_GRID_EXTRAS_VERSION=2.0.1 FIREFOX_VERSION=57.0.4 make build
```


## Troubleshooting

In case you need to troubleshoot you can change LOG levels of different components, by changing your docker enviornments or providing a `log4j.properties`

```
    environment:
      - SE_OPTS=-debug true   
    volumes:
       - ./log4j.properties:/opt/selenium/log4j.properties
```

For more information see: https://github.com/groupon/Selenium-Grid-Extras#changing-the-logging-on-the-grid-hub-nodes-or-selenium-grid-extras

## Known Issues:

- ~~Fullscreen doesn't work with Xvfb on Google Chrome~~ (https://github.com/seleniumhq/selenium-google-code-issue-archive/issues/6775) (Fixed by using fluxbox)

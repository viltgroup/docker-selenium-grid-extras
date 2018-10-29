NAME := minium/selenium-grid-extras
SELENIUM_VERSION := $(SELENIUM_VERSION)
SELENIUM_GRID_EXTRAS_VERSION := $(SELENIUM_GRID_EXTRAS_VERSION)
CHROME_VERSION := $(CHROME_VERSION)
FIREFOX_VERSION := $(FIREFOX_VERSION)

all: hub chrome firefox

build: all

hub: 
			cd ./Hub && SELENIUM_GRID_EXTRAS_VERSION=$(SELENIUM_GRID_EXTRAS_VERSION) docker-compose build --no-cache

nodebase: 
			cd ./NodeBase && SELENIUM_GRID_EXTRAS_VERSION=$(SELENIUM_GRID_EXTRAS_VERSION) docker-compose build --no-cache

chrome: 
			cd ./NodeChrome && docker-compose build --no-cache

firefox:
			cd ./NodeFirefox && FIREFOX_VERSION=$(FIREFOX_VERSION) docker-compose build --no-cache

release:
	docker push $(NAME)-hub:$(SELENIUM_GRID_EXTRAS_VERSION)
	docker push $(NAME)-base:$(SELENIUM_GRID_EXTRAS_VERSION)
	docker push $(NAME)-chrome:$(SELENIUM_VERSION)-$(SELENIUM_GRID_EXTRAS_VERSION)-$(CHROME_VERSION)
	docker push $(NAME)-firefox:$(SELENIUM_VERSION)-$(SELENIUM_GRID_EXTRAS_VERSION)-$(FIREFOX_VERSION)
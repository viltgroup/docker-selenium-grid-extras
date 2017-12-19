NAME := minium/selenium-grid-extras
SELENIUM_GRID_EXTRAS_VERSION := $(SELENIUM_GRID_EXTRAS_VERSION)
FIREFOX_VERSION := $(FIREFOX_VERSION)
all: hub chrome firefox

build: all

hub: 
			cd ./Hub && SELENIUM_GRID_EXTRAS_VERSION=$(SELENIUM_GRID_EXTRAS_VERSION) docker-compose build

nodebase: 
			cd ./NodeBase && SELENIUM_GRID_EXTRAS_VERSION=$(SELENIUM_GRID_EXTRAS_VERSION) docker-compose build

chrome: 
			cd ./NodeChrome && docker-compose build

firefox:
			cd ./NodeFirefox && FIREFOX_VERSION=$(FIREFOX_VERSION) docker-compose build
	

release:
	docker push $(NAME)-hub:$(SELENIUM_GRID_EXTRAS_VERSION)
	docker push $(NAME)-base:$(SELENIUM_GRID_EXTRAS_VERSION)
	docker push $(NAME)-chrome:$(SELENIUM_GRID_EXTRAS_VERSION)
	docker push $(NAME)-firefox:$(SELENIUM_GRID_EXTRAS_VERSION)
	

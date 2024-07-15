MAKE_PATH   = $(realpath .)
SITE_PATH   = $(realpath ./navilan.in)
STYLES_PATH = $(realpath ./styles)
STYLES_SOURCE  := ${shell ag --haskell -l "" $(STYLES_PATH) --ignore-dir dist}
DIST_PATH = ${SITE_PATH}/_site/

.PHONY: all clean build_site build_styles build rebuild rebuild_site watch serve

all:
	@make build

clean_site:
	@cd $(SITE_PATH) && stack run site-www -- clean

clean_styles:
	@cd $(STYLES_PATH) && stack run navilan-styles -- clean

clean: clean_site clean_styles

build_site:
	@cd $(SITE_PATH) && stack run site-www -- build -v

build_styles:
	@cd $(STYLES_PATH) && stack run navilan-styles -- $(SITE_PATH)/media/styles/styles.css

build: build_styles build_site

rebuild_site: clean_site build_site

rebuild_styles: clean_styles build_styles

rebuild: rebuild_styles rebuild_site

watch_site: build_site
	@cd $(SITE_PATH) && stack run site-www -- watch --no-server

watch_styles: build_styles
	@cd $(STYLES_PATH) && stack build navilan-styles --file-watch --exec "cd ${MAKE_PATH} && make build_styles"

serve:
	@cd $(DIST_PATH) && live-server \
		 --port=9295 \
		 --wait=1000 \
		 --verbose \
		 --no-browser

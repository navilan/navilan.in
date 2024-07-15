.DEFAULT_GOAL    := usage
SOURCE_PATH      := $(shell realpath -m "./web")
SITE_ROOT        := $(shell realpath -m "./web/navilan.in/")
SITE_DIR         := _site
AWS_PROFILE      := navilan
ENTRY            := "http://localhost:9294/index.html"
NODE_PACKAGES    := $(shell realpath -m "./node-packages/node_packages.nix")
PACKAGES_JSON    := $(shell realpath -m "./node-packages/packages.json")
BUCKET           := s3://navilan.in
DIST_ID          := E37FYJAIT9GBYS


.PHONY: usage installEnv cleanupEnv publish syncstatus


usage:
	@echo "Run make all to publish"
	@echo "Run make installEnv to install a new site website environment"


$(NODE_PACKAGES): $(PACKAGES_JSON)
	@cd node-packages && node2nix --nodejs-12 -i packages.json


installEnv: $(NODE_PACKAGES)
	@nix-env -f default.nix -i


cleanupEnv:
	@nix-env -e site-www

syncstatus:
	@echo "REBUILDING "
	@cd $(SOURCE_PATH) && make rebuild
	@echo "STATUS " $(SITE_ROOT)/$(SITE_DIR)
	@cd $(SITE_ROOT) && aws s3 sync $(SITE_DIR) \
		$(BUCKET) \
		--dryrun \
		--delete \
		--cache-control max-age=31536000,public \
		--profile $(AWS_PROFILE)

publish:
	@echo "REBUILDING "
	@cd $(SOURCE_PATH) && make rebuild
	@echo "PUBLISHING " $(SITE_ROOT)/$(SITE_DIR)
	@cd $(SITE_ROOT) && aws s3 sync $(SITE_DIR) \
		$(BUCKET) \
		--delete \
		--cache-control max-age=31536000,public \
		--profile $(AWS_PROFILE)
	@echo "Fixing styles"
	@aws s3 cp $(BUCKET)/media/styles/styles.css $(BUCKET)/media/styles/styles.css \
		--metadata-directive REPLACE --cache-control max-age=300,must-revalidate \
		--content-type text/css \
		--profile $(AWS_PROFILE)
	@echo "Fixing indices"
	@aws s3 cp $(BUCKET)/en/index.html $(BUCKET)/en/index.html \
		--metadata-directive REPLACE --cache-control max-age=0,no-cache,no-store,must-revalidate \
		--content-type text/html \
		--profile $(AWS_PROFILE)
	@aws s3 cp $(BUCKET)/ta/index.html $(BUCKET)/ta/index.html \
		--metadata-directive REPLACE --cache-control max-age=0,no-cache,no-store,must-revalidate \
		--content-type text/html \
		--profile $(AWS_PROFILE)
	@echo "Invalidating cloudfront"
	@aws cloudfront create-invalidation \
		--distribution-id  $(DIST_ID) \
		--paths '/*' \
		--profile $(AWS_PROFILE)


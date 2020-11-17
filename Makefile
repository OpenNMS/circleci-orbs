VERSION=2.3.1

ORBS=\
     workspace/branch-management.yml \
     workspace/sign-packages.yml

all: $(ORBS)

clean:
	rm -rf workspace/*.yml

workspace/%.yml: %/*.yml %/commands/*.yml %/examples/*.yml
	circleci config pack $$(dirname "$<") > "$@"

publish: $(ORBS)
	$(foreach ORB, $(ORBS), \
		ORBFILE=$$(basename "$(ORB)" | cut -d. -f1); \
		circleci orb publish "$(ORB)" "opennms/$$ORBFILE@$(VERSION)"; \
	)

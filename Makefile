BUILD-NUMBER = 0

.PHONY: doctor
doctor:
	fvm flutter doctor
	
.PHONY: devices
devices:
	fvm flutter devices
	
.PHONY: clean
clean:
	fvm flutter clean
	
.PHONY: pub-get
pub-get:
	fvm flutter pub get

.PHONY: build-runner
build-runner:
	fvm flutter pub pub run build_runner watch --delete-conflicting-outputs

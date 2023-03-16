SHELL := /bin/bash
VENV_NAME=.venv
PIP=$(VENV_NAME)/bin/pip3

deps: $(VENV_NAME)
	python3 -m virtualenv ./.venv
	sudo apt update
	sudo apt install -y git xclip xsel zip unzip openjdk-17-jdk python3-pip autoconf libtool pkg-config zlib1g-dev libncurses5-dev libncursesw5-dev libtinfo5 cmake libffi-dev libssl-dev
	$(PIP) install --upgrade Cython==0.29.33 virtualenv
	$(PIP) install -r requirements.txt
	buildozer init

clean:
	rm -rf .venv
	rm -rf buildozer.spec

build-android:
	buildozer -v android debug

install:
	adb install ./bin/kvcalc-0.1-arm64-v8a_armeabi-v7a-debug.apk
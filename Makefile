CC=gcc
CFLAGS= -Wall -Werror -g
LD:=$(CC)
Target:=bin
TOP_DIR:=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))
SRC_PATH:=$(TOP_DIR)SRC
INC_PATH:=$(TOP_DIR)INC
BUILD_PATH:=$(TOP_DIR)build
OBJ_PATH:=$(BUILD_PATH)/temp
BIN_PATH:=$(BUILD_PATH)/bin
SRC:=$(foreach dir,$(SRC_PATH),$(wildcard $(dir)/*.c))
SRC_WITHOUT_DIR:=$(notdir $(SRC))
OBJ_WITHOUT_DIR:=$(patsubst %.c,%.o,$(SRC_WITHOUT_DIR))
OBJ_WITH_BUILD_DIR:=$(addprefix $(OBJ_PATH)/,$(OBJ_WITHOUT_DIR))
VPATH=$(SRC_PATH)
ARG?=

all: build_prepare $(BIN_PATH)/$(Target)

run: all
	@$(BIN_PATH)/$(Target) $(ARG)

$(BIN_PATH)/$(Target): $(OBJ_WITH_BUILD_DIR)
	@echo + LD $@
	@$(LD) -I $(INC_PATH) -o $@ $^

$(OBJ_PATH)/%.o: %.c
	@echo + CC $<
	@mkdir -p $(dir $@)
	@$(CC) -c $(CFLAGS) -o $@ $<
	$(call call_fixdep, $(@:.o=.d), $@)

build_prepare:
	@if [ ! -d $(BUILD_PATH) ]; then \
	mkdir -p $(OBJ_PATH); \
	mkdir -p $(BIN_PATH); \
	fi

clean:
	-rm -rf $(BUILD_PATH)
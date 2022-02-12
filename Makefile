TARGET?=silver

RUN_ARGS?=test.sas

INC_DIR=./silver/cpp/headers/

CPP_SRC=$(shell find -name "**.cpp")
CPP=clang++
# TODO: re-enable -Werror
CPP_FLAGS=-fmodules-ts -Wall -Wextra -I$(INC_DIR) -std=c++20

OUTPUT_DIR=./out
FULL_TARGET=$(OUTPUT_DIR)/$(TARGET)

.PHONY = run

run : $(FULL_TARGET)
	$(FULL_TARGET) $(RUN_ARGS)

$(FULL_TARGET) : $(CPP_SRC)
	$(CPP) -o $@ $^ $(CPP_FLAGS)

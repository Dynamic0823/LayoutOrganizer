export BASEDIR=$(shell 'pwd')
export APPS=main
export OUTPUT_DIR=$(BASEDIR)/output

include $(BASEDIR)/Src/Makefile
INC_LIST= -I$(BASEDIR)/Src

export CXX=g++
export CFLAGS=-Wall -Werror -C $(INC_LIST)
export LD=ld
all: src_obj out_dirs app_list


define app_build
$(OUTPUT_DIR)/$(1): $(BASEDIR)/Src/src_obj.o $(BASEDIR)/App/$(1).cpp
	@echo "Build App $(1)"
APP_LIST +=$(OUTPUT_DIR)/$(1)
endef


$(foreach app,$(APPS),$(eval $(call app_build,$(app))))

src_obj: $(OBJ_LIST)
	@echo "$(OBJ_LIST)"
	ld -r -o $(BASEDIR)/Src/src_obj.o $(OBJ_LIST)

app_list: $(APP_LIST)

out_dirs:
	mkdir -p $(OUTPUT_DIR)
clean:
	rm -rf output
	rm -rf *.o
	rm -rf *~
	rm -rf \#*

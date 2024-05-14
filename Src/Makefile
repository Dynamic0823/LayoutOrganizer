SRCS=Foo.cpp

define compile_src
OBJ=$(patsubst %.cpp,%.o,$(1))

$(OBJ): $(1)
	@echo "Compile $@: $^"
	$(CXX) $(CFLAGS) $@ $^

OBJ_LIST +=$(BASEDIR)/Src/Foo.o
endef

$(foreach src,$(SRCS),$(eval $(call compile_src,$(src))))




build/%.lua: %.fnl
	@mkdir -p $(dir $@)
	fennel --compile $< > $@

SRC := $(wildcard **/*.fnl) $(wildcard *.fnl)
OUT := $(addprefix build/, $(SRC:.fnl=.lua))
sbar: $(OUT)

.PHONY: clean
clean:
	$(RM) $(OUT)

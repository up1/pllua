MODULES = pllua
DATA_built = pllua.sql
PG_CPPFLAGS = -I/usr/include/lua5.1

PGXS := $(shell pg_config --pgxs)
include $(PGXS)

%.sql: %.source
	rm -f $@; \
	C=`pg_config --pkglibdir`; \
	sed -e "s:_OBJWD_:$$C:g" < $< > $@

pllua.so : pllua.o
	$(CC) -shared -o $@ $< -llua5.1

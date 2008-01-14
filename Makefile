# Makefile for PL/Lua
# $Id: Makefile,v 1.8 2008/01/14 16:45:41 carvalho Exp $

# Lua specific

# General
LUAINC =
LUALIB = -llua

# Debian/Ubuntu
#LUAINC = -I/usr/include/lua5.1
#LUALIB = -llua5.1

# Fink
#LUAINC = -I/sw/include -I/sw/include/postgresql
#LUALIB = -L/sw/lib -llua

# no need to edit below here
MODULE_big = pllua
DATA_built = pllua.sql
OBJS = pllua.o plluaapi.o plluaspi.o
PG_CPPFLAGS = $(LUAINC)
SHLIB_LINK = $(LUALIB)

PGXS := $(shell pg_config --pgxs)
include $(PGXS)


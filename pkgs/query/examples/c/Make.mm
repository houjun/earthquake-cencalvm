# -*- Makefile -*-
#
# ----------------------------------------------------------------------
#
#                           Brad T. Aagaard
#                        U.S. Geological Survey
#
# {LicenseText}
#
# ----------------------------------------------------------------------
#

PROJECT = cencalvm
PACKAGE = query/examples/c

include local.def

PROJ_SRCS = \
	cencalvmcquery.c \


PROJ_BIN = $(PROJ_BINDIR)/cencalvmcquery

TEST_PRE1.0_ARGS = -d data/ver-pre1.0/cencalvm-pre1.0.etree -i ../data/sample-pre1.0.in -o test.out -l test.log

TEST_05.0.0_ARGS = -d data/ver-05.0.0/USGSBayAreaVM-05.0.0.etree -i ../data/sample-05.0.0.in -o test.out -l test.log

# ----------------------------------------------------------------------
all: $(PROJ_BIN)

$(PROJ_BIN):: product_dirs $(PROJ_OBJS)
	$(CC) -o $@ $(LCXXFLAGS) $(PROJ_OBJS)

test-pre1.0:
	@LD_LIBRARY_PATH=$$LD_LIBRARY_PATH:$(BLD_LIBDIR) $(PROJ_BIN) $(TEST_PRE1.0_ARGS)

test test-05.0.0:
	@LD_LIBRARY_PATH=$$LD_LIBRARY_PATH:$(BLD_LIBDIR) $(PROJ_BIN) $(TEST_05.0.0_ARGS)

export:: export-binaries

tidy::
	BLD_ACTION="tidy" $(MM) recurse

clean::
	BLD_ACTION="clean" $(MM) recurse

EXPORT_BINS = $(PROJ_BIN)

# version
# $Id$

# End of file 

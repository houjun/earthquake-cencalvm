# -*- Makefile -*-
#
# ----------------------------------------------------------------------
#
#                           Brad T. Aagaard
#                        U.S. Geological Survey
#
# <LicenseText>
#
# ----------------------------------------------------------------------
#

PROJECT = cencalvm
PACKAGE = query

RECURSE_DIRS = \
	lib \
	apps \

OTHERS = \

# ----------------------------------------------------------------------

all:
	BLD_ACTION="all" $(MM) recurse

clean::
	BLD_ACTION="clean" $(MM) recurse

tidy::
	BLD_ACTION="tidy" $(MM) recurse

# version
# $Id$

# End of file 
FC=gfortran
DEBUG=-g -O2
COPTS=$(DEBUG)

SRCS=$(wildcard *.F90)
OBJS=$(patsubst %.F90,%.o,$(SRCS))

.SUFFIXES:

.SUFFIXES: .o .F90

$(OBJS) : %.o : %.F90
	$(FC) $(COPTS) -c -o $@ $^

test : $(OBJS)
	$(FC) $(COPTS) -o $@ $^

test_qsort.o : mod_qsort.o

debug :
	@echo "SRCS = $(SRCS)"
	@echo "OBJS = $(OBJS)"

clean :
	@rm -rf $(OBJS) *.mod

.PHONY: debug clean

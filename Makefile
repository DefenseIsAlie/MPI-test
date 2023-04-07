MPICXX=mpiCC

DEBUG ?= 0
ifeq ($(DEBUG), 1)
	CXXFLAGS=-O0 -g -std=c++11 -DDEBUG
else
	CXXFLAGS=-O3 -g -std=c++11
endif

EXECUTABLE =  summa summa_nb summa_check summa_nb_check
SRC=summa.cpp
all: $(EXECUTABLE)

summa: summa.cpp
	LANG=en_US.utf8
	LC_ALL=en_US.utf8
	$(MPICXX) $(CXXFLAGS) -o $@ $^

summa_nb: summa.cpp
	$(MPICXX) $(CXXFLAGS) -o $@ $^

summa_check: summa.cpp
	$(MPICXX) -DCHECK_NUMERICS $(CXXFLAGS) -o $@ $^

summa_nb_check: summa.cpp
	$(MPICXX) -DCHECK_NUMERICS $(CXXFLAGS) -o $@ $^

clean:
	rm -f *.o *~ core $(EXECUTABLE)

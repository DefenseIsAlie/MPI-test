MPICXX=mpiicpc

ifeq ($(LOCAL),1)
	MPICXX=mpic++
endif

DEBUG ?= 0
ifeq ($(DEBUG), 1)
	CXXFLAGS=-O0 -g -std=c++11 -DDEBUG
else
	CXXFLAGS=-O3 -g -std=c++11
endif

EXECUTABLE =  test  
SRC=main.cpp
all: $(EXECUTABLE)

test: main.cpp
	LANG=en_US.utf8 $(MPICXX) $(CXXFLAGS) -o $@ $^

team:
	@echo Abhishek Josyula 200010021@iitdh.ac.in

clean:
	rm -f *.o *~ core $(EXECUTABLE)

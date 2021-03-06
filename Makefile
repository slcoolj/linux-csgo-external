CXX=g++
CXXFLAGS=-m32 -std=c++11 

.PHONY: all bin

all: bin/cheat

bin:
	-mkdir bin

bin/%.o: bin src/%.cpp 
	$(CXX) $(CXXFLAGS) -c -Iinclude src/$*.cpp -o $@

bin/cheat: bin bin/log.o bin/remote.o bin/netvar.o bin/hack.o bin/main.o
	$(CXX) $(CXXFLAGS) -Iinclude -Lbin bin/*.o -o $@

clean:
	-rm bin/cheat bin/*.o


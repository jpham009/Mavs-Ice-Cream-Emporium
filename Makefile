#compiler options
CXXFLAGS+=--std=c++11 -g

#source files
SOURCES=$(wildcard *.cpp)

#object files
OBJECTS=$(SOURCES:.cpp=.o)

#main link objects
MOBJECTS=$(filter-out test.o,$(OBJECTS))

#test link objects
TOBJECTS=$(filter-out main.o,$(OBJECTS))

#included libraries
INCLUDE=

#executable filename
EXECUTABLE=mice

#Special symbols used:
#$^ - is all the dependencies (in this case =$(OBJECTS) )
#$@ - is the result name (in this case =$(EXECUTABLE) )

$(EXECUTABLE): $(MOBJECTS)
	$(CXX) $(CXXFLAGS) $^ -o $@ $(INCLUDE)

test: $(TOBJECTS)
	$(CXX) $(CXXFLAGS) $^ -o $@ $(INCLUDE)

debug: CXXFLAGS+= -g
debug: $(EXECUTABLE)

%.o: %.cpp *.h
	$(CXX) $(CXXFLAGS) $(INCLUDE) -c $< -o $@

clean:
	-rm -f $(EXECUTABLE) test $(OBJECTS)


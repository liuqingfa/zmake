#  THIS DIRECTORY
DIR5a371ca09d660bb6863a788a9b8e6034:=$(ROOT)/algorithm/diffpar
#  ALL C/C++ FILES IN THIS DIRECTORY (WITHOUT PATHNAME)
$(DIR5a371ca09d660bb6863a788a9b8e6034)C:=$(wildcard *.c)
$(DIR5a371ca09d660bb6863a788a9b8e6034)CPP:=$(wildcard *.cpp)
#  DIRECTORY-SPECIFIC COMPILING FLAGS AND INCLUDE DIRECTORIES
$(DIR5a371ca09d660bb6863a788a9b8e6034)CFLAGS:=$(CFLAGS)
$(DIR5a371ca09d660bb6863a788a9b8e6034)CXXFLAGS:=$(CXXFLAGS)
$(DIR5a371ca09d660bb6863a788a9b8e6034)INCS:=$(INCS)
$(DIR5a371ca09d660bb6863a788a9b8e6034)LIBS:=$(LIBS)

DEP+=$($(DIR5a371ca09d660bb6863a788a9b8e6034)CPP:%.cpp=$(DIR5a371ca09d660bb6863a788a9b8e6034)/%.d) $($(DIR5a371ca09d660bb6863a788a9b8e6034)C:%.c=$(DIR5a371ca09d660bb6863a788a9b8e6034)/%.d)
OBJ+=$($(DIR5a371ca09d660bb6863a788a9b8e6034)CPP:%.cpp=$(DIR5a371ca09d660bb6863a788a9b8e6034)/%.o) $($(DIR5a371ca09d660bb6863a788a9b8e6034)C:%.c=$(DIR5a371ca09d660bb6863a788a9b8e6034)/%.o)
ASM+=$($(DIR5a371ca09d660bb6863a788a9b8e6034)CPP:%.cpp=$(DIR5a371ca09d660bb6863a788a9b8e6034)/%.s) $($(DIR5a371ca09d660bb6863a788a9b8e6034)C:%.c=$(DIR5a371ca09d660bb6863a788a9b8e6034)/%.s)

$(DIR5a371ca09d660bb6863a788a9b8e6034)/%.o: $(DIR5a371ca09d660bb6863a788a9b8e6034)/%.c
	$(QUIET)$(CC) -o $@ -c $< $(DEPFLAGS) $($(DIR5a371ca09d660bb6863a788a9b8e6034)CFLAGS) $($(DIR5a371ca09d660bb6863a788a9b8e6034)INCS)
	$(QUIET)echo "Compiling $(notdir $<) ..."
$(DIR5a371ca09d660bb6863a788a9b8e6034)/%.s: $(DIR5a371ca09d660bb6863a788a9b8e6034)/%.c
	$(QUIET)$(CC) -o $@ $< $(ASMFLAGS) $($(DIR5a371ca09d660bb6863a788a9b8e6034)CFLAGS) $($(DIR5a371ca09d660bb6863a788a9b8e6034)INCS)

$(DIR5a371ca09d660bb6863a788a9b8e6034)/%.o: $(DIR5a371ca09d660bb6863a788a9b8e6034)/%.cpp
	$(QUIET)$(CXX) -o $@ -c $< $(DEPFLAGS) $($(DIR5a371ca09d660bb6863a788a9b8e6034)CXXFLAGS) $($(DIR5a371ca09d660bb6863a788a9b8e6034)INCS)
	$(QUIET)echo "Compiling $(notdir $<) ..."
$(DIR5a371ca09d660bb6863a788a9b8e6034)/%.s: $(DIR5a371ca09d660bb6863a788a9b8e6034)/%.cpp
	$(QUIET)$(CXX) -o $@ $< $(ASMFLAGS) $($(DIR5a371ca09d660bb6863a788a9b8e6034)CXXFLAGS) $($(DIR5a371ca09d660bb6863a788a9b8e6034)INCS)

# Linking pattern rule for this directory
%.exe: $(DIR5a371ca09d660bb6863a788a9b8e6034)/%.o
	$(QUIET)$(CXX) -o $@ $^ $($(DIR5a371ca09d660bb6863a788a9b8e6034)LIBS)
	$(QUIET)echo "Linking $(notdir $@) ..."

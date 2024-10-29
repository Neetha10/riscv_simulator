CXX = g++
CXXFLAGS = -std=c++11 -Wall

TARGET = riscv_simulator

all: $(TARGET)

$(TARGET): src/riscv_simulator.cpp
	$(CXX) $(CXXFLAGS) -o $(TARGET) src/riscv_simulator.cpp

clean:
	rm -f $(TARGET)

run: $(TARGET)
	./$(TARGET) input/

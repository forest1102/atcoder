#include "../utils/bits.hpp"
#include <iostream>
using namespace std;

int main() {
    bitset< 16 > bit("1010000");
    cout << BitUtil::lowestBit(bit).to_string() << endl;
    return 0;
}
#include <bitset>

using namespace std;
namespace BitUtil {
template < size_t T > bool includes(bitset< T > a, bitset< T > b) {
    return ((~a & b) == 0);
}
template < size_t size > bitset< size > lowestBit(bitset< size > a) {
    return a.to_ullong() & (-a.to_ullong());
}
}; // namespace BitUtil
#include <functional>
#include <iostream>
#include <type_traits>
#include <vector>

using namespace std;
template < typename T, typename Func >
pair< T, bool > general_binary_search(T min, T max, const Func &f) {
    static_assert(std::is_integral< T >::value, "Integral required.");
    while(min <= max) {
        T mid = (min + max) / 2;
        int val = f(mid);
        if(val == 0) {
            return make_pair(mid, true);
        } else if(val > 0) {
            min = mid + 1;
        } else {
            max = mid - 1;
        }
    }
    return make_pair(0, false);
}

int main() {
    vector< int > v{1, 2, 3, 4, 5};

    auto i = general_binary_search(0, (int)v.size() - 1,
                                   [&](int a) { return 4 - v[a]; });
    cout << i.first << endl;
}
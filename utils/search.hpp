#include <type_traits>

using namespace std;
template < typename T, typename Func >
bool general_binary_search(T min, T max, const Func &f) {
    static_assert(std::is_integral< T >::value, "Integral required.");
    while(min <= max) {
        T mid = (min + max) / 2;
        int val = f(mid);
        if(val == 0) {
            return true;
        } else if(val > 0) {
            min = mid + 1;
        } else {
            max = mid - 1;
        }
    }
    return false;
}

template < typename T, typename Func >
T general_lower_bound(T ok, T ng, const Func &check) {
    static_assert(std::is_integral< T >::value, "Integral required.");

    while(ok + 1 < ng) {
        T mid = (ok + ng) / 2;
        if(check(mid)) {
            ok = mid;
        } else {
            ng = mid;
        }
    }
    return ok;
}
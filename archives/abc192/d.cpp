#pragma region
#include <algorithm>
#include <iostream>
#include <math.h>
#include <string>
#include <vector>
using namespace std;
#define FOR(i, l, r) for(size_t i = (l); i < (r); ++i)
#define rep(i, n) for(int i = 0; i < (int)(n); i++)
#define rrep(i, n) for(int i = (n)-1; i >= 0; --i)
#define fore(a, all) for(auto &a : all)
#define cfore(a, all) for(const auto &a : all)
#define ull unsigned long long
#define ll long long
#define ul unsigned long
template < class T > using vec2d = vector< vector< T > >;
#pragma endregion

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

int main() {
    string X;
    ll M;
    cin >> X >> M;
    if(X.length() == 1) {
        ll x = stoll(X);
        cout << (x <= M ? "1" : "0") << endl;
        return 0;
    }

    int a = -1;
    cfore(c, X) { a = max(a, (c - '0')); }
    int cnt = 0;
    ll d_low = a;
    ll d_max = M;
    // cout << d_low << "-" << d_max << endl;

    auto d_res = general_lower_bound(d_low, d_max + 1, [X, M](ll d) {
        // cout << "d: " << d << endl;
        vector< ll > Y;
        ll m = M;
        while(0 < m) {
            Y.push_back(m % d);
            m /= d;
        }
        if(X.size() < Y.size())
            return true;
        else if(X.size() > Y.size())
            return false;

        auto x_itr = X.cbegin();
        auto y_itr = Y.rbegin();
        for(; x_itr != X.cend() && y_itr != Y.rend(); ++x_itr, ++y_itr) {
            ll x = *x_itr - '0', y = *y_itr;
            if(x == y)
                continue;
            else if(x < y)
                return true;
            else
                return false;
        }
        return true;
    });
    cout << d_res - d_low << endl;

    return 0;
}
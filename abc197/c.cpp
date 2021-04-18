#pragma region
#include <bits/stdc++.h>
using namespace std;
#define FOR(i, l, r) for(size_t i = (l); i < (r); ++i)
#define rep(i, n) for(int i = 0; i < (int)(n); i++)
#define rrep(i, n) for(int i = (n)-1; i >= 0; --i)
#define rfor(v, vec) for(auto &v : (vec))
#define itrloop(itr, begin, end) for(auto itr = (begin); itr != end; ++itr)
#define crfor(v, vec) for(const auto &v : (vec))
#define all(x) x.begin(), x.end()
#define call(x) x.cbegin(), x.cend()
#define rall(x) x.rbegin(), x.rend()
#define ull unsigned long long
#define ll long long
#define ul unsigned long
template < class T > using vec2d = vector< vector< T > >;
#pragma endregion

int main() {
    int N;
    cin >> N;
    vector< ull > A(N);
    rfor(a, A) cin >> a;

    ull res = 1 << 31;
    rep(i, 1 << (N - 1)) {
        ull xored = 0;
        ull ored = 0;
        for(int j = 0; j <= N; j++) {
            if(j < N)
                ored |= A[j];
            if(j == N || (i >> j & 1))
                xored ^= ored, ored = 0;
        }
        res = min(res, xored);
    }
    cout << res << endl;

    return 0;
}
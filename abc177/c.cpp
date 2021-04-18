#pragma region
#include <iostream>
#include <vector>
using namespace std;
#define FOR(i, l, r) for(size_t i = (l); i < (r); ++i)
#define rep(i, n) for(int i = 0; i < (int)(n); i++)
#define rrep(i, n) for(int i = (n)-1; i >= 0; --i)
#define ull unsigned long long
#define rfor(v, vec) for(auto &v : vec)
#define ll long long
#define ul unsigned long
template < class T > using vec2d = vector< vector< T > >;
#pragma endregion

int main() {
    int N;
    const ull MOD = 1000000007;
    cin >> N;
    vector< ull > vec(N);
    rfor(p, vec) { cin >> p; }
    ull res = 0;
    ull S = 0;
    for(const auto &a : vec) {
        res += S * a;
        res %= MOD;
        S += a;
        S %= MOD;
    }
    cout << res << endl;
    return 0;
}
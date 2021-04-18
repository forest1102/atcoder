#pragma region
#include <iostream>
#include <vector>
using namespace std;
#define FOR(i, l, r) for(size_t i = (l); i < (r); ++i)
#define rep(i, n) for(int i = 0; i < (int)(n); i++)
#define rrep(i, n) for(int i = (n)-1; i >= 0; --i)
#define ull unsigned long long
#define ll long long
#define ul unsigned long
template < class T > using vec2d = vector< vector< T > >;
#pragma endregion

ll vec_mul(const vector< ll > &vec) {
    ll res = 0;
    ll S = 0;
    for(const auto &a : vec) {
        res += S * a;
        S += a;
    }
    return res;
}

int main() {
    ll N;
    cin >> N;
    vector< ll > A(N);
    ll sq = 0;
    for(auto &a : A) {
        cin >> a;
        sq += a * a;
    }

    ll res = (N - 1) * sq - 2 * vec_mul(A);
    cout << res << endl;
    return 0;
}
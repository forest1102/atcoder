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

int main() {
    int N;
    cin >> N;
    vector< ll > A(N);
    vector< ll > B(N);
    rep(i, N) cin >> A[i] >> B[i];

    ll res = 200000 + 1;
    rep(i, N) {
        rep(j, N) {
            ll time;
            if(i == j)
                time = A[i] + B[j];
            else
                time = max(A[i], B[j]);
            res = min(res, time);
        }
    }
    cout << res << endl;
    return 0;
}
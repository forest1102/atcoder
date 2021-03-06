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

const long long MOD = 998244353;

// Generated by 1.1.7.1 https://github.com/kyuridenamida/atcoder-tools  (tips:
// You use the default template now. You can remove this line by using your
// custom template)
int main() {
    long long N;
    cin >> N;
    std::vector< ull > A(N);
    for(int i = 0; i < N; i++) {
        cin >> A[i];
    }
    sort(all(A));
    ull ans = 0;
    ull S = 0;
    crfor(a, A) {
        ans += a * a;
        ans += S * a;
        ans %= MOD;
        S = (S * 2) + a;
        S %= MOD;
    }
    cout << ans << endl;
    return 0;
}

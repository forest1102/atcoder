#pragma region
#include <algorithm>
#include <iostream>
#include <map>
#include <vector>
using namespace std;
#define FOR(i, l, r) for(size_t i = (l); i < (r); ++i)
#define rep(i, n) for(int i = 0; i < (int)(n); i++)
#define rrep(i, n) for(int i = (n)-1; i >= 0; --i)
#define rfor(v, vec) for(auto &v : (vec))
#define crfor(v, vec) for(const auto &v : (vec))
#define itrloop(itr, begin, end) for(auto itr = begin; itr != end; ++itr)
#define all(x) x.begin(), x.end()
#define call(x) x.cbegin(), x.cend()
#define rall(x) x.rbegin(), x.rend()
#define is_in(a, b, c) a <= b &&b <= c
#define ull unsigned long long
#define ll long long
#define ul unsigned long
template < class T > using vec2d = vector< vector< T > >;
#pragma endregion

int main() {
    int N, M, Q;
    cin >> N >> M >> Q;
    vector< ll > w(N), v(N);
    rep(i, N) { cin >> w[i] >> v[i]; }
    vector< ll > x(M);
    rfor(i, x) { cin >> i; }
    rep(i, Q) {
        int l, r;
        cin >> l >> r;
        --l;
        --r;
        vector< ll > cur_x(x.begin(), x.begin() + l);
        vector< bool > used(N);
        cur_x.insert(cur_x.end(), x.begin() + r + 1, x.end());
        ull res = 0;
        sort(all(cur_x));
        crfor(x, cur_x) {
            pair< ll, ll > best(-1, -1);
            rep(i, N) {
                if(used[i])
                    continue;
                if(w[i] > x)
                    continue;
                best = max(best, make_pair(v[i], (long long)i));
            }
            int i = best.second;
            if(i == -1)
                continue;
            used[i] = true;
            res += v[i];
        }
        cout << res << endl;
    }
    return 0;
}
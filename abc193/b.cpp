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
#define INF 10000000000
template < class T > using vec2d = vector< vector< T > >;
#pragma endregion

int main() {
    int N;
    cin >> N;
    ll min_ans = INF;
    rep(i, N) {
        ll a, p, x;
        cin >> a >> p >> x;
        if(x > a) {
            min_ans = min(min_ans, p);
        }
    }
    cout << ((min_ans < INF) ? min_ans : -1) << endl;
    return 0;
}
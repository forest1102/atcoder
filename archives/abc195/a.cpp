#pragma region
#include <iostream>
#include <vector>
using namespace std;
#define FOR(i, l, r) for(size_t i = (l); i < (r); ++i)
#define rep(i, n) for(int i = 0; i < (int)(n); i++)
#define rep(i, l, r) for(int i = l; i < (int)(r); i++)
#define rrep(i, n) for(int i = (n)-1; i >= 0; --i)
#define rfor(v, vec) for(auto &v : (vec))
#define crfor(v, vec) for(const auto &v : (vec))
#define all(x) x.begin(), x.end()
#define call(x) x.cbegin(), x.cend()
#define rall(x) x.rbegin(), x.rend()
#define yes_no(cond) cout << ((cond) ? "Yes" : "No") << endl;
#define ull unsigned long long
#define ll long long
#define ul unsigned long
template < class T > using vec2d = vector< vector< T > >;
#pragma endregion

// template<T> istream& operator<<(istream& in,vector<T> v){
//     rfor()
// }

int main() {
    int h, m;
    cin >> m >> h;
    // cout << (h % m == 0 ? "Yes" : "No") << endl;
    yes_no(h % m == 0);
    return 0;
}
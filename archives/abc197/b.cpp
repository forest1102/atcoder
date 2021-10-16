#pragma region
#include <iostream>
#include <vector>
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
    int H, W;
    cin >> H >> W;
    vector< string > field(H);

    int X, Y;
    cin >> X >> Y;
    --X;
    --Y;

    rfor(s, field) cin >> s;

    if(field[X][Y] == '#') {
        cout << 0 << endl;
        return 0;
    }
    int cnt = 1;
    rrep(i, X) {
        // cout << i << ", " << Y << endl;
        if(field[i][Y] == '#')
            break;
        else
            ++cnt;
    }
    FOR(i, X + 1, H) {
        // cout << i << ", " << Y << endl;
        if(field[i][Y] == '#')
            break;
        else
            ++cnt;
    }

    rrep(i, Y) {
        // cout << X << ", " << i << endl;
        if(field[X][i] == '#')
            break;
        else
            ++cnt;
    }
    FOR(i, Y + 1, W) {

        // cout << X << ", " << i << endl;
        if(field[X][i] == '#')
            break;
        else
            ++cnt;
    }
    cout << cnt << endl;
    return 0;
}
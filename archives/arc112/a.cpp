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
    ull t;
    cin >> t;
    while(t--) {
        ull l, r;
        cin >> l >> r;
        if(r < 2 * l)
            cout << 0 << endl;
        else
            cout << (r - 2 * l + 1) * (r - 2 * l + 2) / 2 << endl;
    }

    return 0;
}
#pragma region
#include <iostream>
#include <math.h>
#include <string>
#include <vector>
using namespace std;
#define ull unsigned long long
#define ll long long
#define ul unsigned long
#define FOR(i, l, r) for(size_t i = (l); i < (r); ++i)
#define rep(i, n) for(ull i = 0; i < (ull)(n); i++)
#define rrep(i, n) for(ull i = (n)-1; i >= 0; --i)
template < class T > using vec2d = vector< vector< T > >;
#pragma endregion

bool comp(string r, string t, ull i) {
    rep(j, t.size()) {
        if(r[(i + j) % 3] != t[j])
            return false;
    }
    return true;
}
#define SIZE 10000000000
int main() {
    ull n;
    cin >> n;
    string t;
    cin >> t;

    string s = "110";
    if(t == "1") {
        cout << 2 * SIZE << endl;

    } else {

        ull i = 0;
        for(; i < s.size(); ++i) {
            if(comp(s, t, i))
                break;
        }
        if(i == s.size())
            cout << 0 << endl;
        else {
            ull max_n = ceill((3 * SIZE - (i + t.size())) / 3.0l);

            cout << max_n + 1 << endl;
        }
    }
    return 0;
}
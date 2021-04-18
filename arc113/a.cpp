#pragma region
#include <iostream>
#include <string>
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

ull pow(ull a, ull b, ull p) {
    a %= p;
    if(a == 0 || a == 1)
        return a;
    ull res = 1;
    while(b--) {
        res *= a;
        res %= p;
    }
    return res;
}

int main() {
    string s;
    ull B, C;
    cin >> s >> B >> C;
    ull A = (ull)(s[s.size() - 1] - '0');
    ull t;
    switch(A) {
    case 0:
    case 1:
    case 5:
    case 6:
        cout << A << endl;
        break;
    default:
        switch(B % 4) {
        case 0:
            t = 4;
            break;
        case 1:
            t = 1;
            break;
        case 2:
            t = (C > 1) ? 4 : 2;
            break;
        case 3:
            t = (C % 2 == 0) ? 1 : 3;
            break;
        }
        cout << pow(A, t, 10) << endl;
        break;
    }
    return 0;
}
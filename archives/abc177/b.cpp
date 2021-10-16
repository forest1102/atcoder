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

int diff_num(const string &t1, const string &t2) {
    int res = 0;
    rep(i, t1.size()) {
        if(t1[i] != t2[i])
            ++res;
    }
    return res;
}

int main() {
    string S, T;
    cin >> S >> T;
    int min_diff = 10000;

    rep(i, S.size() - T.size() + 1) {
        int diff = diff_num(S.substr(i, T.size()), T);
        min_diff = min(diff, min_diff);
    }

    cout << min_diff << endl;
    return 0;
}
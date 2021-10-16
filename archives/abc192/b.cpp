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

int main() {
    string S;
    cin >> S;
    bool is_difficult = true;
    rep(i, S.size()) {
        if((i % 2 == 0 && !('a' <= S[i] && S[i] <= 'z')) ||
           (i % 2 == 1 && !('A' <= S[i] && S[i] <= 'Z'))) {
            is_difficult = false;
            break;
        }
    }
    cout << (is_difficult ? "Yes" : "No") << endl;
    return 0;
}
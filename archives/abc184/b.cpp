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
    int N, X;
    string S;
    cin >> N >> X >> S;
    for(const auto &c : S) {
        if(c == 'o')
            ++X;
        if(c == 'x' && X > 0)
            --X;
    }
    cout << X << endl;
    return 0;
}
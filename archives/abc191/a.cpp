#pragma region HEADER
#include <iostream>
using namespace std;
#pragma endregion

#pragma region MACRO
#define FOR(i, l, r) for(size_t i = (l); i < (r); ++i)
#define rep(i, n) for(size_t i = 0; i < (int)(n); i++)
#define rrep(i, n) for(size_t i = (n)-1; i >= 0; --i)
#pragma endregion

int main() {
    float V, S, T, D;
    cin >> V >> T >> S >> D;
    float t1 = D / V;
    cout << (T <= t1 && t1 <= S ? "No" : "Yes") << endl;
    return 0;
}
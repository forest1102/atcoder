#pragma region
#include <iostream>
#include <vector>
using namespace std;
#define FOR(i, l, r) for(size_t i = (l); i < (r); ++i)
#define rep(i, n) for(int i = 0; i < (int)(n); i++)
#define rrep(i, n) for(int i = (n)-1; i >= 0; --i)
#pragma endregion

int main() {
    unsigned long N, X;
    cin >> N >> X;
    vector< unsigned long > As;
    rep(i, N) {
        int A;
        cin >> A;
        if(X != A)
            As.push_back(A);
    }
    for(const auto &a : As) {
        cout << a << " ";
    }

    cout << endl;

    return 0;
}
#pragma region
#include <iostream>
#include <string>
#include <vector>
using namespace std;
#define FOR(i, l, r) for(size_t i = (l); i < (r); ++i)
#define rep(i, n) for(int i = 0; i < (int)(n); i++)
#define rrep(i, n) for(int i = (n)-1; i >= 0; --i)
#pragma endregion

int main() {
    int H, W;
    cin >> H >> W;

    vector< string > field(H);

    for(auto &r : field) {
        cin >> r;
    }

    return 0;
}
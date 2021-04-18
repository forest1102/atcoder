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
    int A, B;
    cin >> A >> B;
    if(A + B >= 15 && B >= 8) {
        cout << 1 << endl;
    } else if(A + B >= 10 && B >= 3) {

        cout << 2 << endl;
    } else if(A + B >= 3) {
        cout << 3 << endl;
    } else {
        cout << 4 << endl;
    }
    return 0;
}
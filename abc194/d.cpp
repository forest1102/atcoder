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
    double N;
    cin >> N;
    if(N == 2) {
        cout << 2 << endl;
        return 0;
    }
    double t = N / (N - 1.0);
    double res = N * N;
    for(double i = 1; i < N; ++i) {
        res *= i / (N - 1);
    }
    cout << res << endl;
    return 0;
}
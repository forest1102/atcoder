#pragma region
#include <bits/stdc++.h>
using namespace std;
#define FOR(i, l, r) for(size_t i = (l); i < (r); ++i)
#define rep(i, n) for(int i = 0; i < (int)(n); i++)
#define rrep(i, n) for(int i = (n)-1; i >= 0; --i)
#define rfor(v, vec) for(auto &v : (vec))
#define itrloop(itr, begin, end) for(auto itr = (begin); itr != end; ++itr)
#define crfor(v, vec) for(const auto &v : (vec))
#define all(x) x.begin(), x.end()
#define call(x) x.cbegin(), x.cend()
#define rall(x) x.rbegin(), x.rend()
#define ull unsigned long long
#define ll long long
#define ul unsigned long
template < class T > using vec2d = vector< vector< T > >;
#pragma endregion

int main() {
    double N;
    cin >> N;
    double X, Y;
    cin >> X >> Y;
    complex< double > A(X, Y);
    cin >> X >> Y;
    complex< double > B(X, Y);

    complex< double > half = (B - A) / 2.0 + A;
    complex< double > rot = polar(1.0, 2.0 * M_PI / N);
    auto p1 = half + rot * (A - half);
    cout << p1.real() << " " << p1.imag() << endl;
    return 0;
}
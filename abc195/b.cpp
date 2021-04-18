#pragma region
#include <iostream>
#include <vector>
using namespace std;
#define FOR(i, l, r) for(size_t i = (l); i < (r); ++i)
#define rep(i, n) for(int i = 0; i < (int)(n); i++)
#define rrep(i, n) for(int i = (n)-1; i >= 0; --i)
#define rfor(v, vec) for(auto &v : (vec))
#define crfor(v, vec) for(const auto &v : (vec))
#define all(x) x.begin(), x.end()
#define call(x) x.cbegin(), x.cend()
#define rall(x) x.rbegin(), x.rend()
#define ull unsigned long long
#define ll long long
#define ul unsigned long
template < class T > using vec2d = vector< vector< T > >;
#pragma endregion

// template<T> istream& operator<<(istream& in,vector<T> v){
//     rfor()
// }

int main() {
    int a, b, w;
    cin >> a >> b >> w;
    int nmin = 1;
    while(w * 1000 > b * nmin)
        ++nmin;
    if(nmin * a > w * 1000)
        cout << "UNSATISFIABLE" << endl;
    else {
        int nmax = nmin;
        while(w * 1000 >= a * nmax)
            ++nmax;
        --nmax;
        cout << nmin << " " << nmax << endl;
    }
    return 0;
}
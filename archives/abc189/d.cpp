#pragma region
#include <complex>
#include <iostream>
#include <vector>
using namespace std;

#define FOR(i, l, r) for(size_t i = (l); i < (r); ++i)
#define rep(i, n) for(int i = 0; i < (int)(n); i++)
#define rrep(i, n) for(int i = (n)-1; i >= 0; --i)
#pragma endregion

int main() {
    int N, M, K;
    cin >> N >> M >> K;

    vector< complex< double > > means(N);
    rep(i, K) {
        int a;
        cin >> a;
        means[a].imag(1);
    }

    complex< double > acc = 0;
    int l = 0;
    int suc_mass = 0;
    for(int k = N - 1; k >= 0; k--) {
        if(means[k].imag() == 0) {
            means[k] += M;
            means[k] += acc;
            means[k] /= M;
            suc_mass = 0;
        } else {
            ++suc_mass;
            if(suc_mass >= M)
                break;
        }
        acc += means[k];
        ++l;
        if(l > M) {
            acc -= means[k + M];
            --l;
        }
    }
    // cout << means[0].real() << ", " << means[0].imag() << endl;
    if(suc_mass >= M) {
        cout << -1 << endl;
    } else {
        double res = means[0].real();
        res /= (1.0 - means[0].imag());
        cout << res << endl;
    }
}
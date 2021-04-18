#pragma region
#include <algorithm>
#include <array>
#include <bitset>
#include <iostream>
#include <list>
#include <queue>
#include <set>
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
#pragma endregion

int main() {
    int N;
    cin >> N;
    ull Y = 1;
    const int PRIME_NUM = 15;
    int primes[PRIME_NUM] = {2,  3,  5,  7,  11, 13, 17, 19,
                             23, 29, 31, 37, 41, 43, 47};
    vector< bitset< PRIME_NUM > > bits(N);
    vector< bool > used(N);
    int rest_num = N;

    rfor(b, bits) {
        int x;
        cin >> x;
        rep(i, PRIME_NUM) { b[i] = (x % primes[i] == 0); }
    }

    while(rest_num > 0) {
        array< vector< int >, PRIME_NUM > factors;
        rep(i, N) {
            if(!used[i])
                rep(j, PRIME_NUM) {
                    if(bits[i][j])
                        factors[j].push_back(i);
                }
        }
        pair< int, int > most_common(0, 2);
        rep(i, PRIME_NUM) {
            if(factors[i].size() > most_common.first) {
                most_common.first = factors[i].size();
                most_common.second = i;
            }
        }
        Y *= primes[most_common.second];
        crfor(i, factors[most_common.second]) {
            used[i] = true;
            --rest_num;
        }
    }
    cout << Y << endl;

    return 0;
}
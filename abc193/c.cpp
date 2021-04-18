#pragma region
#include <iostream>
#include <list>
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

vector< ull > list_primes(ull n) {
    vector< ull > primes;
    vector< bool > is_prime(n + 1, true);
    is_prime[0] = is_prime[1] = false;
    for(size_t i = 2; i * i <= n; ++i) {

        if(is_prime[i]) {
            primes.push_back(i);
            for(size_t j = 2 * i; j <= n; j += i)
                is_prime[j] = false;
        }
    }
    return primes;
}

int main() {
    ull N;
    ull res = 0;
    cin >> N;
    vector< ull > primes;
    vector< bool > is_prime(N + 1, true);
    is_prime[0] = is_prime[1] = false;
    for(size_t i = 2; i * i <= N; ++i) {

        if(is_prime[i]) {
            primes.push_back(i);
            for(size_t j = 2 * i; j <= N; j += i)
                is_prime[j] = false;
                }
    }
    cout << N - res << endl;
}
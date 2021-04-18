#include <numeric>
#include <set>
#include <vector>
using namespace std;

class Sieve {
    vector< size_t > min_factor;
    size_t max;

  public:
    Sieve(size_t max) : max(max) {
        min_factor.resize(max + 1);
        iota(min_factor.begin(), min_factor.end(), 0);
        for(int i = 2; i * i <= max; ++i) {
            if(min_factor[i] == i)
                for(int j = i * i; j <= max; j += i)
                    if(min_factor[j] == j)
                        min_factor[j] = i;
        }
    }

    bool isPrime(size_t t) const { return min_factor[t] == t; }

    vector< pair< size_t, size_t > > factorize(size_t n) const {
        vector< pair< size_t, size_t > > res;
        while(n > 1) {
            if(res.empty() || min_factor[n] != res[res.size() - 1].first)
                res.emplace_back(min_factor[n], 1);
            else
                ++res[res.size() - 1].second;
            n /= min_factor[n];
        }
        return res;
    }

    vector< size_t > enum_divisors(size_t n) const {
        vector< size_t > res;
        while(n > 1) {
            res.push_back(n);
            n /= min_factor[n];
        }
        res.push_back(1);
        return res;
    }

    size_t euler(size_t n) const {
        size_t res = n;
        for(const auto &p : this->factorize(n)) {
            res *= (p.first - 1);
            res /= p.first;
        }
        return res;
    }
};

bool is_prime(size_t N) {
    if(N == 1)
        return false;
    for(size_t i = 2; i * i <= N; ++i) {
        if(N % i == 0)
            return false;
    }
    return true;
}
vector< unsigned long long > enum_divisors(unsigned long long N) {
    set< unsigned long long > res;
    for(unsigned long long i = 1; i * i <= N; ++i) {
        if(N % i == 0) {
            res.insert(i);
            // 重複しないならば i の相方である N/i も push
            if(N / i != i)
                res.insert(N / i);
        }
    }
    // 小さい順に並び替える
    return vector< unsigned long long >(res.begin(), res.end());
}

vector< pair< unsigned long long, unsigned long long > >
factorize(unsigned long long N) {
    vector< pair< unsigned long long, unsigned long long > > res;
    for(unsigned long long a = 2; a * a <= N; ++a) {
        if(N % a != 0)
            continue;
        unsigned long long ex = 0; // 指数

        // 割れる限り割り続ける
        while(N % a == 0) {
            ++ex;
            N /= a;
        }

        // その結果を push
        res.push_back({a, ex});
    }

    // 最後に残った数について
    if(N != 1)
        res.push_back({N, 1});
    return res;
}

unsigned long long euler(unsigned long long N) {
    unsigned long long res = N;
    for(const auto &p : factorize(N)) {
        res *= (p.first - 1);
        res /= p.first;
    }
    return res;
}
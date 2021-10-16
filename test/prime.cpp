#include "../utils/prime.hpp"
#include <iostream>

int main() {
    Sieve sieve(10000000);
    size_t a;
    cin >> a;

    for(const auto &p : sieve.factorize(a)) {
        cout << p.first << '^' << p.second << " * ";
    }
    cout << endl;
    for(const auto &p : sieve.enum_divisors(a)) {
        cout << p << " ";
    }
    cout << endl;
    return 0;
}
#include <bitset>
#include <iostream>
#include <unordered_set>
#include <vector>

using namespace std;
#define MAX_NUM 100
int main() {
    int N, M;
    cin >> N >> M;

    vector< bitset< 100 > > condition_bits(M, 0);
    for(auto &bit : condition_bits) {
        int a, b;
        cin >> a >> b;
        bit[a] = bit[b] = true;
    }

    int K;
    cin >> K;
    vector< pair< int, int > > place_either(K);
    for(auto &p : place_either) {
        cin >> p.first >> p.second;
    }

    int max = 0;
    for(int prob = 0; prob < 1 << K; prob++) {
        bitset< MAX_NUM > bit = 0;
        int count = 0;
        for(int i = 0; i < K; i++) {
            if(prob & (1 << i)) {
                bit[place_either[i].first] = true;
            } else {
                bit[place_either[i].second] = true;
            }
        }
        for(const auto &cond : condition_bits) {
            count += ((~bit & cond) == 0);
        }
        max = (count > max) ? count : max;
    }
    cout << max << endl;
}
#pragma region
#include <algorithm>
#include <iostream>
#include <math.h>
#include <string>
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
ll k_num(int num) {
    vector< int > nums;
    while(num != 0) {
        nums.push_back(num % 10);
        num /= 10;
    }
    sort(nums.begin(), nums.end());
    int n = nums.size();
    ll res = 0;
    ll l = 1;
    ll r = pow(10, n - 1);
    rep(i, n) {
        res += (l - r) * nums[i];
        l *= 10;
        r /= 10;
    }
    return res;
}
ll k_num(vector< int > nums) {
    sort(nums.begin(), nums.end());
    int n = nums.size();
    ll res = 0;
    ll l = 1;
    ll r = pow(10, n - 1);
    rep(i, n) {
        res += (l - r) * nums[i];
        l *= 10;
        r /= 10;
    }
    return res;
}
int main() {
    string S;
    cin >> S;
    vector< int > nums(S.size());
    rep(i, S.size()) { nums[i] = S[i] - '0'; }

    ul K;
    cin >> K;
    if(K == 0) {
        cout << S << endl;
        return 0;
    }
    ull num = k_num(nums);
    FOR(i, 1, K) { num = k_num(num); }
    cout << num << endl;
    return 0;
}
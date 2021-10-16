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

string max_by_size(const string &a, const string &b) {
    return a.size() >= b.size() ? a : b;
}

int main() {
    std::string s;
    std::cin >> s;
    std::string t;
    std::cin >> t;
    int slen = s.size();
    int tlen = t.size();
    vector< vector< int > > dp(slen + 1, vector< int >(tlen + 1, 0));
    FOR(i, 1, slen + 1) {
        FOR(j, 1, tlen + 1) {
            dp[i][j] = (s[i - 1] == t[j - 1] ? dp[i - 1][j - 1] + 1
                                             : max(dp[i - 1][j], dp[i][j - 1]));
        }
    }

    string ans;
    int i = slen, j = tlen;
    while(i > 0 && j > 0) {
        if(s[i - 1] == t[j - 1]) {
            ans += s[i - 1];
            i--;
            j--;
        } else if(dp[i][j] == dp[i - 1][j]) {
            i--;
        } else {
            j--;
        }
    }

    copy(rall(ans), ostream_iterator< char >(cout));
    cout << endl;

    return 0;
}

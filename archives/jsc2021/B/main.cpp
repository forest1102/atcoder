#include <bits/stdc++.h>
using namespace std;

void solve(long long N, long long M, std::vector< long long > A,
           std::vector< long long > B) {}

// Generated by 1.1.7.1 https://github.com/kyuridenamida/atcoder-tools  (tips:
// You use the default template now. You can remove this line by using your
// custom template)
int main() {
    long long N;
    scanf("%lld", &N);
    long long M;
    scanf("%lld", &M);
    std::vector< long long > A(N);
    for(int i = 0; i < N; i++) {
        scanf("%lld", &A[i]);
    }
    std::vector< long long > B(M);
    for(int i = 0; i < M; i++) {
        scanf("%lld", &B[i]);
    }
    int cnt = 0;
    priority_queue< int, vector< int >, greater< int > > set;
    for(const auto &a : A) {
        if(!binary_search(B.cbegin(), B.cend(), a)) {
            set.push(a);
        }
    }
    for(const auto &b : B) {
        if(!binary_search(A.cbegin(), A.cend(), b)) {
            set.push(b);
        }
    }
    while(!set.empty()) {
        auto i = set.top();
        set.pop();
        cout << i;
        if(!set.empty())
            cout << " ";
    }
    cout << endl;
    return 0;
}

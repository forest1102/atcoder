#include <bits/stdc++.h>
using namespace std;

void solve(long long X, long long Y, long long Z) {}

// Generated by 1.1.7.1 https://github.com/kyuridenamida/atcoder-tools  (tips:
// You use the default template now. You can remove this line by using your
// custom template)
int main() {
    long long X;
    scanf("%lld", &X);
    long long Y;
    scanf("%lld", &Y);
    long long Z;
    scanf("%lld", &Z);
    long long result = 0;
    if((Y * Z) % X == 0)
        result = (Y * Z) / X - 1;
    else
        result = (Y * Z) / X;
    cout << result << endl;
    return 0;
}

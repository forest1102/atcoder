#include <iostream>
#include <queue>
#include <set>
#include <vector>

using namespace std;
using ll = long long;

int main() {
    int N;
    ll votes = 0;
    cin >> N;
    priority_queue< ll > total;

    for(int i = 0; i < N; ++i) {
        ll a, b;
        cin >> a >> b;
        votes -= a;
        total.push(2 * a + b);
    }
    int num = 0;
    while(votes <= 0 && !total.empty()) {
        ++num;
        ll dx = total.top();
        total.pop();
        votes += dx;
    }
    cout << num << endl;
}
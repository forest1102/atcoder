#include <iostream>
#include <vector>
using namespace std;

int main() {
    int N;
    cin >> N;
    vector< int > A(N);
    for(auto &a : A) {
        cin >> a;
    }
    int cur_max = 0;
    for(int l = 0; l < N; l++) {
        int x = 100001;
        for(int r = l; r < N; r++) {
            if(x > A[r]) {
                x = A[r];
            }
            int cur = x * (r - l + 1);
            if(cur > cur_max) {
                cur_max = cur;
            }
        }
    }
    cout << cur_max << endl;
}
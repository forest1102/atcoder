#include <iostream>
using namespace std;

int main() {
    int N, X;
    cin >> N >> X;
    int i_exc = -1;
    int alc = 0;

    for(int i = 1; i <= N; ++i) {
        int v, p;
        cin >> v >> p;
        if(i_exc == -1) {
            alc += v * p;
            if(alc > X * 100)
                i_exc = i;
        }
    }
    cout << i_exc << endl;
}
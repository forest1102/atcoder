#pragma region
#include <iostream>
using namespace std;
#define FOR(i, l, r) for(size_t i = (l); i < (r); ++i)
#define rep(i, n) for(int i = 0; i < (int)(n); i++)
#define rrep(i, n) for(int i = (n)-1; i >= 0; --i)
#pragma endregion

int main() {
    double X, Y, R;
    cin >> X >> Y >> R;
    X = abs(X);
    Y = abs(Y);

    unsigned long long count =
        (floor(X + R) - ceil(X - R)) * (floor(Y + R) - ceil(Y - R));

    for(double x = floor(X - R); x < ceil(X - R); ++x) {
        for(double y = floor(Y - R); y <= ceil(Y + R); ++y) {
            if((x - X) * (x - X) + (y - Y) * (y - Y) <= R * R) {
                ++count;
            }
        }
    }

    cout << count;
    return 0;
}
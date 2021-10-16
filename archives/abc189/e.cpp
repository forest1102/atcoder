#include <array>
#include <complex>
#include <initializer_list>
#include <iostream>
#include <vector>
#include "../util/matrix.hpp"

#define int long long
#define SIZE 3
using namespace std;


using Mat3x3 = SqMatrix< long long, SIZE >;

signed main() {

    int N;
    cin >> N;
    vector< array< int, SIZE > > points(N);
    for(auto &p : points) {
        cin >> p[0] >> p[1];
        p[2] = 1;
    }

    int M;
    cin >> M;
    vector< Mat3x3 > metrics(M + 1);
    metrics[0] = Mat3x3({{{1, 0, 0}, {0, 1, 0}, {0, 0, 1}}});
    for(int i = 1; i <= M; ++i) {
        int t, p;
        cin >> t;
        Mat3x3 mat;
        switch(t) {
        case 1:
            mat = Mat3x3({{{0, 1, 0}, {-1, 0, 0}, {0, 0, 1}}});
            break;
        case 2:
            mat = Mat3x3({{{0, -1, 0}, {1, 0, 0}, {0, 0, 1}}});
            break;
        case 3:
            cin >> p;
            mat = Mat3x3({{{-1, 0, 2 * p}, {0, 1, 0}, {0, 0, 1}}});
            break;
        case 4:
            cin >> p;
            mat = Mat3x3({{{1, 0, 0}, {0, -1, 2 * p}, {0, 0, 1}}});
            break;
        default:
            mat = Mat3x3({{{1, 0, 0}, {0, 1, 0}, {0, 0, 1}}});
            break;
        }
        metrics[i] = mat * metrics[i - 1];
    }

    int Q;
    cin >> Q;
    vector< pair< int, int > > res(Q);
    for(int i = 0; i < Q; ++i) {
        int a, b;
        cin >> a >> b;
        auto vec = metrics[a] * points[b - 1];
        res[i] = make_pair(vec[0], vec[1]);
    }

    for(const auto &p : res) {
        cout << p.first << " " << p.second << endl;
    }
}

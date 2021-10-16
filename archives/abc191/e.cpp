#include <iostream>
#include <list>
#include <queue>
#include <unordered_map>
#include <vector>
using namespace std;
#define FOR(i, l, r) for(size_t i = (l); i < (r); ++i)
#define REP(i, n) for(int i = 0; i < (int)(n); i++)
#define rrep(i, n) for(int i = (n)-1; i >= 0; --i)

#define INF 1001001001

#define ll long long

typedef pair< ll, ll > P; // first: cost, second: to
struct graph {
    ll V;
    ll N;
    using P = pair< ll, ll >;
    struct E {
        ll to, cost;
        E() : to(0), cost(0) {}
        E(ll to, ll cost) : to(to), cost(cost) {}
    };
    vector< list< E > > G;

    graph() {}
    graph(ll n) : N(n), V(n), G(n) {}

    void add_edge(ll s, ll t, ll cost) { G[s].emplace_back(t, cost); }

    vector< ll > dijkstra(ll s) {
        vector< ll > dist(N, INF);
        priority_queue< P, vector< P >, greater< P > > q;
        auto push = [&](ll v, ll d) {
            if(dist[v] <= d)
                return;
            dist[v] = d;
            q.emplace(d, v);
        };
        for(auto &&e : G[s])
            push(e.to, e.cost);
        while(!q.empty()) {
            auto d = q.top().first, v = q.top().second;
            q.pop();
            for(auto &&e : G[v]) {
                push(e.to, d + e.cost);
            }
        }
        return dist;
    }
};

struct E {
    ll to, cost;
    E() : to(0), cost(0) {}
    E(ll to, ll cost) : to(to), cost(cost) {}
};

int main() {
    int N, M;

    cin >> N >> M;
    vector< list< E > > G(N);

    REP(i, M) {
        int A, B, C;
        cin >> A >> B >> C;
        G[A - 1].emplace_back(B - 1, C);
    }

    REP(sv, N) {
        vector< ll > dist(N, INF);
        priority_queue< P, vector< P >, greater< P > > q;
        auto push = [&](ll v, ll d) {
            if(dist[v] <= d)
                return;
            dist[v] = d;
            q.emplace(d, v);
        };
        for(auto &&e : G[sv])
            push(e.to, e.cost);
        while(!q.empty()) {
            auto d = q.top().first, v = q.top().second;
            q.pop();
            for(auto &&e : G[v]) {
                push(e.to, d + e.cost);
            }
        }

        cout << (dist[sv] < INF ? dist[sv] : -1) << endl;
    }

    return 0;
}
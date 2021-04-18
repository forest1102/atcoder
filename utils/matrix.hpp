#include <array>
#include <iostream>

using namespace std;

template < typename T, size_t size > class SqMatrix {
  private:
    using Mat = array< array< T, size >, size >;
    Mat mat;

  public:
    SqMatrix(const array< array< T, size >, size > &mat) : mat(mat) {}
    SqMatrix() : mat() {}

    array< T, size > &operator[](int i) { return mat[i]; }
    array< T, size > operator[](int i) const { return mat[i]; }

    array< T, size > operator*(const array< T, size > &vec) const {
        array< T, size > res;
        for(int i = 0; i < size; i++) {
            res[i] = 0;
            for(int j = 0; j < size; j++) {
                res[i] += mat[i][j] * vec[j];
            }
        }
        return res;
    }

    SqMatrix< T, size > operator+(const SqMatrix< T, size > &rhs) const {
        SqMatrix res;
        for(int i = 0; i < size; i++) {
            for(int j = 0; j < size; j++) {
                res[i][j] = mat[i][j] + rhs[i][j];
            }
        }
        return res;
    }

    SqMatrix< T, size > operator*(const SqMatrix< T, size > &rhs) const {
        SqMatrix res;
        for(size_t i = 0; i < size; ++i) {
            for(size_t j = 0; j < size; ++j) {
                res[i][j] = 0;
                for(size_t k = 0; k < size; k++) {
                    res[i][j] += mat[i][k] * rhs[k][j];
                }
            }
        }
        return res;
    }

    template < typename U, size_t _size >
    friend ostream &operator<<(ostream &ost,
                               const SqMatrix< U, _size > &matrix);
};
template < typename T, size_t size >
ostream &operator<<(ostream &ostr, const SqMatrix< T, size > &mat) {
    for(const auto &row : mat.mat) {
        for(const auto &a : row) {
            ostr << a << ", ";
        }
        ostr << endl;
    }
    return ostr;
}
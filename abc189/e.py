import numpy as np
import itertools
from numba import njit
@njit
def get_op_mats(ops):
    op_mats= [np.array([[0, 1, 0], [-1, 0, 0], [0, 0, 1]]) if op[0] == 1 \
            else np.array([[0, -1, 0], [1, 0, 0], [0, 0, 1]]) if op[0] == 2\
            else np.array([[-1, 0, 2 * op[1]], [0, 1, 0], [0, 0, 1]]) if op[0] == 3\
            else np.array([[1, 0, 0], [0, -1, 2 * op[1]], [0, 0, 1]]) if op[0] == 4\
                else np.identity(3,dtype=int) for op in ops]
    return list(itertools.accumulate(op_mats,np.matmul))


@njit
def answers(queries,op_mats,matrix):
    return [np.matmul(op_mats[a],matrix[b-1]) for a,b in queries]

N=int(input())

matrix=[np.array(list(map(int,input().split()))+[1],dtype=int) for i in range(N)]

M=int(input())
ops=[list(map(int,input().split())) if i>0 else [0] for i in range(M+1)]
Q=int(input())
queries=[map(int,input().split()) for i in range(Q)]
op_mats=get_op_mats(ops)
for ans in answers(queries, op_mats, matrix):
    print(ans[0],ans[1])
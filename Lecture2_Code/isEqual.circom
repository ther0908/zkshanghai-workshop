pragma circom 2.1.4;

// 先进性相减比较，然后对相减的结果判零
template IsEqual () {
    signal input in[2];
    signal output out;

    signal del_val <== in[0] - in[1];
    signal hint <-- del_val == 0? 1: 1 / del_val;
    out <== -hint * del_val + 1;
    del_val * out === 0;
}

component main = IsEqual();

/* INPUT = {
    "in": ["1", "3"]
} */

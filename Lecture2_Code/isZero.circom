pragma circom 2.1.4;

template IsZero () {
    signal input in;
    signal output out;

    signal hint <-- in == 0? 0: 1 / in;
    out <== -in * hint + 1;
    in * out === 0;
}

component main = IsZero();

/* INPUT = {
    "in": "5"
} */

pragma circom 2.1.4;

// 判零方法
template IsEqual(){
    signal input in[2];
    signal output out;

    signal del_val <== in[0] - in[1];
    signal hint <-- del_val == 0? 0: 1 / del_val;
    out <== -del_val * hint + 1;
}

template Calc(n){
    signal input in[n];
    signal output out;

    signal sums[n];
    sums[0] <== in[0];

    for(var i = 1; i < n; i++){
        sums[i] <== sums[i - 1] + in[i];
    }

    out <== sums[n - 1];
}

template Selector (nChoices) {
    signal input in[nChoices], index;
    signal output out;

    component totalCalc = Calc(nChoices);
    component iseq[nChoices];

    for(var i = 0; i < nChoices; i++){
        iseq[i] = IsEqual();
        iseq[i].in[0] <== i;
        iseq[i].in[1] <== index;

        totalCalc.in[i] <== iseq[i].out * in[i];
    }

    out <== totalCalc.out;
}

component main = Selector(5);

/* INPUT = {
    "in": ["1", "3", "5", "7", "9"],
    "index":3
} */

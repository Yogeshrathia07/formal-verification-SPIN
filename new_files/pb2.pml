#define PACKETBUF_NUM_ATTRS 10
#define PACKETBUF_NUM_ADDRS 4
#define PACKETBUF_ADDR_FIRST 0
#define PACKETBUF_SIZE 128

typedef packetbuf_attr {
    int val;
};

packetbuf_attr packetbuf_attrs[PACKETBUF_NUM_ATTRS];
int packetbuf_addrs[PACKETBUF_NUM_ADDRS];
byte packetbuf[PACKETBUF_SIZE];
int buflen;

// ------------------------ Channels ------------------------
chan set_attr_ch = [0] of { int, int }; // type, val
chan set_addr_ch = [0] of { int, int }; // type, addr
chan get_addr_ch = [0] of { int };      // type
chan get_addr_resp = [0] of { int };    // response
chan copyfrom_ch = [0] of { int };      // len
chan copyfrom_resp = [0] of { int };    // returned buflen

// ------------------------ Proctypes ------------------------

proctype packetbuf_set_attr() {
    int type, val;
    set_attr_ch ? type, val;
    packetbuf_attrs[type].val = val;
}

proctype packetbuf_set_addr() {
    int type, addr_val;
    set_addr_ch ? type, addr_val;
    packetbuf_addrs[type] = addr_val;
}

proctype packetbuf_get_addr() {
    int type;
    get_addr_ch ? type;
    get_addr_resp ! packetbuf_addrs[type];
}

proctype packetbuf_clear_proc() {
    int i;
    buflen = 0;
    // Clear all attributes
    i = 0;
    do
    :: i < PACKETBUF_NUM_ATTRS ->
        packetbuf_attrs[i].val = 0;
        i++
    :: else -> break
    od;
    // Clear addresses
    i = 0;
    do
    :: i < PACKETBUF_NUM_ADDRS ->
        packetbuf_addrs[i] = 0;
        i++
    :: else -> break
    od;
}

proctype packetbuf_copyfrom() {
    int lena, l;
    copyfrom_ch ? lena;

    run packetbuf_clear_proc();

    if
    :: lena < PACKETBUF_SIZE -> l = lena;
    :: else -> l = PACKETBUF_SIZE;
    fi;
    buflen = l;
    copyfrom_resp ! l;
}

// ------------------------ Init ------------------------

// init {
//     int sender_type = 0;
//     int receiver_type = 1;
//     int addr1 = 1111;
//     int addr2 = 2222;
//     int result;

//     // Set addresses
//     run packetbuf_set_addr(); set_addr_ch ! sender_type, addr1;
//     run packetbuf_set_addr(); set_addr_ch ! receiver_type, addr2;

//     // Get sender address
//     run packetbuf_get_addr(); get_addr_ch ! sender_type; get_addr_resp ? result;
//     printf("Sender address: %d\n", result);

//     // Get receiver address
//     run packetbuf_get_addr(); get_addr_ch ! receiver_type; get_addr_resp ? result;
//     printf("Receiver address: %d\n", result);

//     // Set an attribute
//     int type = 0;
//     int val = 80;
//     run packetbuf_set_attr(); set_attr_ch ! type, val;
//     printf("packetbuf_attrs[%d].val = %d\n", type, val);

//     // Buffer operation
//     printf("Buffer length before copy: %d\n", buflen);
//     run packetbuf_copyfrom(); copyfrom_ch ! 126; copyfrom_resp ? result;
//     printf("Buffer length after copy: %d\n", result);
// }

init {
    int type, val, addr_type, addr_val, lena;

    // run concurrent processes
    do
    :: run packetbuf_set_addr();
    :: run packetbuf_set_attr();
    :: run packetbuf_copyfrom();
    :: break;
    od;
    do
    :: type = 0; val = 100; set_attr_ch ! type, val;
    :: type = 1; val = 200; set_attr_ch ! type, val;
    :: addr_type = 0; addr_val = 1234; set_addr_ch ! addr_type, addr_val;
    :: addr_type = 1; addr_val = 5678; set_addr_ch ! addr_type, addr_val;
    :: addr_type = 2; addr_val = 9999; set_addr_ch ! addr_type, addr_val; // overflow case
    :: lena = 120; copyfrom_ch ! lena;
    :: lena = 150; copyfrom_ch ! lena; // overflow case
    :: break
    od;
}

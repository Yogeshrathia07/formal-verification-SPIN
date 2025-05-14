#define PACKETBUF_NUM_ATTRS 10

typedef packetbuf_attr {
    int val;
};

packetbuf_attr packetbuf_attrs[PACKETBUF_NUM_ATTRS];

inline packetbuf_set_attr(type, val) {
    packetbuf_attrs[type].val = val;
}

// --------------------------------------------------------------

#define PACKETBUF_NUM_ADDRS 2
#define PACKETBUF_ADDR_FIRST 0

int packetbuf_addrs[PACKETBUF_NUM_ADDRS];

// Set the address at index `type`
inline packetbuf_set_addr(type, addr_val) {
    packetbuf_addrs[type] = addr_val;
}

// Get the address from index `type`
inline packetbuf_addr(type, result) {
    result = packetbuf_addrs[type];
}

init {
    int sender_type = 0;
    int receiver_type = 1;
    int addr1 = 1111;
    int addr2 = 2222;
    int result;

    // Set sender and receiver addresses
    packetbuf_set_addr(sender_type, addr1);
    packetbuf_set_addr(receiver_type, addr2);

    // Get and print sender address
    packetbuf_addr(sender_type, result);
    printf("Sender address: %d\n", result);

    // Get and print receiver address
    packetbuf_addr(receiver_type, result);
    printf("Receiver address: %d\n", result);

    int type = 0; 
    int val = -80;
    packetbuf_set_attr(type, val);
    printf("packetbuf_attrs[%d].val = %d\n", type, packetbuf_attrs[type].val);

}
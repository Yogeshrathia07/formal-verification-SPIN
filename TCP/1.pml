proctype uipbuf_clear_attr(){
    printf(" uipbuf : uipbuf_clear_attr\n");
}
proctype uipbuf_clear(){
    printf(" uipbuf : uipbuf_clear\n");
    run uipbuf_clear_attr();
}

proctype uipbuf_add_ext_hdr(){
    printf(" uipbuf : uipbuf_add_ext_hdr\n");
}
// network layer -----------------------------------------
proctype uipbuf_get_len_field(){
    printf("uipbuf_get_len_field\n");
}
proctype upper_layer_chksum(){
    printf("upper_layer_chksum\n");
    run uipbuf_get_len_field();
    // run chksum();
}

proctype uip_ipaddr_copy(){
    printf(" uip6 :uip_ipaddr_copy\n");
}
proctype uip_connect(){
    printf(" uip6 :uip_connect\n");
    run uip_ipaddr_copy();
}
// ------------------
proctype uipbuf_clear(){
    printf(" uip6 :uipbuf_clear\n");
}
proctype uipbuf_add_ext_hdr(){
    printf(" uip6 :uipbuf_add_ext_hdr\n");
}
proctype uipbuf_set_len_field(){
    printf(" uip6 :uipbuf_set_len_field\n");
}
proctype uip_remove_ext_hdr(){
    printf(" uip6 :uip_remove_ext_hdr\n");
    int condition1;
    if 
    ::  condition1=0;
    ::  condition1=1;
    ::  condition1=2;
    fi
    if
    :: condition1==0 -> {
        run uipbuf_clear();
    }
    :: condition1==1 -> {
        run uipbuf_clear();
        run uipbuf_add_ext_hdr();
        run uipbuf_set_len_field();
    }
    ::condition1==2 -> {
        printf(" uip6 :uipbuf_clear , uipbuf_add_ext_hdr , uipbuf_set_len_field : not executed\n");
    }
    fi;
}

// mac layer -----------------------------------------  
proctype packetbuf_copyfrom(){
    printf("packetbuf_copyfrom\n");
    run packetbuf_clear();
}

proctype linkaddr_copy(){
    printf("linkaddr_copy\n");
}
proctype packetbuf_attr_clear(){
    printf("packetbuf_attr_clear\n");
    run linkaddr_copy();
}
proctype packetbuf_clear(){
    printf("packetbuf_clear\n");
    run packetbuf_attr_clear();
}
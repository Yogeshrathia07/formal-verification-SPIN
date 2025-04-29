proctype packetbuf_attr(){
    printf("packetbuf_attr()\n");
}
proctype packetbuf_set_attr(){
    printf("packetbuf_set_attr()\n");
}
proctype init_sec(){
    printf("init_sec()\n");
    int condition1;
    if
    ::condition1 = 0;
    ::condition1 = 1;
    fi;
    run packetbuf_attr();
    if
    ::condition1 == 1->
        run packetbuf_set_attr();
    ::else ->
        printf("packetbuf_set_attr not executed\n");
    fi;
}
// ---------------------------------------------------
proctype csma_output_packet(){
    printf("csma_output_packet()\n");
}
proctype send_packet(){
    printf("send_packet()\n");
    run init_sec();
    run csma_output_packet();
}
// ----------------------------------------------------
proctype packetbuf_datalen(){
    printf("packetbuf_datalen()\n");
}
proctype packetbuf_addr(){
    printf("packetbuf_addr()\n");
}
proctype input_packet(){
    printf("input_packet()\n");
    run packetbuf_datalen();
    run packetbuf_addr();
}
// ----------------------------------------------------
proctype on(){
    printf("on()\n");
}
proctype off(){
    printf("off()\n");
}
// --------------------------------------------------
proctype mac_sequence_init(){
    printf("mac_sequence_init()\n");
    run send_packet();
}
proctype csma_output_init(){
    printf("csma_output_init()\n");
}
proctype init1(){
    printf("init1()\n");
    // We cant take init so we have to take init1
    run mac_sequence_init();
    run csma_output_init();
    run on();
}
// --------------------------------------------------
proctype max_payload(){
    printf("max_payload()\n");
    run init_sec();
}
init{
    // run init_sec();
    // run send_packet();
    // run input_packet();
    // run init1();
    run max_payload();
}
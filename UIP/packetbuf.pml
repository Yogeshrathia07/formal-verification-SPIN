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
// -----------------------------------------
proctype packetbuf_copyfrom(){
    printf("packetbuf_copyfrom\n");
    run packetbuf_clear();
}
// -----------------------------------------
proctype packetbuf_hdrptr(){
    printf("packetbuf_hdrptr\n");
}
proctype packetbuf_copyto(){
    printf("packetbuf_copyto\n");
    run packetbuf_hdrptr();
}
// -----------------------------------------
proctype packetbuf_datalen(){
    printf("packetbuf_datalen\n");
}
proctype packetbuf_totlen(){
    printf("packetbuf_totlen\n");
    run packetbuf_hdrlen();
    run packetbuf_datalen();

}
proctype packetbuf_hdralloc(){
    printf("packetbuf_hdralloc\n");
    run packetbuf_totlen();
}
// -----------------------------------------
proctype packetbuf_hdrreduce(){
    printf("packetbuf_hdrreduce\n");
}
// -----------------------------------------
proctype packetbuf_set_datalen(){
    printf("packetbuf_set_datalen\n");
}
// -----------------------------------------
proctype packetbuf_hdrlen(){
    printf("packetbuf_hdrlen\n");
}
proctype packetbuf_dataptr(){
    printf("packetbuf_dataptr\n");
    run packetbuf_hdrlen();
}
// -----------------------------------------
proctype packetbuf_remaininglen(){
    printf("packetbuf_remaininglen\n");
    run packetbuf_totlen();
}
// ------------------------------------------
proctype packetbuf_attr_copyto(){
    printf("packetbuf_attr_copyto\n");
}
// ------------------------------------------
proctype packetbuf_attr_copyfrom(){
    printf("packetbuf_attr_copyfrom\n");
}
// ------------------------------------------
proctype packetbuf_set_attr(){
    printf("packetbuf_set_attr\n");
}
// ------------------------------------------
proctype packetbuf_attr(){
    printf("packetbuf_attr\n");
}
// ------------------------------------------
proctype packetbuf_set_addr(){
    printf("packetbuf_set_addr\n");
    run linkaddr_copy();
}
// ------------------------------------------
proctype packetbuf_addr(){
    printf("packetbuf_addr\n");
}
// ------------------------------------------
proctype linkaddr_cmp(){
    printf("linkaddr_cmp\n");
}
proctype packetbuf_holds_broadcast(){
    printf("packetbuf_holds_broadcast\n");
    run linkaddr_cmp();
}
init{
    // run packetbuf_clear();
    // run packetbuf_copyfrom();
    // run packetbuf_copyto();
    // run packetbuf_hdralloc();
    // run packetbuf_hdrreduce();
    // run packetbuf_set_datalen();
    // run packetbuf_dataptr();
    // run packetbuf_remaininglen();
    // run packetbuf_attr_clear();
    // run packetbuf_attr_copyto();
    // run packetbuf_attr_copyfrom();
    // run packetbuf_attr();
    // run packetbuf_set_addr();
    // run packetbuf_addr();
    run packetbuf_holds_broadcast();
    
}
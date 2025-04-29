// udp mac csma tcp 
proctype uipbuf_clear_attr(){
    printf("uipbuf_clear_attr\n");
}
proctype uipbuf_clear(){
    printf("uipbuf_clear\n");
    run uipbuf_clear_attr();
}
// -----------------------------------------
proctype uipbuf_add_ext_hdr(){
    printf("uipbuf_add_ext_hdr\n");
}
// -----------------------------------------
proctype uipbuf_set_len(){
    printf("uipbuf_set_len\n");
}
// -----------------------------------------
proctype uipbuf_set_len_field(){
    printf("uipbuf_set_len_field\n");
}
// -----------------------------------------
proctype uipbuf_get_len_field(){
    printf("uipbuf_get_len_field\n");
}
// -----------------------------------------
proctype uip_is_proto_ext_hdr(){
    printf("uip_is_proto_ext_hdr\n");
}
proctype uipbuf_get_next_header(){
    printf("uipbuf_get_next_header\n");
    run uip_is_proto_ext_hdr();
}
// -----------------------------------------
proctype uipbuf_get_last_header(){
    printf("uipbuf_get_last_header\n");
    run uipbuf_get_next_header();
}
// -----------------------------------------
proctype uipbuf_search_header(){
    printf("uipbuf_search_header\n");
    run uipbuf_get_next_header();
}
// -----------------------------------------
proctype uipbuf_get_attr(){
    printf("uipbuf_get_attr\n");
}
proctype uipbuf_set_attr(){
    printf("uipbuf_set_attr\n");
}
// -----------------------------------------
proctype uipbuf_set_default_attr(){
    printf("uipbuf_set_default_attr\n");
}
// -----------------------------------------
proctype uipbuf_set_attr_flag(){
    printf("uipbuf_set_attr_flag\n");
}
// -----------------------------------------
proctype uipbuf_clr_attr_flag(){
    printf("uipbuf_clr_attr_flag\n");
}
// -----------------------------------------
proctype uipbuf_is_attr_flag(){
    printf("uipbuf_is_attr_flag\n");
}
// -----------------------------------------
proctype uipbuf_init(){
    printf("uipbuf_init\n");
    run uipbuf_set_default_attr();
}
init{
    // run uipbuf_clear();
    run uipbuf_add_ext_hdr();
    run uipbuf_set_len();
    run uipbuf_set_len_field();
    run uipbuf_get_len_field();
    run uipbuf_get_next_header();
    run uipbuf_get_last_header();
    run uipbuf_search_header();
    run uipbuf_get_attr();
    run uipbuf_set_attr();
    run uipbuf_set_default_attr();
    run uipbuf_set_attr_flag();
    run uipbuf_clr_attr_flag();
    run uipbuf_is_attr_flag();
    run uipbuf_init();
}
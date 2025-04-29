proctype aead(){
    printf("aead\n");
}
proctype ccm_star_packetbuf_set_nonce(){
    printf("ccm_star_packetbuf_set_nonce\n");
}
proctype packetbuf_totlen(){
    printf("packetbuf_totlen\n");
}
proctype packetbuf_hdrptr(){
    printf("packetbuf_hdrptr\n");
}
proctype packetbuf_attr(){
    printf("packetbuf_attr\n");
}
proctype packetbuf_set_datalen(){
    printf("packetbuf_set_datalen\n");
}
proctype csma_security_set_key(){
    printf("csma_security_set_key\n");
    run aead();
    run ccm_star_packetbuf_set_nonce();
    run packetbuf_totlen();
    run packetbuf_hdrptr();
    run packetbuf_attr();
    int condition1;
    if
    ::condition1 = 0;
    ::condition1 = 1;
    fi;
    if
    ::condition1 = 0->{
        run packetbuf_set_datalen();
    };
    ::condition1 = 1->{
        printf("packetbuf_set_datalen() : not executed\n");
    };
    fi;
}
// -------------------------------------------------------
proctype packetbuf_set_attr(){
    printf("packetbuf_set_attr() \n");
}
proctype packetbuf_addr(){
    printf("packetbuf_addr()\n");
}

proctype csma_security_create_frame(){
    printf("csma_security_create_frame\n");
    run packetbuf_set_attr();
    run packetbuf_attr();
    int condition1;
    if
    ::condition1 = 0;
    ::condition1 = 1;
    fi;

   run packetbuf_hdrptr();
   run packetbuf_addr();

}

// -------------------------------------------------------
proctype csma_security_frame_len(){
    printf("csma_security_frame_len\n");
    run packetbuf_attr();
}
// -------------------------------------------------------
proctype packetbuf_datalen(){
    printf("packetbuf_datalen\n");
}
proctype csma_security_parse_frame(){
    printf("csma_security_parse_frame\n");
    run packetbuf_attr();
    run packetbuf_datalen();
    run packetbuf_set_datalen();
    int condition1;
    if
    ::condition1 = 0;
    ::condition1 = 1;
    fi;
    if
    ::condition1 = 0->{
        run packetbuf_addr();
    };
    ::else->{
        printf("packetbuf_addr() : not executed\n");
    };
    fi;
}
// -------------------------------------------------------

init{
    // run csma_security_set_key();
    // run csma_security_create_frame();
    run csma_security_parse_frame();
}
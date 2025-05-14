#define UIP_BUFSIZE 1280 // Simulated size of the uip_buf

byte uip_buf[UIP_BUFSIZE]; // global packet buffer
int uip_len = 0;            // length of data in uip_buf

// Simulated function to represent upper layer writing to uip_buf
inline app_send(data_len) {
  if
  :: (data_len + uip_len <= UIP_BUFSIZE) ->
       // write data_len bytes to uip_buf
       uip_len = uip_len + data_len;
       printf("App wrote %d bytes to uip_buf, total: %d\n", data_len, uip_len);
  :: else ->
       assert(false) // buffer overflow
  fi
}

// Simulated function representing uip_process() parsing and routing packet
inline uip_process() {
  printf("Called uip_process\n");
  // buffer is read from, processed, and possibly sent out
  call_icmp6();
  call_rpl();
  call_udp_input();
  uip_len = 0; // clear buffer after sending
}

// Placeholder for RPL and ICMP6 processing
inline call_icmp6() {
  printf("Calling uip_icmp6_input()\n");
}

inline call_rpl() {
  printf("Calling rpl_ipv6_input()\n");
}

inline call_udp_input() {
  printf("Calling udp_input() → accesses uip_buf\n");
}

// Main process simulating an application sending packets and triggering uip6
proctype MainApp() {
  app_send(400);
  uip_process();

  app_send(900);  // should cause overflow
  uip_process();
}

init {
  run MainApp();
}

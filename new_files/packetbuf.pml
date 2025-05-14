#define PACKETBUF_SIZE 128
#define PACKETBUF_NUM_ATTRS 16
#define PACKETBUF_NUM_ADDRS 8
#define MAX_PACKETS 10

bool header_allocated = false;
bool buffer_copied = false;
int total_header_allocations = 0;
int total_header_reductions = 0;

typedef Attribute {
    int val;
}

typedef Address {
    int addr;
    bool is_null;
}

byte packetbuf[PACKETBUF_SIZE];
int buflen = 0;
int bufptr = 0;
int hdrlen = 0;

Attribute packetbuf_attrs[PACKETBUF_NUM_ATTRS];
Address packetbuf_addrs[PACKETBUF_NUM_ADDRS];

proctype packetbuf_attr_clear() {
    do
    ::
        atomic {
            int i = 0;
            do
            :: (i < PACKETBUF_NUM_ATTRS) ->
                packetbuf_attrs[i].val = 0;
                i++;
            :: else -> break;
            od;
            
            i = 0;
            do
            :: (i < PACKETBUF_NUM_ADDRS) ->
                packetbuf_addrs[i].addr = 0;
                packetbuf_addrs[i].is_null = true;
                i++;
            :: else -> break;
            od;
        }
    od
}

proctype packetbuf_clear() {
    do
    ::
        atomic {
            buflen = 0;
            bufptr = 0;
            hdrlen = 0;
            run packetbuf_attr_clear();
        }
    od
}

proctype packetbuf_copyfrom() {
    do
    ::
        byte from[PACKETBUF_SIZE];
        int ln = 50;
        int l;
        
        atomic {
            run packetbuf_clear();
            
            if
            :: (ln <= PACKETBUF_SIZE) -> l = ln;
            :: else -> l = PACKETBUF_SIZE;
            fi;
            
            int i=0;
            do
            :: (i < l) ->
                packetbuf[i] = from[i];
                i = i + 1;
            :: else -> break;
            od;
            buflen = l;
        }
    od
}

proctype packetbuf_copyto() {
    do
    ::
        byte to[PACKETBUF_SIZE];
        int result;
        
        atomic {
            if
            :: (hdrlen + buflen > PACKETBUF_SIZE) -> result = 0;
            :: else ->
                int i = 0;
                do
                :: (i < hdrlen) ->
                    to[i] = packetbuf[i];
                    i = i + 1;
                :: else -> break;
                od;
                
                int j = 0;
                do
                :: (j < buflen) ->
                    to[i] = packetbuf[hdrlen + j];
                    i = i + 1;
                    j = j + 1;
                :: else -> break;
                od;
                
                result = hdrlen + buflen;
            fi;
        }
    od
}

proctype packetbuf_hdralloc() {
    do
    ::
        int size = 10;
        int result;
        
        atomic {
            int i;
            if
            :: (hdrlen + buflen + size > PACKETBUF_SIZE) -> result = 0;
            :: else ->
                i = hdrlen + buflen - 1;
                do
                :: (i >= 0) ->
                    packetbuf[i + size] = packetbuf[i];
                    i = i - 1;
                :: else -> break;
                od;
                
                hdrlen = hdrlen + size;
                result = 1;
                header_allocated = true;  
                total_header_allocations++;  
            fi;
        }
    od
}

proctype packetbuf_hdrreduce() {
    do
    ::
        int size = 5;
        int result = 0;
        
        atomic {
            if
            :: (buflen >= size) ->
                bufptr = bufptr + size;
                buflen = buflen - size;
                result = 1;
                total_header_reductions++;  // Increment for LTL verification
            :: else ->
                result = 0;
            fi;
        }
    od
}


ltl buffer_safety { [](hdrlen + buflen <= PACKETBUF_SIZE) }
ltl header_allocation_reduction { [](header_allocated -> <> total_header_reductions > 0) }
ltl valid_copyto { [](hdrlen + buflen <= PACKETBUF_SIZE -> <> (bufptr + hdrlen + buflen > 0)) }

init {

    run packetbuf_hdralloc()
    run packetbuf_hdrreduce()
    run packetbuf_copyfrom()
    run packetbuf_copyto()
}
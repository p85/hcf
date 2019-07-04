#include <sys/mman.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
char buf[sizeof(long)*argc-1];
for(int i=1;i<argc;i++) {
  int conv = strtol(argv[i], NULL, 0);
  buf[i-1] = conv;
}
    void* mem_map = mmap(NULL, sizeof(buf), PROT_EXEC|PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANON, -1, 0);
    memcpy(mem_map, buf, sizeof(buf));
    (( void(*)() )mem_map)();
    return 0;

}

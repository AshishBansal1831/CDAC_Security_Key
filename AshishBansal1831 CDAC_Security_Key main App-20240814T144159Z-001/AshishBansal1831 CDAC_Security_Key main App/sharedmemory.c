#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>
#include <string.h>

#define SHM_NAME "/my_shared_memory"
#define SHM_SIZE 1024  // Size in bytes

int main() {
    // Open the shared memory object
    int shm_fd = shm_open(SHM_NAME, O_RDONLY, 0666);
    if (shm_fd == -1) {
        perror("shm_open");
        exit(1);
    }

    // Memory map the shared memory object
    void *shared_memory = mmap(0, SHM_SIZE, PROT_READ, MAP_SHARED, shm_fd, 0);
    if (shared_memory == MAP_FAILED) {
        perror("mmap");
        close(shm_fd);
        exit(1);
    }

    // Read from shared memory
    while (1) {
        char buffer[SHM_SIZE];
        memcpy(buffer, shared_memory, SHM_SIZE);
        printf("Read from shared memory: %s\n", buffer);
        sleep(1);
    }

    // Clean up
    munmap(shared_memory, SHM_SIZE);
    close(shm_fd);

    return 0;
}

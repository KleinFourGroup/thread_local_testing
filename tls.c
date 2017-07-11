#include <pthread.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

static __thread uint64_t tls;

void * thread_proc(void * arg) {
  uint64_t n = (uint64_t) arg;
  int status;
  tls = n;

  uint64_t ret;
  ret = tls;
  printf("tls getting (thread %lu) got: %lu\n", n, ret);

  return NULL;
}

int main(int argc, char ** argv) {
  int active_size = 8;
  pthread_t * threads;
  int status;
  
  printf("Setting up threads.\n");
  threads = (pthread_t *) malloc(active_size * sizeof(pthread_t));
  
  for (int i = 0; i < active_size; i++) {
    status = pthread_create(&threads[i],
			    NULL,
			    thread_proc,
			    (void *)i);
    if (status != 0) printf("Error: thread creation (%d) failed: %d\n", i, status);
  }
  
  for (int i = 0; i < active_size; i++) {
    void * ret;
    
    status = pthread_join(threads[i], &ret);

    if (status != 0) printf("Error: thread join (%d) failed: %d\n", i, status);
  }
  
  printf("Joined all threads.\n");

  return 0;
}

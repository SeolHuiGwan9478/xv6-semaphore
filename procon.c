#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "fcntl.h"

#define BUFFER_SIZE 1 //buffer size
#define NUM_THREADS 2 //number of Thread
#define MAX_THREADS 32

int Q_buffer[BUFFER_SIZE]; //Circuler Q_buffer
int in = 0;
int out = 0;

int mutex = 1;
int empty = BUFFER_SIZE;
int full = 0;

int mutex_sem, empty_sem, full_sem;

int pro_data = 0; //produce 에서의 10000 data
int con_data = 0; //consume 에서의 10000 data

int pro_counter[NUM_THREADS] = {0,}; //pro_counter arr
int con_counter[NUM_THREADS] = {0,}; //con_counter arr

void produce(void* thread_no){
	int no = *((int*)thread_no);
	for(;;){
		sem_wait(empty_sem);
		sem_wait(mutex_sem);
		if(pro_data == 10000){
			sem_signal(mutex_sem);
			sem_signal(full_sem);
			break;
		}
		Q_buffer[in] = pro_data;
		in = (in + 1) % BUFFER_SIZE;
		pro_data++;
		pro_counter[no-1]++;

		sem_signal(mutex_sem);
		sem_signal(full_sem);
	}

	exit();
}
	

void consume(void* thread_no){
	int no = *((int*)thread_no);
	//int out_data;
	for(;;){
		sem_wait(full_sem);
		sem_wait(mutex_sem);
		if(con_data == 10000){
			sem_signal(mutex_sem);
			sem_signal(empty_sem);
			break;
		}
		//out_data = Q_buffer[out];
		out = (out + 1) % BUFFER_SIZE;
		con_data++;
		con_counter[no-1]++;

		sem_signal(mutex_sem);
		sem_signal(empty_sem);
	}
	exit();
}

int main(int argc, char *argv[]){
	int pro_thread[MAX_THREADS]; //Producer thread ID
	int con_thread[MAX_THREADS]; //Consumer thread ID
	
	mutex_sem = sem_create(mutex);
	empty_sem = sem_create(empty);
	full_sem = sem_create(full);

	int cnt[2] = {1,2};

	for(int i = 0; i < NUM_THREADS; i++){
		pro_thread[i] = hufs_thread_create((void*)produce, (void*)&cnt[i]);
	}
	for(int i = 0; i < NUM_THREADS; i++){
		con_thread[i] = hufs_thread_create((void*)consume, (void*)&cnt[i]);
	}
	
	for(int i = 0; i < NUM_THREADS; i++){
		hufs_thread_join(pro_thread[i]);
	}
	for(int i = 0; i < NUM_THREADS; i++){
		hufs_thread_join(con_thread[i]);
	}

	for(int i = 0; i < NUM_THREADS; i++){
		printf(1, "producer (%d): %d produced\n", cnt[i], pro_counter[i]);
	}
	for(int i = 0; i < NUM_THREADS; i++){
		printf(1, "consumer (%d): %d consumed\n", cnt[i], con_counter[i]);
	}

	sem_destroy(mutex);
	sem_destroy(empty);
	sem_destroy(full);

	exit();
}

#include "types.h"
#include "x86.h"
#include "defs.h"
#include "param.h"
#include "spinlock.h"
#include "mmu.h"
#include "proc.h"

#define NSEMS			32 // 32 entries for semophore table
#define MAX_WAITERS		64 // maximum no of waiters

extern struct {
	struct spinlock lock;
	struct proc proc[NPROC];
} ptable;

struct semaphore {
	int value;
	int active; // if it is used or not
	int head;
	int tail;
	int waiters[MAX_WAITERS];
	struct spinlock lock;
} sem[NSEMS];

// function to initiallize the semophore table (at booting time)
// You DO NOT need call this seminit function!! 
void
seminit(void)
{
	int i, j;

	for(i = 0; i < NSEMS; ++i)
	{
		initlock(&sem[i].lock, "semaphore");
		sem[i].active = 0;
		sem[i].value = 0;
		sem[i].head = -1;
		sem[i].tail = -1;

		for (j=0; j<MAX_WAITERS; j++) sem[i].waiters[j] = -1; // HUFS

	}
}

int 
sem_create(int max)
{ 
	int i;

	// find an entry is NOT active (not used)
	for (i=0; i<NSEMS; i++) {
		acquire(&sem[i].lock);
		if (sem[i].active == 0) { 
			sem[i].value = max;
			sem[i].active = 1; // mark it as used (will be)
			release(&sem[i].lock);
			return i;
		}
		release(&sem[i].lock);
	}

	return -1;
}

int
sem_destroy(int num)
{
	// check if the entry is valid
	if(num < 0 || num > NSEMS)
		return -1;

	acquire(&sem[num].lock);
	// check if the entry is actived
	if(sem[num].active != 1) { 
		release(&sem[num].lock);
		return -1;
	}
	sem[num].active = 0;
	release(&sem[num].lock);

	return 0;
}

static int enqueue_waiter(struct semaphore *sem, int pid)
{
	// write your code
	int tmp = (sem->tail+1) % MAX_WAITERS;
	int isfull = 0;
	if(tmp == sem->head){
		isfull = 1;
	}
	if(isfull){
		return -1;
	}
	sem->tail = (sem->tail+1) % MAX_WAITERS;
	sem->waiters[sem->tail] = pid;
	return 0;
}


static int dequeue_waiter(struct semaphore *sem)
{
	// write your code
	int isempty = 0;
	if(sem->head == sem->tail){
		isempty = 1;
	}
	if(isempty){
		return -1;
	}
	sem->head = (sem->head+1) % MAX_WAITERS;
	int pid = sem->waiters[sem->head];
	return pid;
}

int
sem_wait(int num)
{
	acquire(&sem[num].lock);

	sem[num].value -= 1; //value 감소

	if(sem[num].value < 0){
		int state = enqueue_waiter(&sem[num], proc->pid);
		if(state == -1){
			release(&sem[num].lock);
			return -1;
		}
		block(&sem[num].lock);
	}
	release(&sem[num].lock);
	return 0;
}

int
sem_signal(int num)
{
	acquire(&sem[num].lock);
	sem[num].value += 1;

	if(sem[num].value <= 0){
		int pid = dequeue_waiter(&sem[num]);
		if(pid == -1){
			release(&sem[num].lock);
			return -1;
		}
		wakeup_pid(pid, &sem[num].lock);
	}
	release(&sem[num].lock);
	return 0;
}

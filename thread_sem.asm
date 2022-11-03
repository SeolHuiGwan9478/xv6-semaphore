
_thread_sem:     file format elf32-i386


Disassembly of section .text:

00000000 <thread>:

uint g_counter;
int sem_id;

void *thread(void *arg)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 18             	sub    $0x18,%esp
	int i;
	uint counter;

	sleep(10);
   6:	83 ec 0c             	sub    $0xc,%esp
   9:	6a 0a                	push   $0xa
   b:	e8 f8 05 00 00       	call   608 <sleep>
  10:	83 c4 10             	add    $0x10,%esp
	printf(1, "thread %d: started...\n", *(int*)arg);
  13:	8b 45 08             	mov    0x8(%ebp),%eax
  16:	8b 00                	mov    (%eax),%eax
  18:	83 ec 04             	sub    $0x4,%esp
  1b:	50                   	push   %eax
  1c:	68 98 0b 00 00       	push   $0xb98
  21:	6a 01                	push   $0x1
  23:	e8 03 07 00 00       	call   72b <printf>
  28:	83 c4 10             	add    $0x10,%esp

	for (i=0; i<TARGET_COUNT_PER_THREAD; i++) {
  2b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  32:	eb 54                	jmp    88 <thread+0x88>
		sem_wait(sem_id);
  34:	a1 18 10 00 00       	mov    0x1018,%eax
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	50                   	push   %eax
  3d:	e8 f6 05 00 00       	call   638 <sem_wait>
  42:	83 c4 10             	add    $0x10,%esp
		
		counter = g_counter;
  45:	a1 10 10 00 00       	mov    0x1010,%eax
  4a:	89 45 f0             	mov    %eax,-0x10(%ebp)
		sleep(0);
  4d:	83 ec 0c             	sub    $0xc,%esp
  50:	6a 00                	push   $0x0
  52:	e8 b1 05 00 00       	call   608 <sleep>
  57:	83 c4 10             	add    $0x10,%esp
		counter++;
  5a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
		sleep(0);
  5e:	83 ec 0c             	sub    $0xc,%esp
  61:	6a 00                	push   $0x0
  63:	e8 a0 05 00 00       	call   608 <sleep>
  68:	83 c4 10             	add    $0x10,%esp
		g_counter = counter;
  6b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  6e:	a3 10 10 00 00       	mov    %eax,0x1010

		sem_signal(sem_id);
  73:	a1 18 10 00 00       	mov    0x1018,%eax
  78:	83 ec 0c             	sub    $0xc,%esp
  7b:	50                   	push   %eax
  7c:	e8 bf 05 00 00       	call   640 <sem_signal>
  81:	83 c4 10             	add    $0x10,%esp
	for (i=0; i<TARGET_COUNT_PER_THREAD; i++) {
  84:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  88:	a1 14 10 00 00       	mov    0x1014,%eax
  8d:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  90:	7c a2                	jl     34 <thread+0x34>
	}

	exit();
  92:	e8 e1 04 00 00       	call   578 <exit>

00000097 <main>:
}

int main(int argc, char **argv)
{
  97:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  9b:	83 e4 f0             	and    $0xfffffff0,%esp
  9e:	ff 71 fc             	pushl  -0x4(%ecx)
  a1:	55                   	push   %ebp
  a2:	89 e5                	mov    %esp,%ebp
  a4:	53                   	push   %ebx
  a5:	51                   	push   %ecx
  a6:	81 ec 10 02 00 00    	sub    $0x210,%esp
  ac:	89 cb                	mov    %ecx,%ebx
	int i;
	int sem_size;
	int final_counter;
	int final_target = NUM_THREADS*TARGET_COUNT_PER_THREAD;
  ae:	8b 15 1c 10 00 00    	mov    0x101c,%edx
  b4:	a1 14 10 00 00       	mov    0x1014,%eax
  b9:	0f af c2             	imul   %edx,%eax
  bc:	89 45 f0             	mov    %eax,-0x10(%ebp)
		sem_size = NUM_THREADS;
	else
		sem_size = 1;
		*/

	if (argc < 3) {
  bf:	83 3b 02             	cmpl   $0x2,(%ebx)
  c2:	7f 17                	jg     db <main+0x44>
		printf(2, "Usage: thread_sem num_threads count_per_thread");
  c4:	83 ec 08             	sub    $0x8,%esp
  c7:	68 b0 0b 00 00       	push   $0xbb0
  cc:	6a 02                	push   $0x2
  ce:	e8 58 06 00 00       	call   72b <printf>
  d3:	83 c4 10             	add    $0x10,%esp
		exit();
  d6:	e8 9d 04 00 00       	call   578 <exit>
	}

	NUM_THREADS = atoi(argv[1]);
  db:	8b 43 04             	mov    0x4(%ebx),%eax
  de:	83 c0 04             	add    $0x4,%eax
  e1:	8b 00                	mov    (%eax),%eax
  e3:	83 ec 0c             	sub    $0xc,%esp
  e6:	50                   	push   %eax
  e7:	e8 fa 03 00 00       	call   4e6 <atoi>
  ec:	83 c4 10             	add    $0x10,%esp
  ef:	a3 1c 10 00 00       	mov    %eax,0x101c
	TARGET_COUNT_PER_THREAD = atoi(argv[2]);
  f4:	8b 43 04             	mov    0x4(%ebx),%eax
  f7:	83 c0 08             	add    $0x8,%eax
  fa:	8b 00                	mov    (%eax),%eax
  fc:	83 ec 0c             	sub    $0xc,%esp
  ff:	50                   	push   %eax
 100:	e8 e1 03 00 00       	call   4e6 <atoi>
 105:	83 c4 10             	add    $0x10,%esp
 108:	a3 14 10 00 00       	mov    %eax,0x1014

	final_target = NUM_THREADS*TARGET_COUNT_PER_THREAD;
 10d:	8b 15 1c 10 00 00    	mov    0x101c,%edx
 113:	a1 14 10 00 00       	mov    0x1014,%eax
 118:	0f af c2             	imul   %edx,%eax
 11b:	89 45 f0             	mov    %eax,-0x10(%ebp)

	//sem_size = NUM_THREADS; 
	sem_size = 1;
 11e:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)

	// Initialize semaphore to 1
	if ((sem_id = sem_create(sem_size)) < 0)
 125:	83 ec 0c             	sub    $0xc,%esp
 128:	ff 75 ec             	pushl  -0x14(%ebp)
 12b:	e8 f8 04 00 00       	call   628 <sem_create>
 130:	83 c4 10             	add    $0x10,%esp
 133:	a3 18 10 00 00       	mov    %eax,0x1018
 138:	a1 18 10 00 00       	mov    0x1018,%eax
 13d:	85 c0                	test   %eax,%eax
 13f:	79 17                	jns    158 <main+0xc1>
	{
		printf(1, "main: error initializing semaphore %d\n");
 141:	83 ec 08             	sub    $0x8,%esp
 144:	68 e0 0b 00 00       	push   $0xbe0
 149:	6a 01                	push   $0x1
 14b:	e8 db 05 00 00       	call   72b <printf>
 150:	83 c4 10             	add    $0x10,%esp
		exit();
 153:	e8 20 04 00 00       	call   578 <exit>
	}

	// Initialize counter
	g_counter = 0;
 158:	c7 05 10 10 00 00 00 	movl   $0x0,0x1010
 15f:	00 00 00 
	// Args
	int *args[MAX_NUM_THREADS];

	// Allocate stacks and args and make sure we have them all
	// Bail if something fails
	for (i=0; i<NUM_THREADS; i++) {
 162:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 169:	eb 51                	jmp    1bc <main+0x125>

		args[i] = (int*) malloc(4);
 16b:	83 ec 0c             	sub    $0xc,%esp
 16e:	6a 04                	push   $0x4
 170:	e8 89 08 00 00       	call   9fe <malloc>
 175:	83 c4 10             	add    $0x10,%esp
 178:	89 c2                	mov    %eax,%edx
 17a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 17d:	89 94 85 e8 fe ff ff 	mov    %edx,-0x118(%ebp,%eax,4)
		if (!args[i]) {
 184:	8b 45 f4             	mov    -0xc(%ebp),%eax
 187:	8b 84 85 e8 fe ff ff 	mov    -0x118(%ebp,%eax,4),%eax
 18e:	85 c0                	test   %eax,%eax
 190:	75 17                	jne    1a9 <main+0x112>
			printf(1, "main: could not get memory (for arg) for thread %d, exiting...\n");
 192:	83 ec 08             	sub    $0x8,%esp
 195:	68 08 0c 00 00       	push   $0xc08
 19a:	6a 01                	push   $0x1
 19c:	e8 8a 05 00 00       	call   72b <printf>
 1a1:	83 c4 10             	add    $0x10,%esp
			exit();
 1a4:	e8 cf 03 00 00       	call   578 <exit>
		}

		*args[i] = i;
 1a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ac:	8b 84 85 e8 fe ff ff 	mov    -0x118(%ebp,%eax,4),%eax
 1b3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1b6:	89 10                	mov    %edx,(%eax)
	for (i=0; i<NUM_THREADS; i++) {
 1b8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 1bc:	a1 1c 10 00 00       	mov    0x101c,%eax
 1c1:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 1c4:	7c a5                	jl     16b <main+0xd4>
	}

	printf(1, "main: running with %d threads...\n", NUM_THREADS);
 1c6:	a1 1c 10 00 00       	mov    0x101c,%eax
 1cb:	83 ec 04             	sub    $0x4,%esp
 1ce:	50                   	push   %eax
 1cf:	68 48 0c 00 00       	push   $0xc48
 1d4:	6a 01                	push   $0x1
 1d6:	e8 50 05 00 00       	call   72b <printf>
 1db:	83 c4 10             	add    $0x10,%esp

	// Start all children
	int pid[MAX_NUM_THREADS];

	for (i=0; i<NUM_THREADS; i++) {
 1de:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 1e5:	eb 6e                	jmp    255 <main+0x1be>
		pid[i] = hufs_thread_create(thread, args[i]);
 1e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ea:	8b 84 85 e8 fe ff ff 	mov    -0x118(%ebp,%eax,4),%eax
 1f1:	83 ec 08             	sub    $0x8,%esp
 1f4:	50                   	push   %eax
 1f5:	68 00 00 00 00       	push   $0x0
 1fa:	e8 e2 08 00 00       	call   ae1 <hufs_thread_create>
 1ff:	83 c4 10             	add    $0x10,%esp
 202:	89 c2                	mov    %eax,%edx
 204:	8b 45 f4             	mov    -0xc(%ebp),%eax
 207:	89 94 85 e8 fd ff ff 	mov    %edx,-0x218(%ebp,%eax,4)
		if (pid[i]==-1) {
 20e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 211:	8b 84 85 e8 fd ff ff 	mov    -0x218(%ebp,%eax,4),%eax
 218:	83 f8 ff             	cmp    $0xffffffff,%eax
 21b:	75 17                	jne    234 <main+0x19d>
			printf(1, "main: failed to creat a %d-th thread with pid %d\n", i);
 21d:	83 ec 04             	sub    $0x4,%esp
 220:	ff 75 f4             	pushl  -0xc(%ebp)
 223:	68 6c 0c 00 00       	push   $0xc6c
 228:	6a 01                	push   $0x1
 22a:	e8 fc 04 00 00       	call   72b <printf>
 22f:	83 c4 10             	add    $0x10,%esp
 232:	eb 1d                	jmp    251 <main+0x1ba>
		}
		else printf(1, "main: created thread with pid %d\n", pid[i]);
 234:	8b 45 f4             	mov    -0xc(%ebp),%eax
 237:	8b 84 85 e8 fd ff ff 	mov    -0x218(%ebp,%eax,4),%eax
 23e:	83 ec 04             	sub    $0x4,%esp
 241:	50                   	push   %eax
 242:	68 a0 0c 00 00       	push   $0xca0
 247:	6a 01                	push   $0x1
 249:	e8 dd 04 00 00       	call   72b <printf>
 24e:	83 c4 10             	add    $0x10,%esp
	for (i=0; i<NUM_THREADS; i++) {
 251:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 255:	a1 1c 10 00 00       	mov    0x101c,%eax
 25a:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 25d:	7c 88                	jl     1e7 <main+0x150>
	}
	
	// Wait for all children
	for (i=0; i<NUM_THREADS; i++) {
 25f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 266:	eb 4e                	jmp    2b6 <main+0x21f>
		printf(1, "before joining... \n");
 268:	83 ec 08             	sub    $0x8,%esp
 26b:	68 c2 0c 00 00       	push   $0xcc2
 270:	6a 01                	push   $0x1
 272:	e8 b4 04 00 00       	call   72b <printf>
 277:	83 c4 10             	add    $0x10,%esp
		if (pid[i]!=-1) 
 27a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 27d:	8b 84 85 e8 fd ff ff 	mov    -0x218(%ebp,%eax,4),%eax
 284:	83 f8 ff             	cmp    $0xffffffff,%eax
 287:	74 29                	je     2b2 <main+0x21b>
			printf(1, "main: thread %d joined...\n", hufs_thread_join(pid[i]));
 289:	8b 45 f4             	mov    -0xc(%ebp),%eax
 28c:	8b 84 85 e8 fd ff ff 	mov    -0x218(%ebp,%eax,4),%eax
 293:	83 ec 0c             	sub    $0xc,%esp
 296:	50                   	push   %eax
 297:	e8 af 08 00 00       	call   b4b <hufs_thread_join>
 29c:	83 c4 10             	add    $0x10,%esp
 29f:	83 ec 04             	sub    $0x4,%esp
 2a2:	50                   	push   %eax
 2a3:	68 d6 0c 00 00       	push   $0xcd6
 2a8:	6a 01                	push   $0x1
 2aa:	e8 7c 04 00 00       	call   72b <printf>
 2af:	83 c4 10             	add    $0x10,%esp
	for (i=0; i<NUM_THREADS; i++) {
 2b2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 2b6:	a1 1c 10 00 00       	mov    0x101c,%eax
 2bb:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 2be:	7c a8                	jl     268 <main+0x1d1>
	}

	// Check the result
	final_counter = g_counter;
 2c0:	a1 10 10 00 00       	mov    0x1010,%eax
 2c5:	89 45 e8             	mov    %eax,-0x18(%ebp)
	printf(1, "Final counter is %d, target is %d\n", final_counter, final_target);
 2c8:	ff 75 f0             	pushl  -0x10(%ebp)
 2cb:	ff 75 e8             	pushl  -0x18(%ebp)
 2ce:	68 f4 0c 00 00       	push   $0xcf4
 2d3:	6a 01                	push   $0x1
 2d5:	e8 51 04 00 00       	call   72b <printf>
 2da:	83 c4 10             	add    $0x10,%esp
	if (final_counter == final_target)
 2dd:	8b 45 e8             	mov    -0x18(%ebp),%eax
 2e0:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 2e3:	75 14                	jne    2f9 <main+0x262>
		printf(1, "TEST PASSED!\n");
 2e5:	83 ec 08             	sub    $0x8,%esp
 2e8:	68 17 0d 00 00       	push   $0xd17
 2ed:	6a 01                	push   $0x1
 2ef:	e8 37 04 00 00       	call   72b <printf>
 2f4:	83 c4 10             	add    $0x10,%esp
 2f7:	eb 12                	jmp    30b <main+0x274>
	else
		printf(1, "TEST FAILED!\n");
 2f9:	83 ec 08             	sub    $0x8,%esp
 2fc:	68 25 0d 00 00       	push   $0xd25
 301:	6a 01                	push   $0x1
 303:	e8 23 04 00 00       	call   72b <printf>
 308:	83 c4 10             	add    $0x10,%esp
	
	// Clean up semaphore
	sem_destroy(sem_id);
 30b:	a1 18 10 00 00       	mov    0x1018,%eax
 310:	83 ec 0c             	sub    $0xc,%esp
 313:	50                   	push   %eax
 314:	e8 17 03 00 00       	call   630 <sem_destroy>
 319:	83 c4 10             	add    $0x10,%esp

	// Exit
	exit();
 31c:	e8 57 02 00 00       	call   578 <exit>

00000321 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 321:	55                   	push   %ebp
 322:	89 e5                	mov    %esp,%ebp
 324:	57                   	push   %edi
 325:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 326:	8b 4d 08             	mov    0x8(%ebp),%ecx
 329:	8b 55 10             	mov    0x10(%ebp),%edx
 32c:	8b 45 0c             	mov    0xc(%ebp),%eax
 32f:	89 cb                	mov    %ecx,%ebx
 331:	89 df                	mov    %ebx,%edi
 333:	89 d1                	mov    %edx,%ecx
 335:	fc                   	cld    
 336:	f3 aa                	rep stos %al,%es:(%edi)
 338:	89 ca                	mov    %ecx,%edx
 33a:	89 fb                	mov    %edi,%ebx
 33c:	89 5d 08             	mov    %ebx,0x8(%ebp)
 33f:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 342:	90                   	nop
 343:	5b                   	pop    %ebx
 344:	5f                   	pop    %edi
 345:	5d                   	pop    %ebp
 346:	c3                   	ret    

00000347 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 347:	55                   	push   %ebp
 348:	89 e5                	mov    %esp,%ebp
 34a:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 34d:	8b 45 08             	mov    0x8(%ebp),%eax
 350:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 353:	90                   	nop
 354:	8b 55 0c             	mov    0xc(%ebp),%edx
 357:	8d 42 01             	lea    0x1(%edx),%eax
 35a:	89 45 0c             	mov    %eax,0xc(%ebp)
 35d:	8b 45 08             	mov    0x8(%ebp),%eax
 360:	8d 48 01             	lea    0x1(%eax),%ecx
 363:	89 4d 08             	mov    %ecx,0x8(%ebp)
 366:	0f b6 12             	movzbl (%edx),%edx
 369:	88 10                	mov    %dl,(%eax)
 36b:	0f b6 00             	movzbl (%eax),%eax
 36e:	84 c0                	test   %al,%al
 370:	75 e2                	jne    354 <strcpy+0xd>
    ;
  return os;
 372:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 375:	c9                   	leave  
 376:	c3                   	ret    

00000377 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 377:	55                   	push   %ebp
 378:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 37a:	eb 08                	jmp    384 <strcmp+0xd>
    p++, q++;
 37c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 380:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 384:	8b 45 08             	mov    0x8(%ebp),%eax
 387:	0f b6 00             	movzbl (%eax),%eax
 38a:	84 c0                	test   %al,%al
 38c:	74 10                	je     39e <strcmp+0x27>
 38e:	8b 45 08             	mov    0x8(%ebp),%eax
 391:	0f b6 10             	movzbl (%eax),%edx
 394:	8b 45 0c             	mov    0xc(%ebp),%eax
 397:	0f b6 00             	movzbl (%eax),%eax
 39a:	38 c2                	cmp    %al,%dl
 39c:	74 de                	je     37c <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 39e:	8b 45 08             	mov    0x8(%ebp),%eax
 3a1:	0f b6 00             	movzbl (%eax),%eax
 3a4:	0f b6 d0             	movzbl %al,%edx
 3a7:	8b 45 0c             	mov    0xc(%ebp),%eax
 3aa:	0f b6 00             	movzbl (%eax),%eax
 3ad:	0f b6 c0             	movzbl %al,%eax
 3b0:	29 c2                	sub    %eax,%edx
 3b2:	89 d0                	mov    %edx,%eax
}
 3b4:	5d                   	pop    %ebp
 3b5:	c3                   	ret    

000003b6 <strlen>:

uint
strlen(char *s)
{
 3b6:	55                   	push   %ebp
 3b7:	89 e5                	mov    %esp,%ebp
 3b9:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3bc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 3c3:	eb 04                	jmp    3c9 <strlen+0x13>
 3c5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 3c9:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3cc:	8b 45 08             	mov    0x8(%ebp),%eax
 3cf:	01 d0                	add    %edx,%eax
 3d1:	0f b6 00             	movzbl (%eax),%eax
 3d4:	84 c0                	test   %al,%al
 3d6:	75 ed                	jne    3c5 <strlen+0xf>
    ;
  return n;
 3d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3db:	c9                   	leave  
 3dc:	c3                   	ret    

000003dd <memset>:

void*
memset(void *dst, int c, uint n)
{
 3dd:	55                   	push   %ebp
 3de:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 3e0:	8b 45 10             	mov    0x10(%ebp),%eax
 3e3:	50                   	push   %eax
 3e4:	ff 75 0c             	pushl  0xc(%ebp)
 3e7:	ff 75 08             	pushl  0x8(%ebp)
 3ea:	e8 32 ff ff ff       	call   321 <stosb>
 3ef:	83 c4 0c             	add    $0xc,%esp
  return dst;
 3f2:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3f5:	c9                   	leave  
 3f6:	c3                   	ret    

000003f7 <strchr>:

char*
strchr(const char *s, char c)
{
 3f7:	55                   	push   %ebp
 3f8:	89 e5                	mov    %esp,%ebp
 3fa:	83 ec 04             	sub    $0x4,%esp
 3fd:	8b 45 0c             	mov    0xc(%ebp),%eax
 400:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 403:	eb 14                	jmp    419 <strchr+0x22>
    if(*s == c)
 405:	8b 45 08             	mov    0x8(%ebp),%eax
 408:	0f b6 00             	movzbl (%eax),%eax
 40b:	38 45 fc             	cmp    %al,-0x4(%ebp)
 40e:	75 05                	jne    415 <strchr+0x1e>
      return (char*)s;
 410:	8b 45 08             	mov    0x8(%ebp),%eax
 413:	eb 13                	jmp    428 <strchr+0x31>
  for(; *s; s++)
 415:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 419:	8b 45 08             	mov    0x8(%ebp),%eax
 41c:	0f b6 00             	movzbl (%eax),%eax
 41f:	84 c0                	test   %al,%al
 421:	75 e2                	jne    405 <strchr+0xe>
  return 0;
 423:	b8 00 00 00 00       	mov    $0x0,%eax
}
 428:	c9                   	leave  
 429:	c3                   	ret    

0000042a <gets>:

char*
gets(char *buf, int max)
{
 42a:	55                   	push   %ebp
 42b:	89 e5                	mov    %esp,%ebp
 42d:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 430:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 437:	eb 42                	jmp    47b <gets+0x51>
    cc = read(0, &c, 1);
 439:	83 ec 04             	sub    $0x4,%esp
 43c:	6a 01                	push   $0x1
 43e:	8d 45 ef             	lea    -0x11(%ebp),%eax
 441:	50                   	push   %eax
 442:	6a 00                	push   $0x0
 444:	e8 47 01 00 00       	call   590 <read>
 449:	83 c4 10             	add    $0x10,%esp
 44c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 44f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 453:	7e 33                	jle    488 <gets+0x5e>
      break;
    buf[i++] = c;
 455:	8b 45 f4             	mov    -0xc(%ebp),%eax
 458:	8d 50 01             	lea    0x1(%eax),%edx
 45b:	89 55 f4             	mov    %edx,-0xc(%ebp)
 45e:	89 c2                	mov    %eax,%edx
 460:	8b 45 08             	mov    0x8(%ebp),%eax
 463:	01 c2                	add    %eax,%edx
 465:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 469:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 46b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 46f:	3c 0a                	cmp    $0xa,%al
 471:	74 16                	je     489 <gets+0x5f>
 473:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 477:	3c 0d                	cmp    $0xd,%al
 479:	74 0e                	je     489 <gets+0x5f>
  for(i=0; i+1 < max; ){
 47b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 47e:	83 c0 01             	add    $0x1,%eax
 481:	39 45 0c             	cmp    %eax,0xc(%ebp)
 484:	7f b3                	jg     439 <gets+0xf>
 486:	eb 01                	jmp    489 <gets+0x5f>
      break;
 488:	90                   	nop
      break;
  }
  buf[i] = '\0';
 489:	8b 55 f4             	mov    -0xc(%ebp),%edx
 48c:	8b 45 08             	mov    0x8(%ebp),%eax
 48f:	01 d0                	add    %edx,%eax
 491:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 494:	8b 45 08             	mov    0x8(%ebp),%eax
}
 497:	c9                   	leave  
 498:	c3                   	ret    

00000499 <stat>:

int
stat(char *n, struct stat *st)
{
 499:	55                   	push   %ebp
 49a:	89 e5                	mov    %esp,%ebp
 49c:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 49f:	83 ec 08             	sub    $0x8,%esp
 4a2:	6a 00                	push   $0x0
 4a4:	ff 75 08             	pushl  0x8(%ebp)
 4a7:	e8 0c 01 00 00       	call   5b8 <open>
 4ac:	83 c4 10             	add    $0x10,%esp
 4af:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 4b2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4b6:	79 07                	jns    4bf <stat+0x26>
    return -1;
 4b8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4bd:	eb 25                	jmp    4e4 <stat+0x4b>
  r = fstat(fd, st);
 4bf:	83 ec 08             	sub    $0x8,%esp
 4c2:	ff 75 0c             	pushl  0xc(%ebp)
 4c5:	ff 75 f4             	pushl  -0xc(%ebp)
 4c8:	e8 03 01 00 00       	call   5d0 <fstat>
 4cd:	83 c4 10             	add    $0x10,%esp
 4d0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 4d3:	83 ec 0c             	sub    $0xc,%esp
 4d6:	ff 75 f4             	pushl  -0xc(%ebp)
 4d9:	e8 c2 00 00 00       	call   5a0 <close>
 4de:	83 c4 10             	add    $0x10,%esp
  return r;
 4e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 4e4:	c9                   	leave  
 4e5:	c3                   	ret    

000004e6 <atoi>:

int
atoi(const char *s)
{
 4e6:	55                   	push   %ebp
 4e7:	89 e5                	mov    %esp,%ebp
 4e9:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 4ec:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 4f3:	eb 25                	jmp    51a <atoi+0x34>
    n = n*10 + *s++ - '0';
 4f5:	8b 55 fc             	mov    -0x4(%ebp),%edx
 4f8:	89 d0                	mov    %edx,%eax
 4fa:	c1 e0 02             	shl    $0x2,%eax
 4fd:	01 d0                	add    %edx,%eax
 4ff:	01 c0                	add    %eax,%eax
 501:	89 c1                	mov    %eax,%ecx
 503:	8b 45 08             	mov    0x8(%ebp),%eax
 506:	8d 50 01             	lea    0x1(%eax),%edx
 509:	89 55 08             	mov    %edx,0x8(%ebp)
 50c:	0f b6 00             	movzbl (%eax),%eax
 50f:	0f be c0             	movsbl %al,%eax
 512:	01 c8                	add    %ecx,%eax
 514:	83 e8 30             	sub    $0x30,%eax
 517:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 51a:	8b 45 08             	mov    0x8(%ebp),%eax
 51d:	0f b6 00             	movzbl (%eax),%eax
 520:	3c 2f                	cmp    $0x2f,%al
 522:	7e 0a                	jle    52e <atoi+0x48>
 524:	8b 45 08             	mov    0x8(%ebp),%eax
 527:	0f b6 00             	movzbl (%eax),%eax
 52a:	3c 39                	cmp    $0x39,%al
 52c:	7e c7                	jle    4f5 <atoi+0xf>
  return n;
 52e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 531:	c9                   	leave  
 532:	c3                   	ret    

00000533 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 533:	55                   	push   %ebp
 534:	89 e5                	mov    %esp,%ebp
 536:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 539:	8b 45 08             	mov    0x8(%ebp),%eax
 53c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 53f:	8b 45 0c             	mov    0xc(%ebp),%eax
 542:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 545:	eb 17                	jmp    55e <memmove+0x2b>
    *dst++ = *src++;
 547:	8b 55 f8             	mov    -0x8(%ebp),%edx
 54a:	8d 42 01             	lea    0x1(%edx),%eax
 54d:	89 45 f8             	mov    %eax,-0x8(%ebp)
 550:	8b 45 fc             	mov    -0x4(%ebp),%eax
 553:	8d 48 01             	lea    0x1(%eax),%ecx
 556:	89 4d fc             	mov    %ecx,-0x4(%ebp)
 559:	0f b6 12             	movzbl (%edx),%edx
 55c:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 55e:	8b 45 10             	mov    0x10(%ebp),%eax
 561:	8d 50 ff             	lea    -0x1(%eax),%edx
 564:	89 55 10             	mov    %edx,0x10(%ebp)
 567:	85 c0                	test   %eax,%eax
 569:	7f dc                	jg     547 <memmove+0x14>
  return vdst;
 56b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 56e:	c9                   	leave  
 56f:	c3                   	ret    

00000570 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 570:	b8 01 00 00 00       	mov    $0x1,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <exit>:
SYSCALL(exit)
 578:	b8 02 00 00 00       	mov    $0x2,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <wait>:
SYSCALL(wait)
 580:	b8 03 00 00 00       	mov    $0x3,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <pipe>:
SYSCALL(pipe)
 588:	b8 04 00 00 00       	mov    $0x4,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <read>:
SYSCALL(read)
 590:	b8 05 00 00 00       	mov    $0x5,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <write>:
SYSCALL(write)
 598:	b8 10 00 00 00       	mov    $0x10,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <close>:
SYSCALL(close)
 5a0:	b8 15 00 00 00       	mov    $0x15,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <kill>:
SYSCALL(kill)
 5a8:	b8 06 00 00 00       	mov    $0x6,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <exec>:
SYSCALL(exec)
 5b0:	b8 07 00 00 00       	mov    $0x7,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <open>:
SYSCALL(open)
 5b8:	b8 0f 00 00 00       	mov    $0xf,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <mknod>:
SYSCALL(mknod)
 5c0:	b8 11 00 00 00       	mov    $0x11,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <unlink>:
SYSCALL(unlink)
 5c8:	b8 12 00 00 00       	mov    $0x12,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <fstat>:
SYSCALL(fstat)
 5d0:	b8 08 00 00 00       	mov    $0x8,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <link>:
SYSCALL(link)
 5d8:	b8 13 00 00 00       	mov    $0x13,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <mkdir>:
SYSCALL(mkdir)
 5e0:	b8 14 00 00 00       	mov    $0x14,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <chdir>:
SYSCALL(chdir)
 5e8:	b8 09 00 00 00       	mov    $0x9,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <dup>:
SYSCALL(dup)
 5f0:	b8 0a 00 00 00       	mov    $0xa,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <getpid>:
SYSCALL(getpid)
 5f8:	b8 0b 00 00 00       	mov    $0xb,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <sbrk>:
SYSCALL(sbrk)
 600:	b8 0c 00 00 00       	mov    $0xc,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <sleep>:
SYSCALL(sleep)
 608:	b8 0d 00 00 00       	mov    $0xd,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <uptime>:
SYSCALL(uptime)
 610:	b8 0e 00 00 00       	mov    $0xe,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <halt>:
SYSCALL(halt)
 618:	b8 16 00 00 00       	mov    $0x16,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <getnp>:
SYSCALL(getnp)
 620:	b8 17 00 00 00       	mov    $0x17,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <sem_create>:
SYSCALL(sem_create)
 628:	b8 18 00 00 00       	mov    $0x18,%eax
 62d:	cd 40                	int    $0x40
 62f:	c3                   	ret    

00000630 <sem_destroy>:
SYSCALL(sem_destroy)
 630:	b8 19 00 00 00       	mov    $0x19,%eax
 635:	cd 40                	int    $0x40
 637:	c3                   	ret    

00000638 <sem_wait>:
SYSCALL(sem_wait)
 638:	b8 1a 00 00 00       	mov    $0x1a,%eax
 63d:	cd 40                	int    $0x40
 63f:	c3                   	ret    

00000640 <sem_signal>:
SYSCALL(sem_signal)
 640:	b8 1b 00 00 00       	mov    $0x1b,%eax
 645:	cd 40                	int    $0x40
 647:	c3                   	ret    

00000648 <clone>:
SYSCALL(clone)
 648:	b8 1c 00 00 00       	mov    $0x1c,%eax
 64d:	cd 40                	int    $0x40
 64f:	c3                   	ret    

00000650 <join>:
SYSCALL(join)
 650:	b8 1d 00 00 00       	mov    $0x1d,%eax
 655:	cd 40                	int    $0x40
 657:	c3                   	ret    

00000658 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 658:	55                   	push   %ebp
 659:	89 e5                	mov    %esp,%ebp
 65b:	83 ec 18             	sub    $0x18,%esp
 65e:	8b 45 0c             	mov    0xc(%ebp),%eax
 661:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 664:	83 ec 04             	sub    $0x4,%esp
 667:	6a 01                	push   $0x1
 669:	8d 45 f4             	lea    -0xc(%ebp),%eax
 66c:	50                   	push   %eax
 66d:	ff 75 08             	pushl  0x8(%ebp)
 670:	e8 23 ff ff ff       	call   598 <write>
 675:	83 c4 10             	add    $0x10,%esp
}
 678:	90                   	nop
 679:	c9                   	leave  
 67a:	c3                   	ret    

0000067b <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 67b:	55                   	push   %ebp
 67c:	89 e5                	mov    %esp,%ebp
 67e:	83 ec 28             	sub    $0x28,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 681:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 688:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 68c:	74 17                	je     6a5 <printint+0x2a>
 68e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 692:	79 11                	jns    6a5 <printint+0x2a>
    neg = 1;
 694:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 69b:	8b 45 0c             	mov    0xc(%ebp),%eax
 69e:	f7 d8                	neg    %eax
 6a0:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6a3:	eb 06                	jmp    6ab <printint+0x30>
  } else {
    x = xx;
 6a5:	8b 45 0c             	mov    0xc(%ebp),%eax
 6a8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 6ab:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 6b2:	8b 4d 10             	mov    0x10(%ebp),%ecx
 6b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6b8:	ba 00 00 00 00       	mov    $0x0,%edx
 6bd:	f7 f1                	div    %ecx
 6bf:	89 d1                	mov    %edx,%ecx
 6c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6c4:	8d 50 01             	lea    0x1(%eax),%edx
 6c7:	89 55 f4             	mov    %edx,-0xc(%ebp)
 6ca:	0f b6 91 e0 0f 00 00 	movzbl 0xfe0(%ecx),%edx
 6d1:	88 54 05 dc          	mov    %dl,-0x24(%ebp,%eax,1)
  }while((x /= base) != 0);
 6d5:	8b 4d 10             	mov    0x10(%ebp),%ecx
 6d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6db:	ba 00 00 00 00       	mov    $0x0,%edx
 6e0:	f7 f1                	div    %ecx
 6e2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6e5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6e9:	75 c7                	jne    6b2 <printint+0x37>
  if(neg)
 6eb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6ef:	74 2d                	je     71e <printint+0xa3>
    buf[i++] = '-';
 6f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6f4:	8d 50 01             	lea    0x1(%eax),%edx
 6f7:	89 55 f4             	mov    %edx,-0xc(%ebp)
 6fa:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 6ff:	eb 1d                	jmp    71e <printint+0xa3>
    putc(fd, buf[i]);
 701:	8d 55 dc             	lea    -0x24(%ebp),%edx
 704:	8b 45 f4             	mov    -0xc(%ebp),%eax
 707:	01 d0                	add    %edx,%eax
 709:	0f b6 00             	movzbl (%eax),%eax
 70c:	0f be c0             	movsbl %al,%eax
 70f:	83 ec 08             	sub    $0x8,%esp
 712:	50                   	push   %eax
 713:	ff 75 08             	pushl  0x8(%ebp)
 716:	e8 3d ff ff ff       	call   658 <putc>
 71b:	83 c4 10             	add    $0x10,%esp
  while(--i >= 0)
 71e:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 722:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 726:	79 d9                	jns    701 <printint+0x86>
}
 728:	90                   	nop
 729:	c9                   	leave  
 72a:	c3                   	ret    

0000072b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 72b:	55                   	push   %ebp
 72c:	89 e5                	mov    %esp,%ebp
 72e:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 731:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 738:	8d 45 0c             	lea    0xc(%ebp),%eax
 73b:	83 c0 04             	add    $0x4,%eax
 73e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 741:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 748:	e9 59 01 00 00       	jmp    8a6 <printf+0x17b>
    c = fmt[i] & 0xff;
 74d:	8b 55 0c             	mov    0xc(%ebp),%edx
 750:	8b 45 f0             	mov    -0x10(%ebp),%eax
 753:	01 d0                	add    %edx,%eax
 755:	0f b6 00             	movzbl (%eax),%eax
 758:	0f be c0             	movsbl %al,%eax
 75b:	25 ff 00 00 00       	and    $0xff,%eax
 760:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 763:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 767:	75 2c                	jne    795 <printf+0x6a>
      if(c == '%'){
 769:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 76d:	75 0c                	jne    77b <printf+0x50>
        state = '%';
 76f:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 776:	e9 27 01 00 00       	jmp    8a2 <printf+0x177>
      } else {
        putc(fd, c);
 77b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 77e:	0f be c0             	movsbl %al,%eax
 781:	83 ec 08             	sub    $0x8,%esp
 784:	50                   	push   %eax
 785:	ff 75 08             	pushl  0x8(%ebp)
 788:	e8 cb fe ff ff       	call   658 <putc>
 78d:	83 c4 10             	add    $0x10,%esp
 790:	e9 0d 01 00 00       	jmp    8a2 <printf+0x177>
      }
    } else if(state == '%'){
 795:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 799:	0f 85 03 01 00 00    	jne    8a2 <printf+0x177>
      if(c == 'd'){
 79f:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 7a3:	75 1e                	jne    7c3 <printf+0x98>
        printint(fd, *ap, 10, 1);
 7a5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7a8:	8b 00                	mov    (%eax),%eax
 7aa:	6a 01                	push   $0x1
 7ac:	6a 0a                	push   $0xa
 7ae:	50                   	push   %eax
 7af:	ff 75 08             	pushl  0x8(%ebp)
 7b2:	e8 c4 fe ff ff       	call   67b <printint>
 7b7:	83 c4 10             	add    $0x10,%esp
        ap++;
 7ba:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7be:	e9 d8 00 00 00       	jmp    89b <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 7c3:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 7c7:	74 06                	je     7cf <printf+0xa4>
 7c9:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 7cd:	75 1e                	jne    7ed <printf+0xc2>
        printint(fd, *ap, 16, 0);
 7cf:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7d2:	8b 00                	mov    (%eax),%eax
 7d4:	6a 00                	push   $0x0
 7d6:	6a 10                	push   $0x10
 7d8:	50                   	push   %eax
 7d9:	ff 75 08             	pushl  0x8(%ebp)
 7dc:	e8 9a fe ff ff       	call   67b <printint>
 7e1:	83 c4 10             	add    $0x10,%esp
        ap++;
 7e4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7e8:	e9 ae 00 00 00       	jmp    89b <printf+0x170>
      } else if(c == 's'){
 7ed:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 7f1:	75 43                	jne    836 <printf+0x10b>
        s = (char*)*ap;
 7f3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7f6:	8b 00                	mov    (%eax),%eax
 7f8:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 7fb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 7ff:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 803:	75 25                	jne    82a <printf+0xff>
          s = "(null)";
 805:	c7 45 f4 33 0d 00 00 	movl   $0xd33,-0xc(%ebp)
        while(*s != 0){
 80c:	eb 1c                	jmp    82a <printf+0xff>
          putc(fd, *s);
 80e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 811:	0f b6 00             	movzbl (%eax),%eax
 814:	0f be c0             	movsbl %al,%eax
 817:	83 ec 08             	sub    $0x8,%esp
 81a:	50                   	push   %eax
 81b:	ff 75 08             	pushl  0x8(%ebp)
 81e:	e8 35 fe ff ff       	call   658 <putc>
 823:	83 c4 10             	add    $0x10,%esp
          s++;
 826:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 82a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 82d:	0f b6 00             	movzbl (%eax),%eax
 830:	84 c0                	test   %al,%al
 832:	75 da                	jne    80e <printf+0xe3>
 834:	eb 65                	jmp    89b <printf+0x170>
        }
      } else if(c == 'c'){
 836:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 83a:	75 1d                	jne    859 <printf+0x12e>
        putc(fd, *ap);
 83c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 83f:	8b 00                	mov    (%eax),%eax
 841:	0f be c0             	movsbl %al,%eax
 844:	83 ec 08             	sub    $0x8,%esp
 847:	50                   	push   %eax
 848:	ff 75 08             	pushl  0x8(%ebp)
 84b:	e8 08 fe ff ff       	call   658 <putc>
 850:	83 c4 10             	add    $0x10,%esp
        ap++;
 853:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 857:	eb 42                	jmp    89b <printf+0x170>
      } else if(c == '%'){
 859:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 85d:	75 17                	jne    876 <printf+0x14b>
        putc(fd, c);
 85f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 862:	0f be c0             	movsbl %al,%eax
 865:	83 ec 08             	sub    $0x8,%esp
 868:	50                   	push   %eax
 869:	ff 75 08             	pushl  0x8(%ebp)
 86c:	e8 e7 fd ff ff       	call   658 <putc>
 871:	83 c4 10             	add    $0x10,%esp
 874:	eb 25                	jmp    89b <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 876:	83 ec 08             	sub    $0x8,%esp
 879:	6a 25                	push   $0x25
 87b:	ff 75 08             	pushl  0x8(%ebp)
 87e:	e8 d5 fd ff ff       	call   658 <putc>
 883:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 886:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 889:	0f be c0             	movsbl %al,%eax
 88c:	83 ec 08             	sub    $0x8,%esp
 88f:	50                   	push   %eax
 890:	ff 75 08             	pushl  0x8(%ebp)
 893:	e8 c0 fd ff ff       	call   658 <putc>
 898:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 89b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 8a2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8a6:	8b 55 0c             	mov    0xc(%ebp),%edx
 8a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ac:	01 d0                	add    %edx,%eax
 8ae:	0f b6 00             	movzbl (%eax),%eax
 8b1:	84 c0                	test   %al,%al
 8b3:	0f 85 94 fe ff ff    	jne    74d <printf+0x22>
    }
  }
}
 8b9:	90                   	nop
 8ba:	c9                   	leave  
 8bb:	c3                   	ret    

000008bc <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8bc:	55                   	push   %ebp
 8bd:	89 e5                	mov    %esp,%ebp
 8bf:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8c2:	8b 45 08             	mov    0x8(%ebp),%eax
 8c5:	83 e8 08             	sub    $0x8,%eax
 8c8:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8cb:	a1 08 10 00 00       	mov    0x1008,%eax
 8d0:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8d3:	eb 24                	jmp    8f9 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d8:	8b 00                	mov    (%eax),%eax
 8da:	39 45 fc             	cmp    %eax,-0x4(%ebp)
 8dd:	72 12                	jb     8f1 <free+0x35>
 8df:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8e2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8e5:	77 24                	ja     90b <free+0x4f>
 8e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ea:	8b 00                	mov    (%eax),%eax
 8ec:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 8ef:	72 1a                	jb     90b <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f4:	8b 00                	mov    (%eax),%eax
 8f6:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8f9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8fc:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8ff:	76 d4                	jbe    8d5 <free+0x19>
 901:	8b 45 fc             	mov    -0x4(%ebp),%eax
 904:	8b 00                	mov    (%eax),%eax
 906:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 909:	73 ca                	jae    8d5 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 90b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 90e:	8b 40 04             	mov    0x4(%eax),%eax
 911:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 918:	8b 45 f8             	mov    -0x8(%ebp),%eax
 91b:	01 c2                	add    %eax,%edx
 91d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 920:	8b 00                	mov    (%eax),%eax
 922:	39 c2                	cmp    %eax,%edx
 924:	75 24                	jne    94a <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 926:	8b 45 f8             	mov    -0x8(%ebp),%eax
 929:	8b 50 04             	mov    0x4(%eax),%edx
 92c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 92f:	8b 00                	mov    (%eax),%eax
 931:	8b 40 04             	mov    0x4(%eax),%eax
 934:	01 c2                	add    %eax,%edx
 936:	8b 45 f8             	mov    -0x8(%ebp),%eax
 939:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 93c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 93f:	8b 00                	mov    (%eax),%eax
 941:	8b 10                	mov    (%eax),%edx
 943:	8b 45 f8             	mov    -0x8(%ebp),%eax
 946:	89 10                	mov    %edx,(%eax)
 948:	eb 0a                	jmp    954 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 94a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 94d:	8b 10                	mov    (%eax),%edx
 94f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 952:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 954:	8b 45 fc             	mov    -0x4(%ebp),%eax
 957:	8b 40 04             	mov    0x4(%eax),%eax
 95a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 961:	8b 45 fc             	mov    -0x4(%ebp),%eax
 964:	01 d0                	add    %edx,%eax
 966:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 969:	75 20                	jne    98b <free+0xcf>
    p->s.size += bp->s.size;
 96b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 96e:	8b 50 04             	mov    0x4(%eax),%edx
 971:	8b 45 f8             	mov    -0x8(%ebp),%eax
 974:	8b 40 04             	mov    0x4(%eax),%eax
 977:	01 c2                	add    %eax,%edx
 979:	8b 45 fc             	mov    -0x4(%ebp),%eax
 97c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 97f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 982:	8b 10                	mov    (%eax),%edx
 984:	8b 45 fc             	mov    -0x4(%ebp),%eax
 987:	89 10                	mov    %edx,(%eax)
 989:	eb 08                	jmp    993 <free+0xd7>
  } else
    p->s.ptr = bp;
 98b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 98e:	8b 55 f8             	mov    -0x8(%ebp),%edx
 991:	89 10                	mov    %edx,(%eax)
  freep = p;
 993:	8b 45 fc             	mov    -0x4(%ebp),%eax
 996:	a3 08 10 00 00       	mov    %eax,0x1008
}
 99b:	90                   	nop
 99c:	c9                   	leave  
 99d:	c3                   	ret    

0000099e <morecore>:

static Header*
morecore(uint nu)
{
 99e:	55                   	push   %ebp
 99f:	89 e5                	mov    %esp,%ebp
 9a1:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 9a4:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 9ab:	77 07                	ja     9b4 <morecore+0x16>
    nu = 4096;
 9ad:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 9b4:	8b 45 08             	mov    0x8(%ebp),%eax
 9b7:	c1 e0 03             	shl    $0x3,%eax
 9ba:	83 ec 0c             	sub    $0xc,%esp
 9bd:	50                   	push   %eax
 9be:	e8 3d fc ff ff       	call   600 <sbrk>
 9c3:	83 c4 10             	add    $0x10,%esp
 9c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 9c9:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 9cd:	75 07                	jne    9d6 <morecore+0x38>
    return 0;
 9cf:	b8 00 00 00 00       	mov    $0x0,%eax
 9d4:	eb 26                	jmp    9fc <morecore+0x5e>
  hp = (Header*)p;
 9d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 9dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9df:	8b 55 08             	mov    0x8(%ebp),%edx
 9e2:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 9e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9e8:	83 c0 08             	add    $0x8,%eax
 9eb:	83 ec 0c             	sub    $0xc,%esp
 9ee:	50                   	push   %eax
 9ef:	e8 c8 fe ff ff       	call   8bc <free>
 9f4:	83 c4 10             	add    $0x10,%esp
  return freep;
 9f7:	a1 08 10 00 00       	mov    0x1008,%eax
}
 9fc:	c9                   	leave  
 9fd:	c3                   	ret    

000009fe <malloc>:

void*
malloc(uint nbytes)
{
 9fe:	55                   	push   %ebp
 9ff:	89 e5                	mov    %esp,%ebp
 a01:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a04:	8b 45 08             	mov    0x8(%ebp),%eax
 a07:	83 c0 07             	add    $0x7,%eax
 a0a:	c1 e8 03             	shr    $0x3,%eax
 a0d:	83 c0 01             	add    $0x1,%eax
 a10:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 a13:	a1 08 10 00 00       	mov    0x1008,%eax
 a18:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a1b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a1f:	75 23                	jne    a44 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a21:	c7 45 f0 00 10 00 00 	movl   $0x1000,-0x10(%ebp)
 a28:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a2b:	a3 08 10 00 00       	mov    %eax,0x1008
 a30:	a1 08 10 00 00       	mov    0x1008,%eax
 a35:	a3 00 10 00 00       	mov    %eax,0x1000
    base.s.size = 0;
 a3a:	c7 05 04 10 00 00 00 	movl   $0x0,0x1004
 a41:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a44:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a47:	8b 00                	mov    (%eax),%eax
 a49:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a4f:	8b 40 04             	mov    0x4(%eax),%eax
 a52:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 a55:	77 4d                	ja     aa4 <malloc+0xa6>
      if(p->s.size == nunits)
 a57:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a5a:	8b 40 04             	mov    0x4(%eax),%eax
 a5d:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 a60:	75 0c                	jne    a6e <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a62:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a65:	8b 10                	mov    (%eax),%edx
 a67:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a6a:	89 10                	mov    %edx,(%eax)
 a6c:	eb 26                	jmp    a94 <malloc+0x96>
      else {
        p->s.size -= nunits;
 a6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a71:	8b 40 04             	mov    0x4(%eax),%eax
 a74:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a77:	89 c2                	mov    %eax,%edx
 a79:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a7c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a82:	8b 40 04             	mov    0x4(%eax),%eax
 a85:	c1 e0 03             	shl    $0x3,%eax
 a88:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a8e:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a91:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a94:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a97:	a3 08 10 00 00       	mov    %eax,0x1008
      return (void*)(p + 1);
 a9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a9f:	83 c0 08             	add    $0x8,%eax
 aa2:	eb 3b                	jmp    adf <malloc+0xe1>
    }
    if(p == freep)
 aa4:	a1 08 10 00 00       	mov    0x1008,%eax
 aa9:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 aac:	75 1e                	jne    acc <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 aae:	83 ec 0c             	sub    $0xc,%esp
 ab1:	ff 75 ec             	pushl  -0x14(%ebp)
 ab4:	e8 e5 fe ff ff       	call   99e <morecore>
 ab9:	83 c4 10             	add    $0x10,%esp
 abc:	89 45 f4             	mov    %eax,-0xc(%ebp)
 abf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 ac3:	75 07                	jne    acc <malloc+0xce>
        return 0;
 ac5:	b8 00 00 00 00       	mov    $0x0,%eax
 aca:	eb 13                	jmp    adf <malloc+0xe1>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 acc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 acf:	89 45 f0             	mov    %eax,-0x10(%ebp)
 ad2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ad5:	8b 00                	mov    (%eax),%eax
 ad7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 ada:	e9 6d ff ff ff       	jmp    a4c <malloc+0x4e>
  }
}
 adf:	c9                   	leave  
 ae0:	c3                   	ret    

00000ae1 <hufs_thread_create>:

int thread_num = 0;


int hufs_thread_create(void *func(), void *args)
{
 ae1:	55                   	push   %ebp
 ae2:	89 e5                	mov    %esp,%ebp
 ae4:	83 ec 18             	sub    $0x18,%esp
	void *stack; 
	int pid;

	stack = malloc(4096);
 ae7:	83 ec 0c             	sub    $0xc,%esp
 aea:	68 00 10 00 00       	push   $0x1000
 aef:	e8 0a ff ff ff       	call   9fe <malloc>
 af4:	83 c4 10             	add    $0x10,%esp
 af7:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (stack==0) return -1;
 afa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 afe:	75 07                	jne    b07 <hufs_thread_create+0x26>
 b00:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 b05:	eb 42                	jmp    b49 <hufs_thread_create+0x68>

	pid = clone(func, args, stack); 
 b07:	83 ec 04             	sub    $0x4,%esp
 b0a:	ff 75 f4             	pushl  -0xc(%ebp)
 b0d:	ff 75 0c             	pushl  0xc(%ebp)
 b10:	ff 75 08             	pushl  0x8(%ebp)
 b13:	e8 30 fb ff ff       	call   648 <clone>
 b18:	83 c4 10             	add    $0x10,%esp
 b1b:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (pid==-1) {
 b1e:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 b22:	75 15                	jne    b39 <hufs_thread_create+0x58>
		free(stack);
 b24:	83 ec 0c             	sub    $0xc,%esp
 b27:	ff 75 f4             	pushl  -0xc(%ebp)
 b2a:	e8 8d fd ff ff       	call   8bc <free>
 b2f:	83 c4 10             	add    $0x10,%esp
		return -1;
 b32:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 b37:	eb 10                	jmp    b49 <hufs_thread_create+0x68>
	}

	thread_info[pid].stack = stack; 
 b39:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b3c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 b3f:	89 14 85 20 10 00 00 	mov    %edx,0x1020(,%eax,4)

	return pid; 
 b46:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 b49:	c9                   	leave  
 b4a:	c3                   	ret    

00000b4b <hufs_thread_join>:

int hufs_thread_join(int pid)
{
 b4b:	55                   	push   %ebp
 b4c:	89 e5                	mov    %esp,%ebp
 b4e:	83 ec 18             	sub    $0x18,%esp
	void *stack = thread_info[pid].stack;
 b51:	8b 45 08             	mov    0x8(%ebp),%eax
 b54:	8b 04 85 20 10 00 00 	mov    0x1020(,%eax,4),%eax
 b5b:	89 45 f4             	mov    %eax,-0xc(%ebp)

	if (stack==0) return -1;
 b5e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 b62:	75 07                	jne    b6b <hufs_thread_join+0x20>
 b64:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 b69:	eb 28                	jmp    b93 <hufs_thread_join+0x48>

	join(&thread_info[pid].stack);	
 b6b:	8b 45 08             	mov    0x8(%ebp),%eax
 b6e:	c1 e0 02             	shl    $0x2,%eax
 b71:	05 20 10 00 00       	add    $0x1020,%eax
 b76:	83 ec 0c             	sub    $0xc,%esp
 b79:	50                   	push   %eax
 b7a:	e8 d1 fa ff ff       	call   650 <join>
 b7f:	83 c4 10             	add    $0x10,%esp
	free(stack);
 b82:	83 ec 0c             	sub    $0xc,%esp
 b85:	ff 75 f4             	pushl  -0xc(%ebp)
 b88:	e8 2f fd ff ff       	call   8bc <free>
 b8d:	83 c4 10             	add    $0x10,%esp

	return pid;
 b90:	8b 45 08             	mov    0x8(%ebp),%eax
}
 b93:	c9                   	leave  
 b94:	c3                   	ret    

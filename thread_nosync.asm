
_thread_nosync:     file format elf32-i386


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
   b:	e8 d6 05 00 00       	call   5e6 <sleep>
  10:	83 c4 10             	add    $0x10,%esp
	printf(1, "thread %d: started...\n", *(int*)arg);
  13:	8b 45 08             	mov    0x8(%ebp),%eax
  16:	8b 00                	mov    (%eax),%eax
  18:	83 ec 04             	sub    $0x4,%esp
  1b:	50                   	push   %eax
  1c:	68 74 0b 00 00       	push   $0xb74
  21:	6a 01                	push   $0x1
  23:	e8 e1 06 00 00       	call   709 <printf>
  28:	83 c4 10             	add    $0x10,%esp

	for (i=0; i<TARGET_COUNT_PER_THREAD; i++) {
  2b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  32:	eb 32                	jmp    66 <thread+0x66>
//		sem_wait(sem_id);
		
		counter = g_counter;
  34:	a1 f0 0f 00 00       	mov    0xff0,%eax
  39:	89 45 f0             	mov    %eax,-0x10(%ebp)
		sleep(0);
  3c:	83 ec 0c             	sub    $0xc,%esp
  3f:	6a 00                	push   $0x0
  41:	e8 a0 05 00 00       	call   5e6 <sleep>
  46:	83 c4 10             	add    $0x10,%esp
		counter++;
  49:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
		sleep(0);
  4d:	83 ec 0c             	sub    $0xc,%esp
  50:	6a 00                	push   $0x0
  52:	e8 8f 05 00 00       	call   5e6 <sleep>
  57:	83 c4 10             	add    $0x10,%esp
		g_counter = counter;
  5a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  5d:	a3 f0 0f 00 00       	mov    %eax,0xff0
	for (i=0; i<TARGET_COUNT_PER_THREAD; i++) {
  62:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  66:	a1 f4 0f 00 00       	mov    0xff4,%eax
  6b:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  6e:	7c c4                	jl     34 <thread+0x34>

//		sem_signal(sem_id);
	}

	exit();
  70:	e8 e1 04 00 00       	call   556 <exit>

00000075 <main>:
}

int main(int argc, char **argv)
{
  75:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  79:	83 e4 f0             	and    $0xfffffff0,%esp
  7c:	ff 71 fc             	pushl  -0x4(%ecx)
  7f:	55                   	push   %ebp
  80:	89 e5                	mov    %esp,%ebp
  82:	53                   	push   %ebx
  83:	51                   	push   %ecx
  84:	81 ec 10 02 00 00    	sub    $0x210,%esp
  8a:	89 cb                	mov    %ecx,%ebx
	int i;
	int sem_size;
	int final_counter;
	int final_target = NUM_THREADS*TARGET_COUNT_PER_THREAD;
  8c:	8b 15 fc 0f 00 00    	mov    0xffc,%edx
  92:	a1 f4 0f 00 00       	mov    0xff4,%eax
  97:	0f af c2             	imul   %edx,%eax
  9a:	89 45 f0             	mov    %eax,-0x10(%ebp)
		sem_size = NUM_THREADS;
	else
		sem_size = 1;
		*/

	if (argc < 3) {
  9d:	83 3b 02             	cmpl   $0x2,(%ebx)
  a0:	7f 17                	jg     b9 <main+0x44>
		printf(2, "Usage: thread_nosync num_threads count_per_thread");
  a2:	83 ec 08             	sub    $0x8,%esp
  a5:	68 8c 0b 00 00       	push   $0xb8c
  aa:	6a 02                	push   $0x2
  ac:	e8 58 06 00 00       	call   709 <printf>
  b1:	83 c4 10             	add    $0x10,%esp
		exit();
  b4:	e8 9d 04 00 00       	call   556 <exit>
	}

	NUM_THREADS = atoi(argv[1]);
  b9:	8b 43 04             	mov    0x4(%ebx),%eax
  bc:	83 c0 04             	add    $0x4,%eax
  bf:	8b 00                	mov    (%eax),%eax
  c1:	83 ec 0c             	sub    $0xc,%esp
  c4:	50                   	push   %eax
  c5:	e8 fa 03 00 00       	call   4c4 <atoi>
  ca:	83 c4 10             	add    $0x10,%esp
  cd:	a3 fc 0f 00 00       	mov    %eax,0xffc
	TARGET_COUNT_PER_THREAD = atoi(argv[2]);
  d2:	8b 43 04             	mov    0x4(%ebx),%eax
  d5:	83 c0 08             	add    $0x8,%eax
  d8:	8b 00                	mov    (%eax),%eax
  da:	83 ec 0c             	sub    $0xc,%esp
  dd:	50                   	push   %eax
  de:	e8 e1 03 00 00       	call   4c4 <atoi>
  e3:	83 c4 10             	add    $0x10,%esp
  e6:	a3 f4 0f 00 00       	mov    %eax,0xff4

	final_target = NUM_THREADS*TARGET_COUNT_PER_THREAD;
  eb:	8b 15 fc 0f 00 00    	mov    0xffc,%edx
  f1:	a1 f4 0f 00 00       	mov    0xff4,%eax
  f6:	0f af c2             	imul   %edx,%eax
  f9:	89 45 f0             	mov    %eax,-0x10(%ebp)

	//sem_size = NUM_THREADS; 
	sem_size = 1;
  fc:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)

	// Initialize semaphore to 1
	if ((sem_id = sem_create(sem_size)) < 0)
 103:	83 ec 0c             	sub    $0xc,%esp
 106:	ff 75 ec             	pushl  -0x14(%ebp)
 109:	e8 f8 04 00 00       	call   606 <sem_create>
 10e:	83 c4 10             	add    $0x10,%esp
 111:	a3 f8 0f 00 00       	mov    %eax,0xff8
 116:	a1 f8 0f 00 00       	mov    0xff8,%eax
 11b:	85 c0                	test   %eax,%eax
 11d:	79 17                	jns    136 <main+0xc1>
	{
		printf(1, "main: error initializing semaphore %d\n");
 11f:	83 ec 08             	sub    $0x8,%esp
 122:	68 c0 0b 00 00       	push   $0xbc0
 127:	6a 01                	push   $0x1
 129:	e8 db 05 00 00       	call   709 <printf>
 12e:	83 c4 10             	add    $0x10,%esp
		exit();
 131:	e8 20 04 00 00       	call   556 <exit>
	}

	// Initialize counter
	g_counter = 0;
 136:	c7 05 f0 0f 00 00 00 	movl   $0x0,0xff0
 13d:	00 00 00 
	// Args
	int *args[MAX_NUM_THREADS];

	// Allocate stacks and args and make sure we have them all
	// Bail if something fails
	for (i=0; i<NUM_THREADS; i++) {
 140:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 147:	eb 51                	jmp    19a <main+0x125>

		args[i] = (int*) malloc(4);
 149:	83 ec 0c             	sub    $0xc,%esp
 14c:	6a 04                	push   $0x4
 14e:	e8 89 08 00 00       	call   9dc <malloc>
 153:	83 c4 10             	add    $0x10,%esp
 156:	89 c2                	mov    %eax,%edx
 158:	8b 45 f4             	mov    -0xc(%ebp),%eax
 15b:	89 94 85 e8 fe ff ff 	mov    %edx,-0x118(%ebp,%eax,4)
		if (!args[i]) {
 162:	8b 45 f4             	mov    -0xc(%ebp),%eax
 165:	8b 84 85 e8 fe ff ff 	mov    -0x118(%ebp,%eax,4),%eax
 16c:	85 c0                	test   %eax,%eax
 16e:	75 17                	jne    187 <main+0x112>
			printf(1, "main: could not get memory (for arg) for thread %d, exiting...\n");
 170:	83 ec 08             	sub    $0x8,%esp
 173:	68 e8 0b 00 00       	push   $0xbe8
 178:	6a 01                	push   $0x1
 17a:	e8 8a 05 00 00       	call   709 <printf>
 17f:	83 c4 10             	add    $0x10,%esp
			exit();
 182:	e8 cf 03 00 00       	call   556 <exit>
		}

		*args[i] = i;
 187:	8b 45 f4             	mov    -0xc(%ebp),%eax
 18a:	8b 84 85 e8 fe ff ff 	mov    -0x118(%ebp,%eax,4),%eax
 191:	8b 55 f4             	mov    -0xc(%ebp),%edx
 194:	89 10                	mov    %edx,(%eax)
	for (i=0; i<NUM_THREADS; i++) {
 196:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 19a:	a1 fc 0f 00 00       	mov    0xffc,%eax
 19f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 1a2:	7c a5                	jl     149 <main+0xd4>
	}

	printf(1, "main: running with %d threads...\n", NUM_THREADS);
 1a4:	a1 fc 0f 00 00       	mov    0xffc,%eax
 1a9:	83 ec 04             	sub    $0x4,%esp
 1ac:	50                   	push   %eax
 1ad:	68 28 0c 00 00       	push   $0xc28
 1b2:	6a 01                	push   $0x1
 1b4:	e8 50 05 00 00       	call   709 <printf>
 1b9:	83 c4 10             	add    $0x10,%esp

	// Start all children
	int pid[MAX_NUM_THREADS];

	for (i=0; i<NUM_THREADS; i++) {
 1bc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 1c3:	eb 6e                	jmp    233 <main+0x1be>
		pid[i] = hufs_thread_create(thread, args[i]);
 1c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1c8:	8b 84 85 e8 fe ff ff 	mov    -0x118(%ebp,%eax,4),%eax
 1cf:	83 ec 08             	sub    $0x8,%esp
 1d2:	50                   	push   %eax
 1d3:	68 00 00 00 00       	push   $0x0
 1d8:	e8 e2 08 00 00       	call   abf <hufs_thread_create>
 1dd:	83 c4 10             	add    $0x10,%esp
 1e0:	89 c2                	mov    %eax,%edx
 1e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1e5:	89 94 85 e8 fd ff ff 	mov    %edx,-0x218(%ebp,%eax,4)
		if (pid[i]==-1) {
 1ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ef:	8b 84 85 e8 fd ff ff 	mov    -0x218(%ebp,%eax,4),%eax
 1f6:	83 f8 ff             	cmp    $0xffffffff,%eax
 1f9:	75 17                	jne    212 <main+0x19d>
			printf(1, "main: failed to creat a %d-th thread with pid %d\n", i);
 1fb:	83 ec 04             	sub    $0x4,%esp
 1fe:	ff 75 f4             	pushl  -0xc(%ebp)
 201:	68 4c 0c 00 00       	push   $0xc4c
 206:	6a 01                	push   $0x1
 208:	e8 fc 04 00 00       	call   709 <printf>
 20d:	83 c4 10             	add    $0x10,%esp
 210:	eb 1d                	jmp    22f <main+0x1ba>
		}
		else printf(1, "main: created thread with pid %d\n", pid[i]);
 212:	8b 45 f4             	mov    -0xc(%ebp),%eax
 215:	8b 84 85 e8 fd ff ff 	mov    -0x218(%ebp,%eax,4),%eax
 21c:	83 ec 04             	sub    $0x4,%esp
 21f:	50                   	push   %eax
 220:	68 80 0c 00 00       	push   $0xc80
 225:	6a 01                	push   $0x1
 227:	e8 dd 04 00 00       	call   709 <printf>
 22c:	83 c4 10             	add    $0x10,%esp
	for (i=0; i<NUM_THREADS; i++) {
 22f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 233:	a1 fc 0f 00 00       	mov    0xffc,%eax
 238:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 23b:	7c 88                	jl     1c5 <main+0x150>
	}
	
	// Wait for all children
	for (i=0; i<NUM_THREADS; i++) {
 23d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 244:	eb 4e                	jmp    294 <main+0x21f>
		printf(1, "before joining... \n");
 246:	83 ec 08             	sub    $0x8,%esp
 249:	68 a2 0c 00 00       	push   $0xca2
 24e:	6a 01                	push   $0x1
 250:	e8 b4 04 00 00       	call   709 <printf>
 255:	83 c4 10             	add    $0x10,%esp
		if (pid[i]!=-1) 
 258:	8b 45 f4             	mov    -0xc(%ebp),%eax
 25b:	8b 84 85 e8 fd ff ff 	mov    -0x218(%ebp,%eax,4),%eax
 262:	83 f8 ff             	cmp    $0xffffffff,%eax
 265:	74 29                	je     290 <main+0x21b>
			printf(1, "main: thread %d joined...\n", hufs_thread_join(pid[i]));
 267:	8b 45 f4             	mov    -0xc(%ebp),%eax
 26a:	8b 84 85 e8 fd ff ff 	mov    -0x218(%ebp,%eax,4),%eax
 271:	83 ec 0c             	sub    $0xc,%esp
 274:	50                   	push   %eax
 275:	e8 af 08 00 00       	call   b29 <hufs_thread_join>
 27a:	83 c4 10             	add    $0x10,%esp
 27d:	83 ec 04             	sub    $0x4,%esp
 280:	50                   	push   %eax
 281:	68 b6 0c 00 00       	push   $0xcb6
 286:	6a 01                	push   $0x1
 288:	e8 7c 04 00 00       	call   709 <printf>
 28d:	83 c4 10             	add    $0x10,%esp
	for (i=0; i<NUM_THREADS; i++) {
 290:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 294:	a1 fc 0f 00 00       	mov    0xffc,%eax
 299:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 29c:	7c a8                	jl     246 <main+0x1d1>
	}

	// Check the result
	final_counter = g_counter;
 29e:	a1 f0 0f 00 00       	mov    0xff0,%eax
 2a3:	89 45 e8             	mov    %eax,-0x18(%ebp)
	printf(1, "Final counter is %d, target is %d\n", final_counter, final_target);
 2a6:	ff 75 f0             	pushl  -0x10(%ebp)
 2a9:	ff 75 e8             	pushl  -0x18(%ebp)
 2ac:	68 d4 0c 00 00       	push   $0xcd4
 2b1:	6a 01                	push   $0x1
 2b3:	e8 51 04 00 00       	call   709 <printf>
 2b8:	83 c4 10             	add    $0x10,%esp
	if (final_counter == final_target)
 2bb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 2be:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 2c1:	75 14                	jne    2d7 <main+0x262>
		printf(1, "TEST PASSED!\n");
 2c3:	83 ec 08             	sub    $0x8,%esp
 2c6:	68 f7 0c 00 00       	push   $0xcf7
 2cb:	6a 01                	push   $0x1
 2cd:	e8 37 04 00 00       	call   709 <printf>
 2d2:	83 c4 10             	add    $0x10,%esp
 2d5:	eb 12                	jmp    2e9 <main+0x274>
	else
		printf(1, "TEST FAILED!\n");
 2d7:	83 ec 08             	sub    $0x8,%esp
 2da:	68 05 0d 00 00       	push   $0xd05
 2df:	6a 01                	push   $0x1
 2e1:	e8 23 04 00 00       	call   709 <printf>
 2e6:	83 c4 10             	add    $0x10,%esp
	
	// Clean up semaphore
	sem_destroy(sem_id);
 2e9:	a1 f8 0f 00 00       	mov    0xff8,%eax
 2ee:	83 ec 0c             	sub    $0xc,%esp
 2f1:	50                   	push   %eax
 2f2:	e8 17 03 00 00       	call   60e <sem_destroy>
 2f7:	83 c4 10             	add    $0x10,%esp

	// Exit
	exit();
 2fa:	e8 57 02 00 00       	call   556 <exit>

000002ff <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 2ff:	55                   	push   %ebp
 300:	89 e5                	mov    %esp,%ebp
 302:	57                   	push   %edi
 303:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 304:	8b 4d 08             	mov    0x8(%ebp),%ecx
 307:	8b 55 10             	mov    0x10(%ebp),%edx
 30a:	8b 45 0c             	mov    0xc(%ebp),%eax
 30d:	89 cb                	mov    %ecx,%ebx
 30f:	89 df                	mov    %ebx,%edi
 311:	89 d1                	mov    %edx,%ecx
 313:	fc                   	cld    
 314:	f3 aa                	rep stos %al,%es:(%edi)
 316:	89 ca                	mov    %ecx,%edx
 318:	89 fb                	mov    %edi,%ebx
 31a:	89 5d 08             	mov    %ebx,0x8(%ebp)
 31d:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 320:	90                   	nop
 321:	5b                   	pop    %ebx
 322:	5f                   	pop    %edi
 323:	5d                   	pop    %ebp
 324:	c3                   	ret    

00000325 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 325:	55                   	push   %ebp
 326:	89 e5                	mov    %esp,%ebp
 328:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 32b:	8b 45 08             	mov    0x8(%ebp),%eax
 32e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 331:	90                   	nop
 332:	8b 55 0c             	mov    0xc(%ebp),%edx
 335:	8d 42 01             	lea    0x1(%edx),%eax
 338:	89 45 0c             	mov    %eax,0xc(%ebp)
 33b:	8b 45 08             	mov    0x8(%ebp),%eax
 33e:	8d 48 01             	lea    0x1(%eax),%ecx
 341:	89 4d 08             	mov    %ecx,0x8(%ebp)
 344:	0f b6 12             	movzbl (%edx),%edx
 347:	88 10                	mov    %dl,(%eax)
 349:	0f b6 00             	movzbl (%eax),%eax
 34c:	84 c0                	test   %al,%al
 34e:	75 e2                	jne    332 <strcpy+0xd>
    ;
  return os;
 350:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 353:	c9                   	leave  
 354:	c3                   	ret    

00000355 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 355:	55                   	push   %ebp
 356:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 358:	eb 08                	jmp    362 <strcmp+0xd>
    p++, q++;
 35a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 35e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 362:	8b 45 08             	mov    0x8(%ebp),%eax
 365:	0f b6 00             	movzbl (%eax),%eax
 368:	84 c0                	test   %al,%al
 36a:	74 10                	je     37c <strcmp+0x27>
 36c:	8b 45 08             	mov    0x8(%ebp),%eax
 36f:	0f b6 10             	movzbl (%eax),%edx
 372:	8b 45 0c             	mov    0xc(%ebp),%eax
 375:	0f b6 00             	movzbl (%eax),%eax
 378:	38 c2                	cmp    %al,%dl
 37a:	74 de                	je     35a <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 37c:	8b 45 08             	mov    0x8(%ebp),%eax
 37f:	0f b6 00             	movzbl (%eax),%eax
 382:	0f b6 d0             	movzbl %al,%edx
 385:	8b 45 0c             	mov    0xc(%ebp),%eax
 388:	0f b6 00             	movzbl (%eax),%eax
 38b:	0f b6 c0             	movzbl %al,%eax
 38e:	29 c2                	sub    %eax,%edx
 390:	89 d0                	mov    %edx,%eax
}
 392:	5d                   	pop    %ebp
 393:	c3                   	ret    

00000394 <strlen>:

uint
strlen(char *s)
{
 394:	55                   	push   %ebp
 395:	89 e5                	mov    %esp,%ebp
 397:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 39a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 3a1:	eb 04                	jmp    3a7 <strlen+0x13>
 3a3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 3a7:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3aa:	8b 45 08             	mov    0x8(%ebp),%eax
 3ad:	01 d0                	add    %edx,%eax
 3af:	0f b6 00             	movzbl (%eax),%eax
 3b2:	84 c0                	test   %al,%al
 3b4:	75 ed                	jne    3a3 <strlen+0xf>
    ;
  return n;
 3b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3b9:	c9                   	leave  
 3ba:	c3                   	ret    

000003bb <memset>:

void*
memset(void *dst, int c, uint n)
{
 3bb:	55                   	push   %ebp
 3bc:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 3be:	8b 45 10             	mov    0x10(%ebp),%eax
 3c1:	50                   	push   %eax
 3c2:	ff 75 0c             	pushl  0xc(%ebp)
 3c5:	ff 75 08             	pushl  0x8(%ebp)
 3c8:	e8 32 ff ff ff       	call   2ff <stosb>
 3cd:	83 c4 0c             	add    $0xc,%esp
  return dst;
 3d0:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3d3:	c9                   	leave  
 3d4:	c3                   	ret    

000003d5 <strchr>:

char*
strchr(const char *s, char c)
{
 3d5:	55                   	push   %ebp
 3d6:	89 e5                	mov    %esp,%ebp
 3d8:	83 ec 04             	sub    $0x4,%esp
 3db:	8b 45 0c             	mov    0xc(%ebp),%eax
 3de:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 3e1:	eb 14                	jmp    3f7 <strchr+0x22>
    if(*s == c)
 3e3:	8b 45 08             	mov    0x8(%ebp),%eax
 3e6:	0f b6 00             	movzbl (%eax),%eax
 3e9:	38 45 fc             	cmp    %al,-0x4(%ebp)
 3ec:	75 05                	jne    3f3 <strchr+0x1e>
      return (char*)s;
 3ee:	8b 45 08             	mov    0x8(%ebp),%eax
 3f1:	eb 13                	jmp    406 <strchr+0x31>
  for(; *s; s++)
 3f3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3f7:	8b 45 08             	mov    0x8(%ebp),%eax
 3fa:	0f b6 00             	movzbl (%eax),%eax
 3fd:	84 c0                	test   %al,%al
 3ff:	75 e2                	jne    3e3 <strchr+0xe>
  return 0;
 401:	b8 00 00 00 00       	mov    $0x0,%eax
}
 406:	c9                   	leave  
 407:	c3                   	ret    

00000408 <gets>:

char*
gets(char *buf, int max)
{
 408:	55                   	push   %ebp
 409:	89 e5                	mov    %esp,%ebp
 40b:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 40e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 415:	eb 42                	jmp    459 <gets+0x51>
    cc = read(0, &c, 1);
 417:	83 ec 04             	sub    $0x4,%esp
 41a:	6a 01                	push   $0x1
 41c:	8d 45 ef             	lea    -0x11(%ebp),%eax
 41f:	50                   	push   %eax
 420:	6a 00                	push   $0x0
 422:	e8 47 01 00 00       	call   56e <read>
 427:	83 c4 10             	add    $0x10,%esp
 42a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 42d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 431:	7e 33                	jle    466 <gets+0x5e>
      break;
    buf[i++] = c;
 433:	8b 45 f4             	mov    -0xc(%ebp),%eax
 436:	8d 50 01             	lea    0x1(%eax),%edx
 439:	89 55 f4             	mov    %edx,-0xc(%ebp)
 43c:	89 c2                	mov    %eax,%edx
 43e:	8b 45 08             	mov    0x8(%ebp),%eax
 441:	01 c2                	add    %eax,%edx
 443:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 447:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 449:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 44d:	3c 0a                	cmp    $0xa,%al
 44f:	74 16                	je     467 <gets+0x5f>
 451:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 455:	3c 0d                	cmp    $0xd,%al
 457:	74 0e                	je     467 <gets+0x5f>
  for(i=0; i+1 < max; ){
 459:	8b 45 f4             	mov    -0xc(%ebp),%eax
 45c:	83 c0 01             	add    $0x1,%eax
 45f:	39 45 0c             	cmp    %eax,0xc(%ebp)
 462:	7f b3                	jg     417 <gets+0xf>
 464:	eb 01                	jmp    467 <gets+0x5f>
      break;
 466:	90                   	nop
      break;
  }
  buf[i] = '\0';
 467:	8b 55 f4             	mov    -0xc(%ebp),%edx
 46a:	8b 45 08             	mov    0x8(%ebp),%eax
 46d:	01 d0                	add    %edx,%eax
 46f:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 472:	8b 45 08             	mov    0x8(%ebp),%eax
}
 475:	c9                   	leave  
 476:	c3                   	ret    

00000477 <stat>:

int
stat(char *n, struct stat *st)
{
 477:	55                   	push   %ebp
 478:	89 e5                	mov    %esp,%ebp
 47a:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 47d:	83 ec 08             	sub    $0x8,%esp
 480:	6a 00                	push   $0x0
 482:	ff 75 08             	pushl  0x8(%ebp)
 485:	e8 0c 01 00 00       	call   596 <open>
 48a:	83 c4 10             	add    $0x10,%esp
 48d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 490:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 494:	79 07                	jns    49d <stat+0x26>
    return -1;
 496:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 49b:	eb 25                	jmp    4c2 <stat+0x4b>
  r = fstat(fd, st);
 49d:	83 ec 08             	sub    $0x8,%esp
 4a0:	ff 75 0c             	pushl  0xc(%ebp)
 4a3:	ff 75 f4             	pushl  -0xc(%ebp)
 4a6:	e8 03 01 00 00       	call   5ae <fstat>
 4ab:	83 c4 10             	add    $0x10,%esp
 4ae:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 4b1:	83 ec 0c             	sub    $0xc,%esp
 4b4:	ff 75 f4             	pushl  -0xc(%ebp)
 4b7:	e8 c2 00 00 00       	call   57e <close>
 4bc:	83 c4 10             	add    $0x10,%esp
  return r;
 4bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 4c2:	c9                   	leave  
 4c3:	c3                   	ret    

000004c4 <atoi>:

int
atoi(const char *s)
{
 4c4:	55                   	push   %ebp
 4c5:	89 e5                	mov    %esp,%ebp
 4c7:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 4ca:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 4d1:	eb 25                	jmp    4f8 <atoi+0x34>
    n = n*10 + *s++ - '0';
 4d3:	8b 55 fc             	mov    -0x4(%ebp),%edx
 4d6:	89 d0                	mov    %edx,%eax
 4d8:	c1 e0 02             	shl    $0x2,%eax
 4db:	01 d0                	add    %edx,%eax
 4dd:	01 c0                	add    %eax,%eax
 4df:	89 c1                	mov    %eax,%ecx
 4e1:	8b 45 08             	mov    0x8(%ebp),%eax
 4e4:	8d 50 01             	lea    0x1(%eax),%edx
 4e7:	89 55 08             	mov    %edx,0x8(%ebp)
 4ea:	0f b6 00             	movzbl (%eax),%eax
 4ed:	0f be c0             	movsbl %al,%eax
 4f0:	01 c8                	add    %ecx,%eax
 4f2:	83 e8 30             	sub    $0x30,%eax
 4f5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 4f8:	8b 45 08             	mov    0x8(%ebp),%eax
 4fb:	0f b6 00             	movzbl (%eax),%eax
 4fe:	3c 2f                	cmp    $0x2f,%al
 500:	7e 0a                	jle    50c <atoi+0x48>
 502:	8b 45 08             	mov    0x8(%ebp),%eax
 505:	0f b6 00             	movzbl (%eax),%eax
 508:	3c 39                	cmp    $0x39,%al
 50a:	7e c7                	jle    4d3 <atoi+0xf>
  return n;
 50c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 50f:	c9                   	leave  
 510:	c3                   	ret    

00000511 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 511:	55                   	push   %ebp
 512:	89 e5                	mov    %esp,%ebp
 514:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 517:	8b 45 08             	mov    0x8(%ebp),%eax
 51a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 51d:	8b 45 0c             	mov    0xc(%ebp),%eax
 520:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 523:	eb 17                	jmp    53c <memmove+0x2b>
    *dst++ = *src++;
 525:	8b 55 f8             	mov    -0x8(%ebp),%edx
 528:	8d 42 01             	lea    0x1(%edx),%eax
 52b:	89 45 f8             	mov    %eax,-0x8(%ebp)
 52e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 531:	8d 48 01             	lea    0x1(%eax),%ecx
 534:	89 4d fc             	mov    %ecx,-0x4(%ebp)
 537:	0f b6 12             	movzbl (%edx),%edx
 53a:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 53c:	8b 45 10             	mov    0x10(%ebp),%eax
 53f:	8d 50 ff             	lea    -0x1(%eax),%edx
 542:	89 55 10             	mov    %edx,0x10(%ebp)
 545:	85 c0                	test   %eax,%eax
 547:	7f dc                	jg     525 <memmove+0x14>
  return vdst;
 549:	8b 45 08             	mov    0x8(%ebp),%eax
}
 54c:	c9                   	leave  
 54d:	c3                   	ret    

0000054e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 54e:	b8 01 00 00 00       	mov    $0x1,%eax
 553:	cd 40                	int    $0x40
 555:	c3                   	ret    

00000556 <exit>:
SYSCALL(exit)
 556:	b8 02 00 00 00       	mov    $0x2,%eax
 55b:	cd 40                	int    $0x40
 55d:	c3                   	ret    

0000055e <wait>:
SYSCALL(wait)
 55e:	b8 03 00 00 00       	mov    $0x3,%eax
 563:	cd 40                	int    $0x40
 565:	c3                   	ret    

00000566 <pipe>:
SYSCALL(pipe)
 566:	b8 04 00 00 00       	mov    $0x4,%eax
 56b:	cd 40                	int    $0x40
 56d:	c3                   	ret    

0000056e <read>:
SYSCALL(read)
 56e:	b8 05 00 00 00       	mov    $0x5,%eax
 573:	cd 40                	int    $0x40
 575:	c3                   	ret    

00000576 <write>:
SYSCALL(write)
 576:	b8 10 00 00 00       	mov    $0x10,%eax
 57b:	cd 40                	int    $0x40
 57d:	c3                   	ret    

0000057e <close>:
SYSCALL(close)
 57e:	b8 15 00 00 00       	mov    $0x15,%eax
 583:	cd 40                	int    $0x40
 585:	c3                   	ret    

00000586 <kill>:
SYSCALL(kill)
 586:	b8 06 00 00 00       	mov    $0x6,%eax
 58b:	cd 40                	int    $0x40
 58d:	c3                   	ret    

0000058e <exec>:
SYSCALL(exec)
 58e:	b8 07 00 00 00       	mov    $0x7,%eax
 593:	cd 40                	int    $0x40
 595:	c3                   	ret    

00000596 <open>:
SYSCALL(open)
 596:	b8 0f 00 00 00       	mov    $0xf,%eax
 59b:	cd 40                	int    $0x40
 59d:	c3                   	ret    

0000059e <mknod>:
SYSCALL(mknod)
 59e:	b8 11 00 00 00       	mov    $0x11,%eax
 5a3:	cd 40                	int    $0x40
 5a5:	c3                   	ret    

000005a6 <unlink>:
SYSCALL(unlink)
 5a6:	b8 12 00 00 00       	mov    $0x12,%eax
 5ab:	cd 40                	int    $0x40
 5ad:	c3                   	ret    

000005ae <fstat>:
SYSCALL(fstat)
 5ae:	b8 08 00 00 00       	mov    $0x8,%eax
 5b3:	cd 40                	int    $0x40
 5b5:	c3                   	ret    

000005b6 <link>:
SYSCALL(link)
 5b6:	b8 13 00 00 00       	mov    $0x13,%eax
 5bb:	cd 40                	int    $0x40
 5bd:	c3                   	ret    

000005be <mkdir>:
SYSCALL(mkdir)
 5be:	b8 14 00 00 00       	mov    $0x14,%eax
 5c3:	cd 40                	int    $0x40
 5c5:	c3                   	ret    

000005c6 <chdir>:
SYSCALL(chdir)
 5c6:	b8 09 00 00 00       	mov    $0x9,%eax
 5cb:	cd 40                	int    $0x40
 5cd:	c3                   	ret    

000005ce <dup>:
SYSCALL(dup)
 5ce:	b8 0a 00 00 00       	mov    $0xa,%eax
 5d3:	cd 40                	int    $0x40
 5d5:	c3                   	ret    

000005d6 <getpid>:
SYSCALL(getpid)
 5d6:	b8 0b 00 00 00       	mov    $0xb,%eax
 5db:	cd 40                	int    $0x40
 5dd:	c3                   	ret    

000005de <sbrk>:
SYSCALL(sbrk)
 5de:	b8 0c 00 00 00       	mov    $0xc,%eax
 5e3:	cd 40                	int    $0x40
 5e5:	c3                   	ret    

000005e6 <sleep>:
SYSCALL(sleep)
 5e6:	b8 0d 00 00 00       	mov    $0xd,%eax
 5eb:	cd 40                	int    $0x40
 5ed:	c3                   	ret    

000005ee <uptime>:
SYSCALL(uptime)
 5ee:	b8 0e 00 00 00       	mov    $0xe,%eax
 5f3:	cd 40                	int    $0x40
 5f5:	c3                   	ret    

000005f6 <halt>:
SYSCALL(halt)
 5f6:	b8 16 00 00 00       	mov    $0x16,%eax
 5fb:	cd 40                	int    $0x40
 5fd:	c3                   	ret    

000005fe <getnp>:
SYSCALL(getnp)
 5fe:	b8 17 00 00 00       	mov    $0x17,%eax
 603:	cd 40                	int    $0x40
 605:	c3                   	ret    

00000606 <sem_create>:
SYSCALL(sem_create)
 606:	b8 18 00 00 00       	mov    $0x18,%eax
 60b:	cd 40                	int    $0x40
 60d:	c3                   	ret    

0000060e <sem_destroy>:
SYSCALL(sem_destroy)
 60e:	b8 19 00 00 00       	mov    $0x19,%eax
 613:	cd 40                	int    $0x40
 615:	c3                   	ret    

00000616 <sem_wait>:
SYSCALL(sem_wait)
 616:	b8 1a 00 00 00       	mov    $0x1a,%eax
 61b:	cd 40                	int    $0x40
 61d:	c3                   	ret    

0000061e <sem_signal>:
SYSCALL(sem_signal)
 61e:	b8 1b 00 00 00       	mov    $0x1b,%eax
 623:	cd 40                	int    $0x40
 625:	c3                   	ret    

00000626 <clone>:
SYSCALL(clone)
 626:	b8 1c 00 00 00       	mov    $0x1c,%eax
 62b:	cd 40                	int    $0x40
 62d:	c3                   	ret    

0000062e <join>:
SYSCALL(join)
 62e:	b8 1d 00 00 00       	mov    $0x1d,%eax
 633:	cd 40                	int    $0x40
 635:	c3                   	ret    

00000636 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 636:	55                   	push   %ebp
 637:	89 e5                	mov    %esp,%ebp
 639:	83 ec 18             	sub    $0x18,%esp
 63c:	8b 45 0c             	mov    0xc(%ebp),%eax
 63f:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 642:	83 ec 04             	sub    $0x4,%esp
 645:	6a 01                	push   $0x1
 647:	8d 45 f4             	lea    -0xc(%ebp),%eax
 64a:	50                   	push   %eax
 64b:	ff 75 08             	pushl  0x8(%ebp)
 64e:	e8 23 ff ff ff       	call   576 <write>
 653:	83 c4 10             	add    $0x10,%esp
}
 656:	90                   	nop
 657:	c9                   	leave  
 658:	c3                   	ret    

00000659 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 659:	55                   	push   %ebp
 65a:	89 e5                	mov    %esp,%ebp
 65c:	83 ec 28             	sub    $0x28,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 65f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 666:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 66a:	74 17                	je     683 <printint+0x2a>
 66c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 670:	79 11                	jns    683 <printint+0x2a>
    neg = 1;
 672:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 679:	8b 45 0c             	mov    0xc(%ebp),%eax
 67c:	f7 d8                	neg    %eax
 67e:	89 45 ec             	mov    %eax,-0x14(%ebp)
 681:	eb 06                	jmp    689 <printint+0x30>
  } else {
    x = xx;
 683:	8b 45 0c             	mov    0xc(%ebp),%eax
 686:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 689:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 690:	8b 4d 10             	mov    0x10(%ebp),%ecx
 693:	8b 45 ec             	mov    -0x14(%ebp),%eax
 696:	ba 00 00 00 00       	mov    $0x0,%edx
 69b:	f7 f1                	div    %ecx
 69d:	89 d1                	mov    %edx,%ecx
 69f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6a2:	8d 50 01             	lea    0x1(%eax),%edx
 6a5:	89 55 f4             	mov    %edx,-0xc(%ebp)
 6a8:	0f b6 91 c0 0f 00 00 	movzbl 0xfc0(%ecx),%edx
 6af:	88 54 05 dc          	mov    %dl,-0x24(%ebp,%eax,1)
  }while((x /= base) != 0);
 6b3:	8b 4d 10             	mov    0x10(%ebp),%ecx
 6b6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6b9:	ba 00 00 00 00       	mov    $0x0,%edx
 6be:	f7 f1                	div    %ecx
 6c0:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6c3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6c7:	75 c7                	jne    690 <printint+0x37>
  if(neg)
 6c9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6cd:	74 2d                	je     6fc <printint+0xa3>
    buf[i++] = '-';
 6cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6d2:	8d 50 01             	lea    0x1(%eax),%edx
 6d5:	89 55 f4             	mov    %edx,-0xc(%ebp)
 6d8:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 6dd:	eb 1d                	jmp    6fc <printint+0xa3>
    putc(fd, buf[i]);
 6df:	8d 55 dc             	lea    -0x24(%ebp),%edx
 6e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6e5:	01 d0                	add    %edx,%eax
 6e7:	0f b6 00             	movzbl (%eax),%eax
 6ea:	0f be c0             	movsbl %al,%eax
 6ed:	83 ec 08             	sub    $0x8,%esp
 6f0:	50                   	push   %eax
 6f1:	ff 75 08             	pushl  0x8(%ebp)
 6f4:	e8 3d ff ff ff       	call   636 <putc>
 6f9:	83 c4 10             	add    $0x10,%esp
  while(--i >= 0)
 6fc:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 700:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 704:	79 d9                	jns    6df <printint+0x86>
}
 706:	90                   	nop
 707:	c9                   	leave  
 708:	c3                   	ret    

00000709 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 709:	55                   	push   %ebp
 70a:	89 e5                	mov    %esp,%ebp
 70c:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 70f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 716:	8d 45 0c             	lea    0xc(%ebp),%eax
 719:	83 c0 04             	add    $0x4,%eax
 71c:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 71f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 726:	e9 59 01 00 00       	jmp    884 <printf+0x17b>
    c = fmt[i] & 0xff;
 72b:	8b 55 0c             	mov    0xc(%ebp),%edx
 72e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 731:	01 d0                	add    %edx,%eax
 733:	0f b6 00             	movzbl (%eax),%eax
 736:	0f be c0             	movsbl %al,%eax
 739:	25 ff 00 00 00       	and    $0xff,%eax
 73e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 741:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 745:	75 2c                	jne    773 <printf+0x6a>
      if(c == '%'){
 747:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 74b:	75 0c                	jne    759 <printf+0x50>
        state = '%';
 74d:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 754:	e9 27 01 00 00       	jmp    880 <printf+0x177>
      } else {
        putc(fd, c);
 759:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 75c:	0f be c0             	movsbl %al,%eax
 75f:	83 ec 08             	sub    $0x8,%esp
 762:	50                   	push   %eax
 763:	ff 75 08             	pushl  0x8(%ebp)
 766:	e8 cb fe ff ff       	call   636 <putc>
 76b:	83 c4 10             	add    $0x10,%esp
 76e:	e9 0d 01 00 00       	jmp    880 <printf+0x177>
      }
    } else if(state == '%'){
 773:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 777:	0f 85 03 01 00 00    	jne    880 <printf+0x177>
      if(c == 'd'){
 77d:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 781:	75 1e                	jne    7a1 <printf+0x98>
        printint(fd, *ap, 10, 1);
 783:	8b 45 e8             	mov    -0x18(%ebp),%eax
 786:	8b 00                	mov    (%eax),%eax
 788:	6a 01                	push   $0x1
 78a:	6a 0a                	push   $0xa
 78c:	50                   	push   %eax
 78d:	ff 75 08             	pushl  0x8(%ebp)
 790:	e8 c4 fe ff ff       	call   659 <printint>
 795:	83 c4 10             	add    $0x10,%esp
        ap++;
 798:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 79c:	e9 d8 00 00 00       	jmp    879 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 7a1:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 7a5:	74 06                	je     7ad <printf+0xa4>
 7a7:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 7ab:	75 1e                	jne    7cb <printf+0xc2>
        printint(fd, *ap, 16, 0);
 7ad:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7b0:	8b 00                	mov    (%eax),%eax
 7b2:	6a 00                	push   $0x0
 7b4:	6a 10                	push   $0x10
 7b6:	50                   	push   %eax
 7b7:	ff 75 08             	pushl  0x8(%ebp)
 7ba:	e8 9a fe ff ff       	call   659 <printint>
 7bf:	83 c4 10             	add    $0x10,%esp
        ap++;
 7c2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7c6:	e9 ae 00 00 00       	jmp    879 <printf+0x170>
      } else if(c == 's'){
 7cb:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 7cf:	75 43                	jne    814 <printf+0x10b>
        s = (char*)*ap;
 7d1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7d4:	8b 00                	mov    (%eax),%eax
 7d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 7d9:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 7dd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7e1:	75 25                	jne    808 <printf+0xff>
          s = "(null)";
 7e3:	c7 45 f4 13 0d 00 00 	movl   $0xd13,-0xc(%ebp)
        while(*s != 0){
 7ea:	eb 1c                	jmp    808 <printf+0xff>
          putc(fd, *s);
 7ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ef:	0f b6 00             	movzbl (%eax),%eax
 7f2:	0f be c0             	movsbl %al,%eax
 7f5:	83 ec 08             	sub    $0x8,%esp
 7f8:	50                   	push   %eax
 7f9:	ff 75 08             	pushl  0x8(%ebp)
 7fc:	e8 35 fe ff ff       	call   636 <putc>
 801:	83 c4 10             	add    $0x10,%esp
          s++;
 804:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 808:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80b:	0f b6 00             	movzbl (%eax),%eax
 80e:	84 c0                	test   %al,%al
 810:	75 da                	jne    7ec <printf+0xe3>
 812:	eb 65                	jmp    879 <printf+0x170>
        }
      } else if(c == 'c'){
 814:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 818:	75 1d                	jne    837 <printf+0x12e>
        putc(fd, *ap);
 81a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 81d:	8b 00                	mov    (%eax),%eax
 81f:	0f be c0             	movsbl %al,%eax
 822:	83 ec 08             	sub    $0x8,%esp
 825:	50                   	push   %eax
 826:	ff 75 08             	pushl  0x8(%ebp)
 829:	e8 08 fe ff ff       	call   636 <putc>
 82e:	83 c4 10             	add    $0x10,%esp
        ap++;
 831:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 835:	eb 42                	jmp    879 <printf+0x170>
      } else if(c == '%'){
 837:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 83b:	75 17                	jne    854 <printf+0x14b>
        putc(fd, c);
 83d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 840:	0f be c0             	movsbl %al,%eax
 843:	83 ec 08             	sub    $0x8,%esp
 846:	50                   	push   %eax
 847:	ff 75 08             	pushl  0x8(%ebp)
 84a:	e8 e7 fd ff ff       	call   636 <putc>
 84f:	83 c4 10             	add    $0x10,%esp
 852:	eb 25                	jmp    879 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 854:	83 ec 08             	sub    $0x8,%esp
 857:	6a 25                	push   $0x25
 859:	ff 75 08             	pushl  0x8(%ebp)
 85c:	e8 d5 fd ff ff       	call   636 <putc>
 861:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 864:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 867:	0f be c0             	movsbl %al,%eax
 86a:	83 ec 08             	sub    $0x8,%esp
 86d:	50                   	push   %eax
 86e:	ff 75 08             	pushl  0x8(%ebp)
 871:	e8 c0 fd ff ff       	call   636 <putc>
 876:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 879:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 880:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 884:	8b 55 0c             	mov    0xc(%ebp),%edx
 887:	8b 45 f0             	mov    -0x10(%ebp),%eax
 88a:	01 d0                	add    %edx,%eax
 88c:	0f b6 00             	movzbl (%eax),%eax
 88f:	84 c0                	test   %al,%al
 891:	0f 85 94 fe ff ff    	jne    72b <printf+0x22>
    }
  }
}
 897:	90                   	nop
 898:	c9                   	leave  
 899:	c3                   	ret    

0000089a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 89a:	55                   	push   %ebp
 89b:	89 e5                	mov    %esp,%ebp
 89d:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8a0:	8b 45 08             	mov    0x8(%ebp),%eax
 8a3:	83 e8 08             	sub    $0x8,%eax
 8a6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8a9:	a1 e8 0f 00 00       	mov    0xfe8,%eax
 8ae:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8b1:	eb 24                	jmp    8d7 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b6:	8b 00                	mov    (%eax),%eax
 8b8:	39 45 fc             	cmp    %eax,-0x4(%ebp)
 8bb:	72 12                	jb     8cf <free+0x35>
 8bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8c0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8c3:	77 24                	ja     8e9 <free+0x4f>
 8c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c8:	8b 00                	mov    (%eax),%eax
 8ca:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 8cd:	72 1a                	jb     8e9 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d2:	8b 00                	mov    (%eax),%eax
 8d4:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8d7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8da:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8dd:	76 d4                	jbe    8b3 <free+0x19>
 8df:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e2:	8b 00                	mov    (%eax),%eax
 8e4:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 8e7:	73 ca                	jae    8b3 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8e9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8ec:	8b 40 04             	mov    0x4(%eax),%eax
 8ef:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8f6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8f9:	01 c2                	add    %eax,%edx
 8fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8fe:	8b 00                	mov    (%eax),%eax
 900:	39 c2                	cmp    %eax,%edx
 902:	75 24                	jne    928 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 904:	8b 45 f8             	mov    -0x8(%ebp),%eax
 907:	8b 50 04             	mov    0x4(%eax),%edx
 90a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 90d:	8b 00                	mov    (%eax),%eax
 90f:	8b 40 04             	mov    0x4(%eax),%eax
 912:	01 c2                	add    %eax,%edx
 914:	8b 45 f8             	mov    -0x8(%ebp),%eax
 917:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 91a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 91d:	8b 00                	mov    (%eax),%eax
 91f:	8b 10                	mov    (%eax),%edx
 921:	8b 45 f8             	mov    -0x8(%ebp),%eax
 924:	89 10                	mov    %edx,(%eax)
 926:	eb 0a                	jmp    932 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 928:	8b 45 fc             	mov    -0x4(%ebp),%eax
 92b:	8b 10                	mov    (%eax),%edx
 92d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 930:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 932:	8b 45 fc             	mov    -0x4(%ebp),%eax
 935:	8b 40 04             	mov    0x4(%eax),%eax
 938:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 93f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 942:	01 d0                	add    %edx,%eax
 944:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 947:	75 20                	jne    969 <free+0xcf>
    p->s.size += bp->s.size;
 949:	8b 45 fc             	mov    -0x4(%ebp),%eax
 94c:	8b 50 04             	mov    0x4(%eax),%edx
 94f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 952:	8b 40 04             	mov    0x4(%eax),%eax
 955:	01 c2                	add    %eax,%edx
 957:	8b 45 fc             	mov    -0x4(%ebp),%eax
 95a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 95d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 960:	8b 10                	mov    (%eax),%edx
 962:	8b 45 fc             	mov    -0x4(%ebp),%eax
 965:	89 10                	mov    %edx,(%eax)
 967:	eb 08                	jmp    971 <free+0xd7>
  } else
    p->s.ptr = bp;
 969:	8b 45 fc             	mov    -0x4(%ebp),%eax
 96c:	8b 55 f8             	mov    -0x8(%ebp),%edx
 96f:	89 10                	mov    %edx,(%eax)
  freep = p;
 971:	8b 45 fc             	mov    -0x4(%ebp),%eax
 974:	a3 e8 0f 00 00       	mov    %eax,0xfe8
}
 979:	90                   	nop
 97a:	c9                   	leave  
 97b:	c3                   	ret    

0000097c <morecore>:

static Header*
morecore(uint nu)
{
 97c:	55                   	push   %ebp
 97d:	89 e5                	mov    %esp,%ebp
 97f:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 982:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 989:	77 07                	ja     992 <morecore+0x16>
    nu = 4096;
 98b:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 992:	8b 45 08             	mov    0x8(%ebp),%eax
 995:	c1 e0 03             	shl    $0x3,%eax
 998:	83 ec 0c             	sub    $0xc,%esp
 99b:	50                   	push   %eax
 99c:	e8 3d fc ff ff       	call   5de <sbrk>
 9a1:	83 c4 10             	add    $0x10,%esp
 9a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 9a7:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 9ab:	75 07                	jne    9b4 <morecore+0x38>
    return 0;
 9ad:	b8 00 00 00 00       	mov    $0x0,%eax
 9b2:	eb 26                	jmp    9da <morecore+0x5e>
  hp = (Header*)p;
 9b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 9ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9bd:	8b 55 08             	mov    0x8(%ebp),%edx
 9c0:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 9c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9c6:	83 c0 08             	add    $0x8,%eax
 9c9:	83 ec 0c             	sub    $0xc,%esp
 9cc:	50                   	push   %eax
 9cd:	e8 c8 fe ff ff       	call   89a <free>
 9d2:	83 c4 10             	add    $0x10,%esp
  return freep;
 9d5:	a1 e8 0f 00 00       	mov    0xfe8,%eax
}
 9da:	c9                   	leave  
 9db:	c3                   	ret    

000009dc <malloc>:

void*
malloc(uint nbytes)
{
 9dc:	55                   	push   %ebp
 9dd:	89 e5                	mov    %esp,%ebp
 9df:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9e2:	8b 45 08             	mov    0x8(%ebp),%eax
 9e5:	83 c0 07             	add    $0x7,%eax
 9e8:	c1 e8 03             	shr    $0x3,%eax
 9eb:	83 c0 01             	add    $0x1,%eax
 9ee:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 9f1:	a1 e8 0f 00 00       	mov    0xfe8,%eax
 9f6:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9f9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 9fd:	75 23                	jne    a22 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 9ff:	c7 45 f0 e0 0f 00 00 	movl   $0xfe0,-0x10(%ebp)
 a06:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a09:	a3 e8 0f 00 00       	mov    %eax,0xfe8
 a0e:	a1 e8 0f 00 00       	mov    0xfe8,%eax
 a13:	a3 e0 0f 00 00       	mov    %eax,0xfe0
    base.s.size = 0;
 a18:	c7 05 e4 0f 00 00 00 	movl   $0x0,0xfe4
 a1f:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a22:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a25:	8b 00                	mov    (%eax),%eax
 a27:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a2d:	8b 40 04             	mov    0x4(%eax),%eax
 a30:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 a33:	77 4d                	ja     a82 <malloc+0xa6>
      if(p->s.size == nunits)
 a35:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a38:	8b 40 04             	mov    0x4(%eax),%eax
 a3b:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 a3e:	75 0c                	jne    a4c <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a40:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a43:	8b 10                	mov    (%eax),%edx
 a45:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a48:	89 10                	mov    %edx,(%eax)
 a4a:	eb 26                	jmp    a72 <malloc+0x96>
      else {
        p->s.size -= nunits;
 a4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a4f:	8b 40 04             	mov    0x4(%eax),%eax
 a52:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a55:	89 c2                	mov    %eax,%edx
 a57:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a5a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a60:	8b 40 04             	mov    0x4(%eax),%eax
 a63:	c1 e0 03             	shl    $0x3,%eax
 a66:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a69:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a6c:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a6f:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a72:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a75:	a3 e8 0f 00 00       	mov    %eax,0xfe8
      return (void*)(p + 1);
 a7a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a7d:	83 c0 08             	add    $0x8,%eax
 a80:	eb 3b                	jmp    abd <malloc+0xe1>
    }
    if(p == freep)
 a82:	a1 e8 0f 00 00       	mov    0xfe8,%eax
 a87:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a8a:	75 1e                	jne    aaa <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 a8c:	83 ec 0c             	sub    $0xc,%esp
 a8f:	ff 75 ec             	pushl  -0x14(%ebp)
 a92:	e8 e5 fe ff ff       	call   97c <morecore>
 a97:	83 c4 10             	add    $0x10,%esp
 a9a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a9d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 aa1:	75 07                	jne    aaa <malloc+0xce>
        return 0;
 aa3:	b8 00 00 00 00       	mov    $0x0,%eax
 aa8:	eb 13                	jmp    abd <malloc+0xe1>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aaa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aad:	89 45 f0             	mov    %eax,-0x10(%ebp)
 ab0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ab3:	8b 00                	mov    (%eax),%eax
 ab5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 ab8:	e9 6d ff ff ff       	jmp    a2a <malloc+0x4e>
  }
}
 abd:	c9                   	leave  
 abe:	c3                   	ret    

00000abf <hufs_thread_create>:

int thread_num = 0;


int hufs_thread_create(void *func(), void *args)
{
 abf:	55                   	push   %ebp
 ac0:	89 e5                	mov    %esp,%ebp
 ac2:	83 ec 18             	sub    $0x18,%esp
	void *stack; 
	int pid;

	stack = malloc(4096);
 ac5:	83 ec 0c             	sub    $0xc,%esp
 ac8:	68 00 10 00 00       	push   $0x1000
 acd:	e8 0a ff ff ff       	call   9dc <malloc>
 ad2:	83 c4 10             	add    $0x10,%esp
 ad5:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (stack==0) return -1;
 ad8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 adc:	75 07                	jne    ae5 <hufs_thread_create+0x26>
 ade:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 ae3:	eb 42                	jmp    b27 <hufs_thread_create+0x68>

	pid = clone(func, args, stack); 
 ae5:	83 ec 04             	sub    $0x4,%esp
 ae8:	ff 75 f4             	pushl  -0xc(%ebp)
 aeb:	ff 75 0c             	pushl  0xc(%ebp)
 aee:	ff 75 08             	pushl  0x8(%ebp)
 af1:	e8 30 fb ff ff       	call   626 <clone>
 af6:	83 c4 10             	add    $0x10,%esp
 af9:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (pid==-1) {
 afc:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 b00:	75 15                	jne    b17 <hufs_thread_create+0x58>
		free(stack);
 b02:	83 ec 0c             	sub    $0xc,%esp
 b05:	ff 75 f4             	pushl  -0xc(%ebp)
 b08:	e8 8d fd ff ff       	call   89a <free>
 b0d:	83 c4 10             	add    $0x10,%esp
		return -1;
 b10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 b15:	eb 10                	jmp    b27 <hufs_thread_create+0x68>
	}

	thread_info[pid].stack = stack; 
 b17:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b1a:	8b 55 f4             	mov    -0xc(%ebp),%edx
 b1d:	89 14 85 00 10 00 00 	mov    %edx,0x1000(,%eax,4)

	return pid; 
 b24:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 b27:	c9                   	leave  
 b28:	c3                   	ret    

00000b29 <hufs_thread_join>:

int hufs_thread_join(int pid)
{
 b29:	55                   	push   %ebp
 b2a:	89 e5                	mov    %esp,%ebp
 b2c:	83 ec 18             	sub    $0x18,%esp
	void *stack = thread_info[pid].stack;
 b2f:	8b 45 08             	mov    0x8(%ebp),%eax
 b32:	8b 04 85 00 10 00 00 	mov    0x1000(,%eax,4),%eax
 b39:	89 45 f4             	mov    %eax,-0xc(%ebp)

	if (stack==0) return -1;
 b3c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 b40:	75 07                	jne    b49 <hufs_thread_join+0x20>
 b42:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 b47:	eb 28                	jmp    b71 <hufs_thread_join+0x48>

	join(&thread_info[pid].stack);	
 b49:	8b 45 08             	mov    0x8(%ebp),%eax
 b4c:	c1 e0 02             	shl    $0x2,%eax
 b4f:	05 00 10 00 00       	add    $0x1000,%eax
 b54:	83 ec 0c             	sub    $0xc,%esp
 b57:	50                   	push   %eax
 b58:	e8 d1 fa ff ff       	call   62e <join>
 b5d:	83 c4 10             	add    $0x10,%esp
	free(stack);
 b60:	83 ec 0c             	sub    $0xc,%esp
 b63:	ff 75 f4             	pushl  -0xc(%ebp)
 b66:	e8 2f fd ff ff       	call   89a <free>
 b6b:	83 c4 10             	add    $0x10,%esp

	return pid;
 b6e:	8b 45 08             	mov    0x8(%ebp),%eax
}
 b71:	c9                   	leave  
 b72:	c3                   	ret    

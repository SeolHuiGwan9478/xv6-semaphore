
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  11:	e8 65 02 00 00       	call   27b <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7e 0d                	jle    27 <main+0x27>
    sleep(5);  // Let child exit before parent.
  1a:	83 ec 0c             	sub    $0xc,%esp
  1d:	6a 05                	push   $0x5
  1f:	e8 ef 02 00 00       	call   313 <sleep>
  24:	83 c4 10             	add    $0x10,%esp
  exit();
  27:	e8 57 02 00 00       	call   283 <exit>

0000002c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  2c:	55                   	push   %ebp
  2d:	89 e5                	mov    %esp,%ebp
  2f:	57                   	push   %edi
  30:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  31:	8b 4d 08             	mov    0x8(%ebp),%ecx
  34:	8b 55 10             	mov    0x10(%ebp),%edx
  37:	8b 45 0c             	mov    0xc(%ebp),%eax
  3a:	89 cb                	mov    %ecx,%ebx
  3c:	89 df                	mov    %ebx,%edi
  3e:	89 d1                	mov    %edx,%ecx
  40:	fc                   	cld    
  41:	f3 aa                	rep stos %al,%es:(%edi)
  43:	89 ca                	mov    %ecx,%edx
  45:	89 fb                	mov    %edi,%ebx
  47:	89 5d 08             	mov    %ebx,0x8(%ebp)
  4a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  4d:	90                   	nop
  4e:	5b                   	pop    %ebx
  4f:	5f                   	pop    %edi
  50:	5d                   	pop    %ebp
  51:	c3                   	ret    

00000052 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  52:	55                   	push   %ebp
  53:	89 e5                	mov    %esp,%ebp
  55:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  58:	8b 45 08             	mov    0x8(%ebp),%eax
  5b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  5e:	90                   	nop
  5f:	8b 55 0c             	mov    0xc(%ebp),%edx
  62:	8d 42 01             	lea    0x1(%edx),%eax
  65:	89 45 0c             	mov    %eax,0xc(%ebp)
  68:	8b 45 08             	mov    0x8(%ebp),%eax
  6b:	8d 48 01             	lea    0x1(%eax),%ecx
  6e:	89 4d 08             	mov    %ecx,0x8(%ebp)
  71:	0f b6 12             	movzbl (%edx),%edx
  74:	88 10                	mov    %dl,(%eax)
  76:	0f b6 00             	movzbl (%eax),%eax
  79:	84 c0                	test   %al,%al
  7b:	75 e2                	jne    5f <strcpy+0xd>
    ;
  return os;
  7d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  80:	c9                   	leave  
  81:	c3                   	ret    

00000082 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  82:	55                   	push   %ebp
  83:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  85:	eb 08                	jmp    8f <strcmp+0xd>
    p++, q++;
  87:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  8b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  8f:	8b 45 08             	mov    0x8(%ebp),%eax
  92:	0f b6 00             	movzbl (%eax),%eax
  95:	84 c0                	test   %al,%al
  97:	74 10                	je     a9 <strcmp+0x27>
  99:	8b 45 08             	mov    0x8(%ebp),%eax
  9c:	0f b6 10             	movzbl (%eax),%edx
  9f:	8b 45 0c             	mov    0xc(%ebp),%eax
  a2:	0f b6 00             	movzbl (%eax),%eax
  a5:	38 c2                	cmp    %al,%dl
  a7:	74 de                	je     87 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  a9:	8b 45 08             	mov    0x8(%ebp),%eax
  ac:	0f b6 00             	movzbl (%eax),%eax
  af:	0f b6 d0             	movzbl %al,%edx
  b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  b5:	0f b6 00             	movzbl (%eax),%eax
  b8:	0f b6 c0             	movzbl %al,%eax
  bb:	29 c2                	sub    %eax,%edx
  bd:	89 d0                	mov    %edx,%eax
}
  bf:	5d                   	pop    %ebp
  c0:	c3                   	ret    

000000c1 <strlen>:

uint
strlen(char *s)
{
  c1:	55                   	push   %ebp
  c2:	89 e5                	mov    %esp,%ebp
  c4:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  c7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  ce:	eb 04                	jmp    d4 <strlen+0x13>
  d0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  d4:	8b 55 fc             	mov    -0x4(%ebp),%edx
  d7:	8b 45 08             	mov    0x8(%ebp),%eax
  da:	01 d0                	add    %edx,%eax
  dc:	0f b6 00             	movzbl (%eax),%eax
  df:	84 c0                	test   %al,%al
  e1:	75 ed                	jne    d0 <strlen+0xf>
    ;
  return n;
  e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  e6:	c9                   	leave  
  e7:	c3                   	ret    

000000e8 <memset>:

void*
memset(void *dst, int c, uint n)
{
  e8:	55                   	push   %ebp
  e9:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
  eb:	8b 45 10             	mov    0x10(%ebp),%eax
  ee:	50                   	push   %eax
  ef:	ff 75 0c             	pushl  0xc(%ebp)
  f2:	ff 75 08             	pushl  0x8(%ebp)
  f5:	e8 32 ff ff ff       	call   2c <stosb>
  fa:	83 c4 0c             	add    $0xc,%esp
  return dst;
  fd:	8b 45 08             	mov    0x8(%ebp),%eax
}
 100:	c9                   	leave  
 101:	c3                   	ret    

00000102 <strchr>:

char*
strchr(const char *s, char c)
{
 102:	55                   	push   %ebp
 103:	89 e5                	mov    %esp,%ebp
 105:	83 ec 04             	sub    $0x4,%esp
 108:	8b 45 0c             	mov    0xc(%ebp),%eax
 10b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 10e:	eb 14                	jmp    124 <strchr+0x22>
    if(*s == c)
 110:	8b 45 08             	mov    0x8(%ebp),%eax
 113:	0f b6 00             	movzbl (%eax),%eax
 116:	38 45 fc             	cmp    %al,-0x4(%ebp)
 119:	75 05                	jne    120 <strchr+0x1e>
      return (char*)s;
 11b:	8b 45 08             	mov    0x8(%ebp),%eax
 11e:	eb 13                	jmp    133 <strchr+0x31>
  for(; *s; s++)
 120:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 124:	8b 45 08             	mov    0x8(%ebp),%eax
 127:	0f b6 00             	movzbl (%eax),%eax
 12a:	84 c0                	test   %al,%al
 12c:	75 e2                	jne    110 <strchr+0xe>
  return 0;
 12e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 133:	c9                   	leave  
 134:	c3                   	ret    

00000135 <gets>:

char*
gets(char *buf, int max)
{
 135:	55                   	push   %ebp
 136:	89 e5                	mov    %esp,%ebp
 138:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 13b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 142:	eb 42                	jmp    186 <gets+0x51>
    cc = read(0, &c, 1);
 144:	83 ec 04             	sub    $0x4,%esp
 147:	6a 01                	push   $0x1
 149:	8d 45 ef             	lea    -0x11(%ebp),%eax
 14c:	50                   	push   %eax
 14d:	6a 00                	push   $0x0
 14f:	e8 47 01 00 00       	call   29b <read>
 154:	83 c4 10             	add    $0x10,%esp
 157:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 15a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 15e:	7e 33                	jle    193 <gets+0x5e>
      break;
    buf[i++] = c;
 160:	8b 45 f4             	mov    -0xc(%ebp),%eax
 163:	8d 50 01             	lea    0x1(%eax),%edx
 166:	89 55 f4             	mov    %edx,-0xc(%ebp)
 169:	89 c2                	mov    %eax,%edx
 16b:	8b 45 08             	mov    0x8(%ebp),%eax
 16e:	01 c2                	add    %eax,%edx
 170:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 174:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 176:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 17a:	3c 0a                	cmp    $0xa,%al
 17c:	74 16                	je     194 <gets+0x5f>
 17e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 182:	3c 0d                	cmp    $0xd,%al
 184:	74 0e                	je     194 <gets+0x5f>
  for(i=0; i+1 < max; ){
 186:	8b 45 f4             	mov    -0xc(%ebp),%eax
 189:	83 c0 01             	add    $0x1,%eax
 18c:	39 45 0c             	cmp    %eax,0xc(%ebp)
 18f:	7f b3                	jg     144 <gets+0xf>
 191:	eb 01                	jmp    194 <gets+0x5f>
      break;
 193:	90                   	nop
      break;
  }
  buf[i] = '\0';
 194:	8b 55 f4             	mov    -0xc(%ebp),%edx
 197:	8b 45 08             	mov    0x8(%ebp),%eax
 19a:	01 d0                	add    %edx,%eax
 19c:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 19f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1a2:	c9                   	leave  
 1a3:	c3                   	ret    

000001a4 <stat>:

int
stat(char *n, struct stat *st)
{
 1a4:	55                   	push   %ebp
 1a5:	89 e5                	mov    %esp,%ebp
 1a7:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1aa:	83 ec 08             	sub    $0x8,%esp
 1ad:	6a 00                	push   $0x0
 1af:	ff 75 08             	pushl  0x8(%ebp)
 1b2:	e8 0c 01 00 00       	call   2c3 <open>
 1b7:	83 c4 10             	add    $0x10,%esp
 1ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1bd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1c1:	79 07                	jns    1ca <stat+0x26>
    return -1;
 1c3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1c8:	eb 25                	jmp    1ef <stat+0x4b>
  r = fstat(fd, st);
 1ca:	83 ec 08             	sub    $0x8,%esp
 1cd:	ff 75 0c             	pushl  0xc(%ebp)
 1d0:	ff 75 f4             	pushl  -0xc(%ebp)
 1d3:	e8 03 01 00 00       	call   2db <fstat>
 1d8:	83 c4 10             	add    $0x10,%esp
 1db:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1de:	83 ec 0c             	sub    $0xc,%esp
 1e1:	ff 75 f4             	pushl  -0xc(%ebp)
 1e4:	e8 c2 00 00 00       	call   2ab <close>
 1e9:	83 c4 10             	add    $0x10,%esp
  return r;
 1ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1ef:	c9                   	leave  
 1f0:	c3                   	ret    

000001f1 <atoi>:

int
atoi(const char *s)
{
 1f1:	55                   	push   %ebp
 1f2:	89 e5                	mov    %esp,%ebp
 1f4:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 1f7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 1fe:	eb 25                	jmp    225 <atoi+0x34>
    n = n*10 + *s++ - '0';
 200:	8b 55 fc             	mov    -0x4(%ebp),%edx
 203:	89 d0                	mov    %edx,%eax
 205:	c1 e0 02             	shl    $0x2,%eax
 208:	01 d0                	add    %edx,%eax
 20a:	01 c0                	add    %eax,%eax
 20c:	89 c1                	mov    %eax,%ecx
 20e:	8b 45 08             	mov    0x8(%ebp),%eax
 211:	8d 50 01             	lea    0x1(%eax),%edx
 214:	89 55 08             	mov    %edx,0x8(%ebp)
 217:	0f b6 00             	movzbl (%eax),%eax
 21a:	0f be c0             	movsbl %al,%eax
 21d:	01 c8                	add    %ecx,%eax
 21f:	83 e8 30             	sub    $0x30,%eax
 222:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 225:	8b 45 08             	mov    0x8(%ebp),%eax
 228:	0f b6 00             	movzbl (%eax),%eax
 22b:	3c 2f                	cmp    $0x2f,%al
 22d:	7e 0a                	jle    239 <atoi+0x48>
 22f:	8b 45 08             	mov    0x8(%ebp),%eax
 232:	0f b6 00             	movzbl (%eax),%eax
 235:	3c 39                	cmp    $0x39,%al
 237:	7e c7                	jle    200 <atoi+0xf>
  return n;
 239:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 23c:	c9                   	leave  
 23d:	c3                   	ret    

0000023e <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 23e:	55                   	push   %ebp
 23f:	89 e5                	mov    %esp,%ebp
 241:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 244:	8b 45 08             	mov    0x8(%ebp),%eax
 247:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 24a:	8b 45 0c             	mov    0xc(%ebp),%eax
 24d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 250:	eb 17                	jmp    269 <memmove+0x2b>
    *dst++ = *src++;
 252:	8b 55 f8             	mov    -0x8(%ebp),%edx
 255:	8d 42 01             	lea    0x1(%edx),%eax
 258:	89 45 f8             	mov    %eax,-0x8(%ebp)
 25b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 25e:	8d 48 01             	lea    0x1(%eax),%ecx
 261:	89 4d fc             	mov    %ecx,-0x4(%ebp)
 264:	0f b6 12             	movzbl (%edx),%edx
 267:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 269:	8b 45 10             	mov    0x10(%ebp),%eax
 26c:	8d 50 ff             	lea    -0x1(%eax),%edx
 26f:	89 55 10             	mov    %edx,0x10(%ebp)
 272:	85 c0                	test   %eax,%eax
 274:	7f dc                	jg     252 <memmove+0x14>
  return vdst;
 276:	8b 45 08             	mov    0x8(%ebp),%eax
}
 279:	c9                   	leave  
 27a:	c3                   	ret    

0000027b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 27b:	b8 01 00 00 00       	mov    $0x1,%eax
 280:	cd 40                	int    $0x40
 282:	c3                   	ret    

00000283 <exit>:
SYSCALL(exit)
 283:	b8 02 00 00 00       	mov    $0x2,%eax
 288:	cd 40                	int    $0x40
 28a:	c3                   	ret    

0000028b <wait>:
SYSCALL(wait)
 28b:	b8 03 00 00 00       	mov    $0x3,%eax
 290:	cd 40                	int    $0x40
 292:	c3                   	ret    

00000293 <pipe>:
SYSCALL(pipe)
 293:	b8 04 00 00 00       	mov    $0x4,%eax
 298:	cd 40                	int    $0x40
 29a:	c3                   	ret    

0000029b <read>:
SYSCALL(read)
 29b:	b8 05 00 00 00       	mov    $0x5,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret    

000002a3 <write>:
SYSCALL(write)
 2a3:	b8 10 00 00 00       	mov    $0x10,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret    

000002ab <close>:
SYSCALL(close)
 2ab:	b8 15 00 00 00       	mov    $0x15,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <kill>:
SYSCALL(kill)
 2b3:	b8 06 00 00 00       	mov    $0x6,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <exec>:
SYSCALL(exec)
 2bb:	b8 07 00 00 00       	mov    $0x7,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <open>:
SYSCALL(open)
 2c3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <mknod>:
SYSCALL(mknod)
 2cb:	b8 11 00 00 00       	mov    $0x11,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <unlink>:
SYSCALL(unlink)
 2d3:	b8 12 00 00 00       	mov    $0x12,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <fstat>:
SYSCALL(fstat)
 2db:	b8 08 00 00 00       	mov    $0x8,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <link>:
SYSCALL(link)
 2e3:	b8 13 00 00 00       	mov    $0x13,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <mkdir>:
SYSCALL(mkdir)
 2eb:	b8 14 00 00 00       	mov    $0x14,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <chdir>:
SYSCALL(chdir)
 2f3:	b8 09 00 00 00       	mov    $0x9,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <dup>:
SYSCALL(dup)
 2fb:	b8 0a 00 00 00       	mov    $0xa,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <getpid>:
SYSCALL(getpid)
 303:	b8 0b 00 00 00       	mov    $0xb,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <sbrk>:
SYSCALL(sbrk)
 30b:	b8 0c 00 00 00       	mov    $0xc,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <sleep>:
SYSCALL(sleep)
 313:	b8 0d 00 00 00       	mov    $0xd,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <uptime>:
SYSCALL(uptime)
 31b:	b8 0e 00 00 00       	mov    $0xe,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <halt>:
SYSCALL(halt)
 323:	b8 16 00 00 00       	mov    $0x16,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <getnp>:
SYSCALL(getnp)
 32b:	b8 17 00 00 00       	mov    $0x17,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <sem_create>:
SYSCALL(sem_create)
 333:	b8 18 00 00 00       	mov    $0x18,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <sem_destroy>:
SYSCALL(sem_destroy)
 33b:	b8 19 00 00 00       	mov    $0x19,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <sem_wait>:
SYSCALL(sem_wait)
 343:	b8 1a 00 00 00       	mov    $0x1a,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <sem_signal>:
SYSCALL(sem_signal)
 34b:	b8 1b 00 00 00       	mov    $0x1b,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <clone>:
SYSCALL(clone)
 353:	b8 1c 00 00 00       	mov    $0x1c,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <join>:
SYSCALL(join)
 35b:	b8 1d 00 00 00       	mov    $0x1d,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 363:	55                   	push   %ebp
 364:	89 e5                	mov    %esp,%ebp
 366:	83 ec 18             	sub    $0x18,%esp
 369:	8b 45 0c             	mov    0xc(%ebp),%eax
 36c:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 36f:	83 ec 04             	sub    $0x4,%esp
 372:	6a 01                	push   $0x1
 374:	8d 45 f4             	lea    -0xc(%ebp),%eax
 377:	50                   	push   %eax
 378:	ff 75 08             	pushl  0x8(%ebp)
 37b:	e8 23 ff ff ff       	call   2a3 <write>
 380:	83 c4 10             	add    $0x10,%esp
}
 383:	90                   	nop
 384:	c9                   	leave  
 385:	c3                   	ret    

00000386 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 386:	55                   	push   %ebp
 387:	89 e5                	mov    %esp,%ebp
 389:	83 ec 28             	sub    $0x28,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 38c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 393:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 397:	74 17                	je     3b0 <printint+0x2a>
 399:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 39d:	79 11                	jns    3b0 <printint+0x2a>
    neg = 1;
 39f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3a6:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a9:	f7 d8                	neg    %eax
 3ab:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3ae:	eb 06                	jmp    3b6 <printint+0x30>
  } else {
    x = xx;
 3b0:	8b 45 0c             	mov    0xc(%ebp),%eax
 3b3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3b6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3bd:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3c3:	ba 00 00 00 00       	mov    $0x0,%edx
 3c8:	f7 f1                	div    %ecx
 3ca:	89 d1                	mov    %edx,%ecx
 3cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3cf:	8d 50 01             	lea    0x1(%eax),%edx
 3d2:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3d5:	0f b6 91 2c 0b 00 00 	movzbl 0xb2c(%ecx),%edx
 3dc:	88 54 05 dc          	mov    %dl,-0x24(%ebp,%eax,1)
  }while((x /= base) != 0);
 3e0:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3e6:	ba 00 00 00 00       	mov    $0x0,%edx
 3eb:	f7 f1                	div    %ecx
 3ed:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3f0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3f4:	75 c7                	jne    3bd <printint+0x37>
  if(neg)
 3f6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3fa:	74 2d                	je     429 <printint+0xa3>
    buf[i++] = '-';
 3fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3ff:	8d 50 01             	lea    0x1(%eax),%edx
 402:	89 55 f4             	mov    %edx,-0xc(%ebp)
 405:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 40a:	eb 1d                	jmp    429 <printint+0xa3>
    putc(fd, buf[i]);
 40c:	8d 55 dc             	lea    -0x24(%ebp),%edx
 40f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 412:	01 d0                	add    %edx,%eax
 414:	0f b6 00             	movzbl (%eax),%eax
 417:	0f be c0             	movsbl %al,%eax
 41a:	83 ec 08             	sub    $0x8,%esp
 41d:	50                   	push   %eax
 41e:	ff 75 08             	pushl  0x8(%ebp)
 421:	e8 3d ff ff ff       	call   363 <putc>
 426:	83 c4 10             	add    $0x10,%esp
  while(--i >= 0)
 429:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 42d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 431:	79 d9                	jns    40c <printint+0x86>
}
 433:	90                   	nop
 434:	c9                   	leave  
 435:	c3                   	ret    

00000436 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 436:	55                   	push   %ebp
 437:	89 e5                	mov    %esp,%ebp
 439:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 43c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 443:	8d 45 0c             	lea    0xc(%ebp),%eax
 446:	83 c0 04             	add    $0x4,%eax
 449:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 44c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 453:	e9 59 01 00 00       	jmp    5b1 <printf+0x17b>
    c = fmt[i] & 0xff;
 458:	8b 55 0c             	mov    0xc(%ebp),%edx
 45b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 45e:	01 d0                	add    %edx,%eax
 460:	0f b6 00             	movzbl (%eax),%eax
 463:	0f be c0             	movsbl %al,%eax
 466:	25 ff 00 00 00       	and    $0xff,%eax
 46b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 46e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 472:	75 2c                	jne    4a0 <printf+0x6a>
      if(c == '%'){
 474:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 478:	75 0c                	jne    486 <printf+0x50>
        state = '%';
 47a:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 481:	e9 27 01 00 00       	jmp    5ad <printf+0x177>
      } else {
        putc(fd, c);
 486:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 489:	0f be c0             	movsbl %al,%eax
 48c:	83 ec 08             	sub    $0x8,%esp
 48f:	50                   	push   %eax
 490:	ff 75 08             	pushl  0x8(%ebp)
 493:	e8 cb fe ff ff       	call   363 <putc>
 498:	83 c4 10             	add    $0x10,%esp
 49b:	e9 0d 01 00 00       	jmp    5ad <printf+0x177>
      }
    } else if(state == '%'){
 4a0:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4a4:	0f 85 03 01 00 00    	jne    5ad <printf+0x177>
      if(c == 'd'){
 4aa:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4ae:	75 1e                	jne    4ce <printf+0x98>
        printint(fd, *ap, 10, 1);
 4b0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4b3:	8b 00                	mov    (%eax),%eax
 4b5:	6a 01                	push   $0x1
 4b7:	6a 0a                	push   $0xa
 4b9:	50                   	push   %eax
 4ba:	ff 75 08             	pushl  0x8(%ebp)
 4bd:	e8 c4 fe ff ff       	call   386 <printint>
 4c2:	83 c4 10             	add    $0x10,%esp
        ap++;
 4c5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4c9:	e9 d8 00 00 00       	jmp    5a6 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 4ce:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4d2:	74 06                	je     4da <printf+0xa4>
 4d4:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4d8:	75 1e                	jne    4f8 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 4da:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4dd:	8b 00                	mov    (%eax),%eax
 4df:	6a 00                	push   $0x0
 4e1:	6a 10                	push   $0x10
 4e3:	50                   	push   %eax
 4e4:	ff 75 08             	pushl  0x8(%ebp)
 4e7:	e8 9a fe ff ff       	call   386 <printint>
 4ec:	83 c4 10             	add    $0x10,%esp
        ap++;
 4ef:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4f3:	e9 ae 00 00 00       	jmp    5a6 <printf+0x170>
      } else if(c == 's'){
 4f8:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 4fc:	75 43                	jne    541 <printf+0x10b>
        s = (char*)*ap;
 4fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
 501:	8b 00                	mov    (%eax),%eax
 503:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 506:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 50a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 50e:	75 25                	jne    535 <printf+0xff>
          s = "(null)";
 510:	c7 45 f4 a0 08 00 00 	movl   $0x8a0,-0xc(%ebp)
        while(*s != 0){
 517:	eb 1c                	jmp    535 <printf+0xff>
          putc(fd, *s);
 519:	8b 45 f4             	mov    -0xc(%ebp),%eax
 51c:	0f b6 00             	movzbl (%eax),%eax
 51f:	0f be c0             	movsbl %al,%eax
 522:	83 ec 08             	sub    $0x8,%esp
 525:	50                   	push   %eax
 526:	ff 75 08             	pushl  0x8(%ebp)
 529:	e8 35 fe ff ff       	call   363 <putc>
 52e:	83 c4 10             	add    $0x10,%esp
          s++;
 531:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 535:	8b 45 f4             	mov    -0xc(%ebp),%eax
 538:	0f b6 00             	movzbl (%eax),%eax
 53b:	84 c0                	test   %al,%al
 53d:	75 da                	jne    519 <printf+0xe3>
 53f:	eb 65                	jmp    5a6 <printf+0x170>
        }
      } else if(c == 'c'){
 541:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 545:	75 1d                	jne    564 <printf+0x12e>
        putc(fd, *ap);
 547:	8b 45 e8             	mov    -0x18(%ebp),%eax
 54a:	8b 00                	mov    (%eax),%eax
 54c:	0f be c0             	movsbl %al,%eax
 54f:	83 ec 08             	sub    $0x8,%esp
 552:	50                   	push   %eax
 553:	ff 75 08             	pushl  0x8(%ebp)
 556:	e8 08 fe ff ff       	call   363 <putc>
 55b:	83 c4 10             	add    $0x10,%esp
        ap++;
 55e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 562:	eb 42                	jmp    5a6 <printf+0x170>
      } else if(c == '%'){
 564:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 568:	75 17                	jne    581 <printf+0x14b>
        putc(fd, c);
 56a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 56d:	0f be c0             	movsbl %al,%eax
 570:	83 ec 08             	sub    $0x8,%esp
 573:	50                   	push   %eax
 574:	ff 75 08             	pushl  0x8(%ebp)
 577:	e8 e7 fd ff ff       	call   363 <putc>
 57c:	83 c4 10             	add    $0x10,%esp
 57f:	eb 25                	jmp    5a6 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 581:	83 ec 08             	sub    $0x8,%esp
 584:	6a 25                	push   $0x25
 586:	ff 75 08             	pushl  0x8(%ebp)
 589:	e8 d5 fd ff ff       	call   363 <putc>
 58e:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 591:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 594:	0f be c0             	movsbl %al,%eax
 597:	83 ec 08             	sub    $0x8,%esp
 59a:	50                   	push   %eax
 59b:	ff 75 08             	pushl  0x8(%ebp)
 59e:	e8 c0 fd ff ff       	call   363 <putc>
 5a3:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 5a6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 5ad:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5b1:	8b 55 0c             	mov    0xc(%ebp),%edx
 5b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5b7:	01 d0                	add    %edx,%eax
 5b9:	0f b6 00             	movzbl (%eax),%eax
 5bc:	84 c0                	test   %al,%al
 5be:	0f 85 94 fe ff ff    	jne    458 <printf+0x22>
    }
  }
}
 5c4:	90                   	nop
 5c5:	c9                   	leave  
 5c6:	c3                   	ret    

000005c7 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5c7:	55                   	push   %ebp
 5c8:	89 e5                	mov    %esp,%ebp
 5ca:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5cd:	8b 45 08             	mov    0x8(%ebp),%eax
 5d0:	83 e8 08             	sub    $0x8,%eax
 5d3:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5d6:	a1 48 0b 00 00       	mov    0xb48,%eax
 5db:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5de:	eb 24                	jmp    604 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5e3:	8b 00                	mov    (%eax),%eax
 5e5:	39 45 fc             	cmp    %eax,-0x4(%ebp)
 5e8:	72 12                	jb     5fc <free+0x35>
 5ea:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5ed:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5f0:	77 24                	ja     616 <free+0x4f>
 5f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5f5:	8b 00                	mov    (%eax),%eax
 5f7:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 5fa:	72 1a                	jb     616 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5ff:	8b 00                	mov    (%eax),%eax
 601:	89 45 fc             	mov    %eax,-0x4(%ebp)
 604:	8b 45 f8             	mov    -0x8(%ebp),%eax
 607:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 60a:	76 d4                	jbe    5e0 <free+0x19>
 60c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 60f:	8b 00                	mov    (%eax),%eax
 611:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 614:	73 ca                	jae    5e0 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 616:	8b 45 f8             	mov    -0x8(%ebp),%eax
 619:	8b 40 04             	mov    0x4(%eax),%eax
 61c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 623:	8b 45 f8             	mov    -0x8(%ebp),%eax
 626:	01 c2                	add    %eax,%edx
 628:	8b 45 fc             	mov    -0x4(%ebp),%eax
 62b:	8b 00                	mov    (%eax),%eax
 62d:	39 c2                	cmp    %eax,%edx
 62f:	75 24                	jne    655 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 631:	8b 45 f8             	mov    -0x8(%ebp),%eax
 634:	8b 50 04             	mov    0x4(%eax),%edx
 637:	8b 45 fc             	mov    -0x4(%ebp),%eax
 63a:	8b 00                	mov    (%eax),%eax
 63c:	8b 40 04             	mov    0x4(%eax),%eax
 63f:	01 c2                	add    %eax,%edx
 641:	8b 45 f8             	mov    -0x8(%ebp),%eax
 644:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 647:	8b 45 fc             	mov    -0x4(%ebp),%eax
 64a:	8b 00                	mov    (%eax),%eax
 64c:	8b 10                	mov    (%eax),%edx
 64e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 651:	89 10                	mov    %edx,(%eax)
 653:	eb 0a                	jmp    65f <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 655:	8b 45 fc             	mov    -0x4(%ebp),%eax
 658:	8b 10                	mov    (%eax),%edx
 65a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 65d:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 65f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 662:	8b 40 04             	mov    0x4(%eax),%eax
 665:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 66c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66f:	01 d0                	add    %edx,%eax
 671:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 674:	75 20                	jne    696 <free+0xcf>
    p->s.size += bp->s.size;
 676:	8b 45 fc             	mov    -0x4(%ebp),%eax
 679:	8b 50 04             	mov    0x4(%eax),%edx
 67c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 67f:	8b 40 04             	mov    0x4(%eax),%eax
 682:	01 c2                	add    %eax,%edx
 684:	8b 45 fc             	mov    -0x4(%ebp),%eax
 687:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 68a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 68d:	8b 10                	mov    (%eax),%edx
 68f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 692:	89 10                	mov    %edx,(%eax)
 694:	eb 08                	jmp    69e <free+0xd7>
  } else
    p->s.ptr = bp;
 696:	8b 45 fc             	mov    -0x4(%ebp),%eax
 699:	8b 55 f8             	mov    -0x8(%ebp),%edx
 69c:	89 10                	mov    %edx,(%eax)
  freep = p;
 69e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a1:	a3 48 0b 00 00       	mov    %eax,0xb48
}
 6a6:	90                   	nop
 6a7:	c9                   	leave  
 6a8:	c3                   	ret    

000006a9 <morecore>:

static Header*
morecore(uint nu)
{
 6a9:	55                   	push   %ebp
 6aa:	89 e5                	mov    %esp,%ebp
 6ac:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6af:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6b6:	77 07                	ja     6bf <morecore+0x16>
    nu = 4096;
 6b8:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6bf:	8b 45 08             	mov    0x8(%ebp),%eax
 6c2:	c1 e0 03             	shl    $0x3,%eax
 6c5:	83 ec 0c             	sub    $0xc,%esp
 6c8:	50                   	push   %eax
 6c9:	e8 3d fc ff ff       	call   30b <sbrk>
 6ce:	83 c4 10             	add    $0x10,%esp
 6d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6d4:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6d8:	75 07                	jne    6e1 <morecore+0x38>
    return 0;
 6da:	b8 00 00 00 00       	mov    $0x0,%eax
 6df:	eb 26                	jmp    707 <morecore+0x5e>
  hp = (Header*)p;
 6e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 6e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6ea:	8b 55 08             	mov    0x8(%ebp),%edx
 6ed:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 6f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6f3:	83 c0 08             	add    $0x8,%eax
 6f6:	83 ec 0c             	sub    $0xc,%esp
 6f9:	50                   	push   %eax
 6fa:	e8 c8 fe ff ff       	call   5c7 <free>
 6ff:	83 c4 10             	add    $0x10,%esp
  return freep;
 702:	a1 48 0b 00 00       	mov    0xb48,%eax
}
 707:	c9                   	leave  
 708:	c3                   	ret    

00000709 <malloc>:

void*
malloc(uint nbytes)
{
 709:	55                   	push   %ebp
 70a:	89 e5                	mov    %esp,%ebp
 70c:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 70f:	8b 45 08             	mov    0x8(%ebp),%eax
 712:	83 c0 07             	add    $0x7,%eax
 715:	c1 e8 03             	shr    $0x3,%eax
 718:	83 c0 01             	add    $0x1,%eax
 71b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 71e:	a1 48 0b 00 00       	mov    0xb48,%eax
 723:	89 45 f0             	mov    %eax,-0x10(%ebp)
 726:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 72a:	75 23                	jne    74f <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 72c:	c7 45 f0 40 0b 00 00 	movl   $0xb40,-0x10(%ebp)
 733:	8b 45 f0             	mov    -0x10(%ebp),%eax
 736:	a3 48 0b 00 00       	mov    %eax,0xb48
 73b:	a1 48 0b 00 00       	mov    0xb48,%eax
 740:	a3 40 0b 00 00       	mov    %eax,0xb40
    base.s.size = 0;
 745:	c7 05 44 0b 00 00 00 	movl   $0x0,0xb44
 74c:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 74f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 752:	8b 00                	mov    (%eax),%eax
 754:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 757:	8b 45 f4             	mov    -0xc(%ebp),%eax
 75a:	8b 40 04             	mov    0x4(%eax),%eax
 75d:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 760:	77 4d                	ja     7af <malloc+0xa6>
      if(p->s.size == nunits)
 762:	8b 45 f4             	mov    -0xc(%ebp),%eax
 765:	8b 40 04             	mov    0x4(%eax),%eax
 768:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 76b:	75 0c                	jne    779 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 76d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 770:	8b 10                	mov    (%eax),%edx
 772:	8b 45 f0             	mov    -0x10(%ebp),%eax
 775:	89 10                	mov    %edx,(%eax)
 777:	eb 26                	jmp    79f <malloc+0x96>
      else {
        p->s.size -= nunits;
 779:	8b 45 f4             	mov    -0xc(%ebp),%eax
 77c:	8b 40 04             	mov    0x4(%eax),%eax
 77f:	2b 45 ec             	sub    -0x14(%ebp),%eax
 782:	89 c2                	mov    %eax,%edx
 784:	8b 45 f4             	mov    -0xc(%ebp),%eax
 787:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 78a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 78d:	8b 40 04             	mov    0x4(%eax),%eax
 790:	c1 e0 03             	shl    $0x3,%eax
 793:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 796:	8b 45 f4             	mov    -0xc(%ebp),%eax
 799:	8b 55 ec             	mov    -0x14(%ebp),%edx
 79c:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 79f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7a2:	a3 48 0b 00 00       	mov    %eax,0xb48
      return (void*)(p + 1);
 7a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7aa:	83 c0 08             	add    $0x8,%eax
 7ad:	eb 3b                	jmp    7ea <malloc+0xe1>
    }
    if(p == freep)
 7af:	a1 48 0b 00 00       	mov    0xb48,%eax
 7b4:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7b7:	75 1e                	jne    7d7 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 7b9:	83 ec 0c             	sub    $0xc,%esp
 7bc:	ff 75 ec             	pushl  -0x14(%ebp)
 7bf:	e8 e5 fe ff ff       	call   6a9 <morecore>
 7c4:	83 c4 10             	add    $0x10,%esp
 7c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7ca:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7ce:	75 07                	jne    7d7 <malloc+0xce>
        return 0;
 7d0:	b8 00 00 00 00       	mov    $0x0,%eax
 7d5:	eb 13                	jmp    7ea <malloc+0xe1>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7da:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e0:	8b 00                	mov    (%eax),%eax
 7e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7e5:	e9 6d ff ff ff       	jmp    757 <malloc+0x4e>
  }
}
 7ea:	c9                   	leave  
 7eb:	c3                   	ret    

000007ec <hufs_thread_create>:

int thread_num = 0;


int hufs_thread_create(void *func(), void *args)
{
 7ec:	55                   	push   %ebp
 7ed:	89 e5                	mov    %esp,%ebp
 7ef:	83 ec 18             	sub    $0x18,%esp
	void *stack; 
	int pid;

	stack = malloc(4096);
 7f2:	83 ec 0c             	sub    $0xc,%esp
 7f5:	68 00 10 00 00       	push   $0x1000
 7fa:	e8 0a ff ff ff       	call   709 <malloc>
 7ff:	83 c4 10             	add    $0x10,%esp
 802:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (stack==0) return -1;
 805:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 809:	75 07                	jne    812 <hufs_thread_create+0x26>
 80b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 810:	eb 42                	jmp    854 <hufs_thread_create+0x68>

	pid = clone(func, args, stack); 
 812:	83 ec 04             	sub    $0x4,%esp
 815:	ff 75 f4             	pushl  -0xc(%ebp)
 818:	ff 75 0c             	pushl  0xc(%ebp)
 81b:	ff 75 08             	pushl  0x8(%ebp)
 81e:	e8 30 fb ff ff       	call   353 <clone>
 823:	83 c4 10             	add    $0x10,%esp
 826:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (pid==-1) {
 829:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 82d:	75 15                	jne    844 <hufs_thread_create+0x58>
		free(stack);
 82f:	83 ec 0c             	sub    $0xc,%esp
 832:	ff 75 f4             	pushl  -0xc(%ebp)
 835:	e8 8d fd ff ff       	call   5c7 <free>
 83a:	83 c4 10             	add    $0x10,%esp
		return -1;
 83d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 842:	eb 10                	jmp    854 <hufs_thread_create+0x68>
	}

	thread_info[pid].stack = stack; 
 844:	8b 45 f0             	mov    -0x10(%ebp),%eax
 847:	8b 55 f4             	mov    -0xc(%ebp),%edx
 84a:	89 14 85 60 0b 00 00 	mov    %edx,0xb60(,%eax,4)

	return pid; 
 851:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 854:	c9                   	leave  
 855:	c3                   	ret    

00000856 <hufs_thread_join>:

int hufs_thread_join(int pid)
{
 856:	55                   	push   %ebp
 857:	89 e5                	mov    %esp,%ebp
 859:	83 ec 18             	sub    $0x18,%esp
	void *stack = thread_info[pid].stack;
 85c:	8b 45 08             	mov    0x8(%ebp),%eax
 85f:	8b 04 85 60 0b 00 00 	mov    0xb60(,%eax,4),%eax
 866:	89 45 f4             	mov    %eax,-0xc(%ebp)

	if (stack==0) return -1;
 869:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 86d:	75 07                	jne    876 <hufs_thread_join+0x20>
 86f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 874:	eb 28                	jmp    89e <hufs_thread_join+0x48>

	join(&thread_info[pid].stack);	
 876:	8b 45 08             	mov    0x8(%ebp),%eax
 879:	c1 e0 02             	shl    $0x2,%eax
 87c:	05 60 0b 00 00       	add    $0xb60,%eax
 881:	83 ec 0c             	sub    $0xc,%esp
 884:	50                   	push   %eax
 885:	e8 d1 fa ff ff       	call   35b <join>
 88a:	83 c4 10             	add    $0x10,%esp
	free(stack);
 88d:	83 ec 0c             	sub    $0xc,%esp
 890:	ff 75 f4             	pushl  -0xc(%ebp)
 893:	e8 2f fd ff ff       	call   5c7 <free>
 898:	83 c4 10             	add    $0x10,%esp

	return pid;
 89b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 89e:	c9                   	leave  
 89f:	c3                   	ret    

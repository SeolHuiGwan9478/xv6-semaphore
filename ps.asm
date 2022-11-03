
_ps:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 14             	sub    $0x14,%esp
	int num = getnp();
  11:	e8 39 03 00 00       	call   34f <getnp>
  16:	89 45 f4             	mov    %eax,-0xc(%ebp)
	int pid ;

	pid = getpid();
  19:	e8 09 03 00 00       	call   327 <getpid>
  1e:	89 45 f0             	mov    %eax,-0x10(%ebp)

	printf(1, "current number of running processes is %d \n", num);
  21:	83 ec 04             	sub    $0x4,%esp
  24:	ff 75 f4             	pushl  -0xc(%ebp)
  27:	68 c4 08 00 00       	push   $0x8c4
  2c:	6a 01                	push   $0x1
  2e:	e8 27 04 00 00       	call   45a <printf>
  33:	83 c4 10             	add    $0x10,%esp
	printf(1, "current pid is %d \n", pid);
  36:	83 ec 04             	sub    $0x4,%esp
  39:	ff 75 f0             	pushl  -0x10(%ebp)
  3c:	68 f0 08 00 00       	push   $0x8f0
  41:	6a 01                	push   $0x1
  43:	e8 12 04 00 00       	call   45a <printf>
  48:	83 c4 10             	add    $0x10,%esp

	exit();
  4b:	e8 57 02 00 00       	call   2a7 <exit>

00000050 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  50:	55                   	push   %ebp
  51:	89 e5                	mov    %esp,%ebp
  53:	57                   	push   %edi
  54:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  55:	8b 4d 08             	mov    0x8(%ebp),%ecx
  58:	8b 55 10             	mov    0x10(%ebp),%edx
  5b:	8b 45 0c             	mov    0xc(%ebp),%eax
  5e:	89 cb                	mov    %ecx,%ebx
  60:	89 df                	mov    %ebx,%edi
  62:	89 d1                	mov    %edx,%ecx
  64:	fc                   	cld    
  65:	f3 aa                	rep stos %al,%es:(%edi)
  67:	89 ca                	mov    %ecx,%edx
  69:	89 fb                	mov    %edi,%ebx
  6b:	89 5d 08             	mov    %ebx,0x8(%ebp)
  6e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  71:	90                   	nop
  72:	5b                   	pop    %ebx
  73:	5f                   	pop    %edi
  74:	5d                   	pop    %ebp
  75:	c3                   	ret    

00000076 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  76:	55                   	push   %ebp
  77:	89 e5                	mov    %esp,%ebp
  79:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  7c:	8b 45 08             	mov    0x8(%ebp),%eax
  7f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  82:	90                   	nop
  83:	8b 55 0c             	mov    0xc(%ebp),%edx
  86:	8d 42 01             	lea    0x1(%edx),%eax
  89:	89 45 0c             	mov    %eax,0xc(%ebp)
  8c:	8b 45 08             	mov    0x8(%ebp),%eax
  8f:	8d 48 01             	lea    0x1(%eax),%ecx
  92:	89 4d 08             	mov    %ecx,0x8(%ebp)
  95:	0f b6 12             	movzbl (%edx),%edx
  98:	88 10                	mov    %dl,(%eax)
  9a:	0f b6 00             	movzbl (%eax),%eax
  9d:	84 c0                	test   %al,%al
  9f:	75 e2                	jne    83 <strcpy+0xd>
    ;
  return os;
  a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  a4:	c9                   	leave  
  a5:	c3                   	ret    

000000a6 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  a6:	55                   	push   %ebp
  a7:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  a9:	eb 08                	jmp    b3 <strcmp+0xd>
    p++, q++;
  ab:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  af:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  b3:	8b 45 08             	mov    0x8(%ebp),%eax
  b6:	0f b6 00             	movzbl (%eax),%eax
  b9:	84 c0                	test   %al,%al
  bb:	74 10                	je     cd <strcmp+0x27>
  bd:	8b 45 08             	mov    0x8(%ebp),%eax
  c0:	0f b6 10             	movzbl (%eax),%edx
  c3:	8b 45 0c             	mov    0xc(%ebp),%eax
  c6:	0f b6 00             	movzbl (%eax),%eax
  c9:	38 c2                	cmp    %al,%dl
  cb:	74 de                	je     ab <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  cd:	8b 45 08             	mov    0x8(%ebp),%eax
  d0:	0f b6 00             	movzbl (%eax),%eax
  d3:	0f b6 d0             	movzbl %al,%edx
  d6:	8b 45 0c             	mov    0xc(%ebp),%eax
  d9:	0f b6 00             	movzbl (%eax),%eax
  dc:	0f b6 c0             	movzbl %al,%eax
  df:	29 c2                	sub    %eax,%edx
  e1:	89 d0                	mov    %edx,%eax
}
  e3:	5d                   	pop    %ebp
  e4:	c3                   	ret    

000000e5 <strlen>:

uint
strlen(char *s)
{
  e5:	55                   	push   %ebp
  e6:	89 e5                	mov    %esp,%ebp
  e8:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  eb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  f2:	eb 04                	jmp    f8 <strlen+0x13>
  f4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  f8:	8b 55 fc             	mov    -0x4(%ebp),%edx
  fb:	8b 45 08             	mov    0x8(%ebp),%eax
  fe:	01 d0                	add    %edx,%eax
 100:	0f b6 00             	movzbl (%eax),%eax
 103:	84 c0                	test   %al,%al
 105:	75 ed                	jne    f4 <strlen+0xf>
    ;
  return n;
 107:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 10a:	c9                   	leave  
 10b:	c3                   	ret    

0000010c <memset>:

void*
memset(void *dst, int c, uint n)
{
 10c:	55                   	push   %ebp
 10d:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 10f:	8b 45 10             	mov    0x10(%ebp),%eax
 112:	50                   	push   %eax
 113:	ff 75 0c             	pushl  0xc(%ebp)
 116:	ff 75 08             	pushl  0x8(%ebp)
 119:	e8 32 ff ff ff       	call   50 <stosb>
 11e:	83 c4 0c             	add    $0xc,%esp
  return dst;
 121:	8b 45 08             	mov    0x8(%ebp),%eax
}
 124:	c9                   	leave  
 125:	c3                   	ret    

00000126 <strchr>:

char*
strchr(const char *s, char c)
{
 126:	55                   	push   %ebp
 127:	89 e5                	mov    %esp,%ebp
 129:	83 ec 04             	sub    $0x4,%esp
 12c:	8b 45 0c             	mov    0xc(%ebp),%eax
 12f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 132:	eb 14                	jmp    148 <strchr+0x22>
    if(*s == c)
 134:	8b 45 08             	mov    0x8(%ebp),%eax
 137:	0f b6 00             	movzbl (%eax),%eax
 13a:	38 45 fc             	cmp    %al,-0x4(%ebp)
 13d:	75 05                	jne    144 <strchr+0x1e>
      return (char*)s;
 13f:	8b 45 08             	mov    0x8(%ebp),%eax
 142:	eb 13                	jmp    157 <strchr+0x31>
  for(; *s; s++)
 144:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 148:	8b 45 08             	mov    0x8(%ebp),%eax
 14b:	0f b6 00             	movzbl (%eax),%eax
 14e:	84 c0                	test   %al,%al
 150:	75 e2                	jne    134 <strchr+0xe>
  return 0;
 152:	b8 00 00 00 00       	mov    $0x0,%eax
}
 157:	c9                   	leave  
 158:	c3                   	ret    

00000159 <gets>:

char*
gets(char *buf, int max)
{
 159:	55                   	push   %ebp
 15a:	89 e5                	mov    %esp,%ebp
 15c:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 15f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 166:	eb 42                	jmp    1aa <gets+0x51>
    cc = read(0, &c, 1);
 168:	83 ec 04             	sub    $0x4,%esp
 16b:	6a 01                	push   $0x1
 16d:	8d 45 ef             	lea    -0x11(%ebp),%eax
 170:	50                   	push   %eax
 171:	6a 00                	push   $0x0
 173:	e8 47 01 00 00       	call   2bf <read>
 178:	83 c4 10             	add    $0x10,%esp
 17b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 17e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 182:	7e 33                	jle    1b7 <gets+0x5e>
      break;
    buf[i++] = c;
 184:	8b 45 f4             	mov    -0xc(%ebp),%eax
 187:	8d 50 01             	lea    0x1(%eax),%edx
 18a:	89 55 f4             	mov    %edx,-0xc(%ebp)
 18d:	89 c2                	mov    %eax,%edx
 18f:	8b 45 08             	mov    0x8(%ebp),%eax
 192:	01 c2                	add    %eax,%edx
 194:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 198:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 19a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 19e:	3c 0a                	cmp    $0xa,%al
 1a0:	74 16                	je     1b8 <gets+0x5f>
 1a2:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1a6:	3c 0d                	cmp    $0xd,%al
 1a8:	74 0e                	je     1b8 <gets+0x5f>
  for(i=0; i+1 < max; ){
 1aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ad:	83 c0 01             	add    $0x1,%eax
 1b0:	39 45 0c             	cmp    %eax,0xc(%ebp)
 1b3:	7f b3                	jg     168 <gets+0xf>
 1b5:	eb 01                	jmp    1b8 <gets+0x5f>
      break;
 1b7:	90                   	nop
      break;
  }
  buf[i] = '\0';
 1b8:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1bb:	8b 45 08             	mov    0x8(%ebp),%eax
 1be:	01 d0                	add    %edx,%eax
 1c0:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1c3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1c6:	c9                   	leave  
 1c7:	c3                   	ret    

000001c8 <stat>:

int
stat(char *n, struct stat *st)
{
 1c8:	55                   	push   %ebp
 1c9:	89 e5                	mov    %esp,%ebp
 1cb:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1ce:	83 ec 08             	sub    $0x8,%esp
 1d1:	6a 00                	push   $0x0
 1d3:	ff 75 08             	pushl  0x8(%ebp)
 1d6:	e8 0c 01 00 00       	call   2e7 <open>
 1db:	83 c4 10             	add    $0x10,%esp
 1de:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1e1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1e5:	79 07                	jns    1ee <stat+0x26>
    return -1;
 1e7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1ec:	eb 25                	jmp    213 <stat+0x4b>
  r = fstat(fd, st);
 1ee:	83 ec 08             	sub    $0x8,%esp
 1f1:	ff 75 0c             	pushl  0xc(%ebp)
 1f4:	ff 75 f4             	pushl  -0xc(%ebp)
 1f7:	e8 03 01 00 00       	call   2ff <fstat>
 1fc:	83 c4 10             	add    $0x10,%esp
 1ff:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 202:	83 ec 0c             	sub    $0xc,%esp
 205:	ff 75 f4             	pushl  -0xc(%ebp)
 208:	e8 c2 00 00 00       	call   2cf <close>
 20d:	83 c4 10             	add    $0x10,%esp
  return r;
 210:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 213:	c9                   	leave  
 214:	c3                   	ret    

00000215 <atoi>:

int
atoi(const char *s)
{
 215:	55                   	push   %ebp
 216:	89 e5                	mov    %esp,%ebp
 218:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 21b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 222:	eb 25                	jmp    249 <atoi+0x34>
    n = n*10 + *s++ - '0';
 224:	8b 55 fc             	mov    -0x4(%ebp),%edx
 227:	89 d0                	mov    %edx,%eax
 229:	c1 e0 02             	shl    $0x2,%eax
 22c:	01 d0                	add    %edx,%eax
 22e:	01 c0                	add    %eax,%eax
 230:	89 c1                	mov    %eax,%ecx
 232:	8b 45 08             	mov    0x8(%ebp),%eax
 235:	8d 50 01             	lea    0x1(%eax),%edx
 238:	89 55 08             	mov    %edx,0x8(%ebp)
 23b:	0f b6 00             	movzbl (%eax),%eax
 23e:	0f be c0             	movsbl %al,%eax
 241:	01 c8                	add    %ecx,%eax
 243:	83 e8 30             	sub    $0x30,%eax
 246:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 249:	8b 45 08             	mov    0x8(%ebp),%eax
 24c:	0f b6 00             	movzbl (%eax),%eax
 24f:	3c 2f                	cmp    $0x2f,%al
 251:	7e 0a                	jle    25d <atoi+0x48>
 253:	8b 45 08             	mov    0x8(%ebp),%eax
 256:	0f b6 00             	movzbl (%eax),%eax
 259:	3c 39                	cmp    $0x39,%al
 25b:	7e c7                	jle    224 <atoi+0xf>
  return n;
 25d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 260:	c9                   	leave  
 261:	c3                   	ret    

00000262 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 262:	55                   	push   %ebp
 263:	89 e5                	mov    %esp,%ebp
 265:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 268:	8b 45 08             	mov    0x8(%ebp),%eax
 26b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 26e:	8b 45 0c             	mov    0xc(%ebp),%eax
 271:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 274:	eb 17                	jmp    28d <memmove+0x2b>
    *dst++ = *src++;
 276:	8b 55 f8             	mov    -0x8(%ebp),%edx
 279:	8d 42 01             	lea    0x1(%edx),%eax
 27c:	89 45 f8             	mov    %eax,-0x8(%ebp)
 27f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 282:	8d 48 01             	lea    0x1(%eax),%ecx
 285:	89 4d fc             	mov    %ecx,-0x4(%ebp)
 288:	0f b6 12             	movzbl (%edx),%edx
 28b:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 28d:	8b 45 10             	mov    0x10(%ebp),%eax
 290:	8d 50 ff             	lea    -0x1(%eax),%edx
 293:	89 55 10             	mov    %edx,0x10(%ebp)
 296:	85 c0                	test   %eax,%eax
 298:	7f dc                	jg     276 <memmove+0x14>
  return vdst;
 29a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 29d:	c9                   	leave  
 29e:	c3                   	ret    

0000029f <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 29f:	b8 01 00 00 00       	mov    $0x1,%eax
 2a4:	cd 40                	int    $0x40
 2a6:	c3                   	ret    

000002a7 <exit>:
SYSCALL(exit)
 2a7:	b8 02 00 00 00       	mov    $0x2,%eax
 2ac:	cd 40                	int    $0x40
 2ae:	c3                   	ret    

000002af <wait>:
SYSCALL(wait)
 2af:	b8 03 00 00 00       	mov    $0x3,%eax
 2b4:	cd 40                	int    $0x40
 2b6:	c3                   	ret    

000002b7 <pipe>:
SYSCALL(pipe)
 2b7:	b8 04 00 00 00       	mov    $0x4,%eax
 2bc:	cd 40                	int    $0x40
 2be:	c3                   	ret    

000002bf <read>:
SYSCALL(read)
 2bf:	b8 05 00 00 00       	mov    $0x5,%eax
 2c4:	cd 40                	int    $0x40
 2c6:	c3                   	ret    

000002c7 <write>:
SYSCALL(write)
 2c7:	b8 10 00 00 00       	mov    $0x10,%eax
 2cc:	cd 40                	int    $0x40
 2ce:	c3                   	ret    

000002cf <close>:
SYSCALL(close)
 2cf:	b8 15 00 00 00       	mov    $0x15,%eax
 2d4:	cd 40                	int    $0x40
 2d6:	c3                   	ret    

000002d7 <kill>:
SYSCALL(kill)
 2d7:	b8 06 00 00 00       	mov    $0x6,%eax
 2dc:	cd 40                	int    $0x40
 2de:	c3                   	ret    

000002df <exec>:
SYSCALL(exec)
 2df:	b8 07 00 00 00       	mov    $0x7,%eax
 2e4:	cd 40                	int    $0x40
 2e6:	c3                   	ret    

000002e7 <open>:
SYSCALL(open)
 2e7:	b8 0f 00 00 00       	mov    $0xf,%eax
 2ec:	cd 40                	int    $0x40
 2ee:	c3                   	ret    

000002ef <mknod>:
SYSCALL(mknod)
 2ef:	b8 11 00 00 00       	mov    $0x11,%eax
 2f4:	cd 40                	int    $0x40
 2f6:	c3                   	ret    

000002f7 <unlink>:
SYSCALL(unlink)
 2f7:	b8 12 00 00 00       	mov    $0x12,%eax
 2fc:	cd 40                	int    $0x40
 2fe:	c3                   	ret    

000002ff <fstat>:
SYSCALL(fstat)
 2ff:	b8 08 00 00 00       	mov    $0x8,%eax
 304:	cd 40                	int    $0x40
 306:	c3                   	ret    

00000307 <link>:
SYSCALL(link)
 307:	b8 13 00 00 00       	mov    $0x13,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret    

0000030f <mkdir>:
SYSCALL(mkdir)
 30f:	b8 14 00 00 00       	mov    $0x14,%eax
 314:	cd 40                	int    $0x40
 316:	c3                   	ret    

00000317 <chdir>:
SYSCALL(chdir)
 317:	b8 09 00 00 00       	mov    $0x9,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret    

0000031f <dup>:
SYSCALL(dup)
 31f:	b8 0a 00 00 00       	mov    $0xa,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret    

00000327 <getpid>:
SYSCALL(getpid)
 327:	b8 0b 00 00 00       	mov    $0xb,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret    

0000032f <sbrk>:
SYSCALL(sbrk)
 32f:	b8 0c 00 00 00       	mov    $0xc,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret    

00000337 <sleep>:
SYSCALL(sleep)
 337:	b8 0d 00 00 00       	mov    $0xd,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret    

0000033f <uptime>:
SYSCALL(uptime)
 33f:	b8 0e 00 00 00       	mov    $0xe,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret    

00000347 <halt>:
SYSCALL(halt)
 347:	b8 16 00 00 00       	mov    $0x16,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    

0000034f <getnp>:
SYSCALL(getnp)
 34f:	b8 17 00 00 00       	mov    $0x17,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret    

00000357 <sem_create>:
SYSCALL(sem_create)
 357:	b8 18 00 00 00       	mov    $0x18,%eax
 35c:	cd 40                	int    $0x40
 35e:	c3                   	ret    

0000035f <sem_destroy>:
SYSCALL(sem_destroy)
 35f:	b8 19 00 00 00       	mov    $0x19,%eax
 364:	cd 40                	int    $0x40
 366:	c3                   	ret    

00000367 <sem_wait>:
SYSCALL(sem_wait)
 367:	b8 1a 00 00 00       	mov    $0x1a,%eax
 36c:	cd 40                	int    $0x40
 36e:	c3                   	ret    

0000036f <sem_signal>:
SYSCALL(sem_signal)
 36f:	b8 1b 00 00 00       	mov    $0x1b,%eax
 374:	cd 40                	int    $0x40
 376:	c3                   	ret    

00000377 <clone>:
SYSCALL(clone)
 377:	b8 1c 00 00 00       	mov    $0x1c,%eax
 37c:	cd 40                	int    $0x40
 37e:	c3                   	ret    

0000037f <join>:
SYSCALL(join)
 37f:	b8 1d 00 00 00       	mov    $0x1d,%eax
 384:	cd 40                	int    $0x40
 386:	c3                   	ret    

00000387 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 387:	55                   	push   %ebp
 388:	89 e5                	mov    %esp,%ebp
 38a:	83 ec 18             	sub    $0x18,%esp
 38d:	8b 45 0c             	mov    0xc(%ebp),%eax
 390:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 393:	83 ec 04             	sub    $0x4,%esp
 396:	6a 01                	push   $0x1
 398:	8d 45 f4             	lea    -0xc(%ebp),%eax
 39b:	50                   	push   %eax
 39c:	ff 75 08             	pushl  0x8(%ebp)
 39f:	e8 23 ff ff ff       	call   2c7 <write>
 3a4:	83 c4 10             	add    $0x10,%esp
}
 3a7:	90                   	nop
 3a8:	c9                   	leave  
 3a9:	c3                   	ret    

000003aa <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3aa:	55                   	push   %ebp
 3ab:	89 e5                	mov    %esp,%ebp
 3ad:	83 ec 28             	sub    $0x28,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3b0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3b7:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3bb:	74 17                	je     3d4 <printint+0x2a>
 3bd:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3c1:	79 11                	jns    3d4 <printint+0x2a>
    neg = 1;
 3c3:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 3cd:	f7 d8                	neg    %eax
 3cf:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3d2:	eb 06                	jmp    3da <printint+0x30>
  } else {
    x = xx;
 3d4:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3da:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3e1:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3e7:	ba 00 00 00 00       	mov    $0x0,%edx
 3ec:	f7 f1                	div    %ecx
 3ee:	89 d1                	mov    %edx,%ecx
 3f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3f3:	8d 50 01             	lea    0x1(%eax),%edx
 3f6:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3f9:	0f b6 91 90 0b 00 00 	movzbl 0xb90(%ecx),%edx
 400:	88 54 05 dc          	mov    %dl,-0x24(%ebp,%eax,1)
  }while((x /= base) != 0);
 404:	8b 4d 10             	mov    0x10(%ebp),%ecx
 407:	8b 45 ec             	mov    -0x14(%ebp),%eax
 40a:	ba 00 00 00 00       	mov    $0x0,%edx
 40f:	f7 f1                	div    %ecx
 411:	89 45 ec             	mov    %eax,-0x14(%ebp)
 414:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 418:	75 c7                	jne    3e1 <printint+0x37>
  if(neg)
 41a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 41e:	74 2d                	je     44d <printint+0xa3>
    buf[i++] = '-';
 420:	8b 45 f4             	mov    -0xc(%ebp),%eax
 423:	8d 50 01             	lea    0x1(%eax),%edx
 426:	89 55 f4             	mov    %edx,-0xc(%ebp)
 429:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 42e:	eb 1d                	jmp    44d <printint+0xa3>
    putc(fd, buf[i]);
 430:	8d 55 dc             	lea    -0x24(%ebp),%edx
 433:	8b 45 f4             	mov    -0xc(%ebp),%eax
 436:	01 d0                	add    %edx,%eax
 438:	0f b6 00             	movzbl (%eax),%eax
 43b:	0f be c0             	movsbl %al,%eax
 43e:	83 ec 08             	sub    $0x8,%esp
 441:	50                   	push   %eax
 442:	ff 75 08             	pushl  0x8(%ebp)
 445:	e8 3d ff ff ff       	call   387 <putc>
 44a:	83 c4 10             	add    $0x10,%esp
  while(--i >= 0)
 44d:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 451:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 455:	79 d9                	jns    430 <printint+0x86>
}
 457:	90                   	nop
 458:	c9                   	leave  
 459:	c3                   	ret    

0000045a <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 45a:	55                   	push   %ebp
 45b:	89 e5                	mov    %esp,%ebp
 45d:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 460:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 467:	8d 45 0c             	lea    0xc(%ebp),%eax
 46a:	83 c0 04             	add    $0x4,%eax
 46d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 470:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 477:	e9 59 01 00 00       	jmp    5d5 <printf+0x17b>
    c = fmt[i] & 0xff;
 47c:	8b 55 0c             	mov    0xc(%ebp),%edx
 47f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 482:	01 d0                	add    %edx,%eax
 484:	0f b6 00             	movzbl (%eax),%eax
 487:	0f be c0             	movsbl %al,%eax
 48a:	25 ff 00 00 00       	and    $0xff,%eax
 48f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 492:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 496:	75 2c                	jne    4c4 <printf+0x6a>
      if(c == '%'){
 498:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 49c:	75 0c                	jne    4aa <printf+0x50>
        state = '%';
 49e:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 4a5:	e9 27 01 00 00       	jmp    5d1 <printf+0x177>
      } else {
        putc(fd, c);
 4aa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4ad:	0f be c0             	movsbl %al,%eax
 4b0:	83 ec 08             	sub    $0x8,%esp
 4b3:	50                   	push   %eax
 4b4:	ff 75 08             	pushl  0x8(%ebp)
 4b7:	e8 cb fe ff ff       	call   387 <putc>
 4bc:	83 c4 10             	add    $0x10,%esp
 4bf:	e9 0d 01 00 00       	jmp    5d1 <printf+0x177>
      }
    } else if(state == '%'){
 4c4:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4c8:	0f 85 03 01 00 00    	jne    5d1 <printf+0x177>
      if(c == 'd'){
 4ce:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4d2:	75 1e                	jne    4f2 <printf+0x98>
        printint(fd, *ap, 10, 1);
 4d4:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4d7:	8b 00                	mov    (%eax),%eax
 4d9:	6a 01                	push   $0x1
 4db:	6a 0a                	push   $0xa
 4dd:	50                   	push   %eax
 4de:	ff 75 08             	pushl  0x8(%ebp)
 4e1:	e8 c4 fe ff ff       	call   3aa <printint>
 4e6:	83 c4 10             	add    $0x10,%esp
        ap++;
 4e9:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4ed:	e9 d8 00 00 00       	jmp    5ca <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 4f2:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4f6:	74 06                	je     4fe <printf+0xa4>
 4f8:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4fc:	75 1e                	jne    51c <printf+0xc2>
        printint(fd, *ap, 16, 0);
 4fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
 501:	8b 00                	mov    (%eax),%eax
 503:	6a 00                	push   $0x0
 505:	6a 10                	push   $0x10
 507:	50                   	push   %eax
 508:	ff 75 08             	pushl  0x8(%ebp)
 50b:	e8 9a fe ff ff       	call   3aa <printint>
 510:	83 c4 10             	add    $0x10,%esp
        ap++;
 513:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 517:	e9 ae 00 00 00       	jmp    5ca <printf+0x170>
      } else if(c == 's'){
 51c:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 520:	75 43                	jne    565 <printf+0x10b>
        s = (char*)*ap;
 522:	8b 45 e8             	mov    -0x18(%ebp),%eax
 525:	8b 00                	mov    (%eax),%eax
 527:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 52a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 52e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 532:	75 25                	jne    559 <printf+0xff>
          s = "(null)";
 534:	c7 45 f4 04 09 00 00 	movl   $0x904,-0xc(%ebp)
        while(*s != 0){
 53b:	eb 1c                	jmp    559 <printf+0xff>
          putc(fd, *s);
 53d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 540:	0f b6 00             	movzbl (%eax),%eax
 543:	0f be c0             	movsbl %al,%eax
 546:	83 ec 08             	sub    $0x8,%esp
 549:	50                   	push   %eax
 54a:	ff 75 08             	pushl  0x8(%ebp)
 54d:	e8 35 fe ff ff       	call   387 <putc>
 552:	83 c4 10             	add    $0x10,%esp
          s++;
 555:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 559:	8b 45 f4             	mov    -0xc(%ebp),%eax
 55c:	0f b6 00             	movzbl (%eax),%eax
 55f:	84 c0                	test   %al,%al
 561:	75 da                	jne    53d <printf+0xe3>
 563:	eb 65                	jmp    5ca <printf+0x170>
        }
      } else if(c == 'c'){
 565:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 569:	75 1d                	jne    588 <printf+0x12e>
        putc(fd, *ap);
 56b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 56e:	8b 00                	mov    (%eax),%eax
 570:	0f be c0             	movsbl %al,%eax
 573:	83 ec 08             	sub    $0x8,%esp
 576:	50                   	push   %eax
 577:	ff 75 08             	pushl  0x8(%ebp)
 57a:	e8 08 fe ff ff       	call   387 <putc>
 57f:	83 c4 10             	add    $0x10,%esp
        ap++;
 582:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 586:	eb 42                	jmp    5ca <printf+0x170>
      } else if(c == '%'){
 588:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 58c:	75 17                	jne    5a5 <printf+0x14b>
        putc(fd, c);
 58e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 591:	0f be c0             	movsbl %al,%eax
 594:	83 ec 08             	sub    $0x8,%esp
 597:	50                   	push   %eax
 598:	ff 75 08             	pushl  0x8(%ebp)
 59b:	e8 e7 fd ff ff       	call   387 <putc>
 5a0:	83 c4 10             	add    $0x10,%esp
 5a3:	eb 25                	jmp    5ca <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5a5:	83 ec 08             	sub    $0x8,%esp
 5a8:	6a 25                	push   $0x25
 5aa:	ff 75 08             	pushl  0x8(%ebp)
 5ad:	e8 d5 fd ff ff       	call   387 <putc>
 5b2:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 5b5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5b8:	0f be c0             	movsbl %al,%eax
 5bb:	83 ec 08             	sub    $0x8,%esp
 5be:	50                   	push   %eax
 5bf:	ff 75 08             	pushl  0x8(%ebp)
 5c2:	e8 c0 fd ff ff       	call   387 <putc>
 5c7:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 5ca:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 5d1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5d5:	8b 55 0c             	mov    0xc(%ebp),%edx
 5d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5db:	01 d0                	add    %edx,%eax
 5dd:	0f b6 00             	movzbl (%eax),%eax
 5e0:	84 c0                	test   %al,%al
 5e2:	0f 85 94 fe ff ff    	jne    47c <printf+0x22>
    }
  }
}
 5e8:	90                   	nop
 5e9:	c9                   	leave  
 5ea:	c3                   	ret    

000005eb <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5eb:	55                   	push   %ebp
 5ec:	89 e5                	mov    %esp,%ebp
 5ee:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5f1:	8b 45 08             	mov    0x8(%ebp),%eax
 5f4:	83 e8 08             	sub    $0x8,%eax
 5f7:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5fa:	a1 c8 0b 00 00       	mov    0xbc8,%eax
 5ff:	89 45 fc             	mov    %eax,-0x4(%ebp)
 602:	eb 24                	jmp    628 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 604:	8b 45 fc             	mov    -0x4(%ebp),%eax
 607:	8b 00                	mov    (%eax),%eax
 609:	39 45 fc             	cmp    %eax,-0x4(%ebp)
 60c:	72 12                	jb     620 <free+0x35>
 60e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 611:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 614:	77 24                	ja     63a <free+0x4f>
 616:	8b 45 fc             	mov    -0x4(%ebp),%eax
 619:	8b 00                	mov    (%eax),%eax
 61b:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 61e:	72 1a                	jb     63a <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 620:	8b 45 fc             	mov    -0x4(%ebp),%eax
 623:	8b 00                	mov    (%eax),%eax
 625:	89 45 fc             	mov    %eax,-0x4(%ebp)
 628:	8b 45 f8             	mov    -0x8(%ebp),%eax
 62b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 62e:	76 d4                	jbe    604 <free+0x19>
 630:	8b 45 fc             	mov    -0x4(%ebp),%eax
 633:	8b 00                	mov    (%eax),%eax
 635:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 638:	73 ca                	jae    604 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 63a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 63d:	8b 40 04             	mov    0x4(%eax),%eax
 640:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 647:	8b 45 f8             	mov    -0x8(%ebp),%eax
 64a:	01 c2                	add    %eax,%edx
 64c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 64f:	8b 00                	mov    (%eax),%eax
 651:	39 c2                	cmp    %eax,%edx
 653:	75 24                	jne    679 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 655:	8b 45 f8             	mov    -0x8(%ebp),%eax
 658:	8b 50 04             	mov    0x4(%eax),%edx
 65b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 65e:	8b 00                	mov    (%eax),%eax
 660:	8b 40 04             	mov    0x4(%eax),%eax
 663:	01 c2                	add    %eax,%edx
 665:	8b 45 f8             	mov    -0x8(%ebp),%eax
 668:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 66b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66e:	8b 00                	mov    (%eax),%eax
 670:	8b 10                	mov    (%eax),%edx
 672:	8b 45 f8             	mov    -0x8(%ebp),%eax
 675:	89 10                	mov    %edx,(%eax)
 677:	eb 0a                	jmp    683 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 679:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67c:	8b 10                	mov    (%eax),%edx
 67e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 681:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 683:	8b 45 fc             	mov    -0x4(%ebp),%eax
 686:	8b 40 04             	mov    0x4(%eax),%eax
 689:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 690:	8b 45 fc             	mov    -0x4(%ebp),%eax
 693:	01 d0                	add    %edx,%eax
 695:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 698:	75 20                	jne    6ba <free+0xcf>
    p->s.size += bp->s.size;
 69a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69d:	8b 50 04             	mov    0x4(%eax),%edx
 6a0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a3:	8b 40 04             	mov    0x4(%eax),%eax
 6a6:	01 c2                	add    %eax,%edx
 6a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ab:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6ae:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b1:	8b 10                	mov    (%eax),%edx
 6b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b6:	89 10                	mov    %edx,(%eax)
 6b8:	eb 08                	jmp    6c2 <free+0xd7>
  } else
    p->s.ptr = bp;
 6ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6bd:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6c0:	89 10                	mov    %edx,(%eax)
  freep = p;
 6c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c5:	a3 c8 0b 00 00       	mov    %eax,0xbc8
}
 6ca:	90                   	nop
 6cb:	c9                   	leave  
 6cc:	c3                   	ret    

000006cd <morecore>:

static Header*
morecore(uint nu)
{
 6cd:	55                   	push   %ebp
 6ce:	89 e5                	mov    %esp,%ebp
 6d0:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6d3:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6da:	77 07                	ja     6e3 <morecore+0x16>
    nu = 4096;
 6dc:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6e3:	8b 45 08             	mov    0x8(%ebp),%eax
 6e6:	c1 e0 03             	shl    $0x3,%eax
 6e9:	83 ec 0c             	sub    $0xc,%esp
 6ec:	50                   	push   %eax
 6ed:	e8 3d fc ff ff       	call   32f <sbrk>
 6f2:	83 c4 10             	add    $0x10,%esp
 6f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6f8:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6fc:	75 07                	jne    705 <morecore+0x38>
    return 0;
 6fe:	b8 00 00 00 00       	mov    $0x0,%eax
 703:	eb 26                	jmp    72b <morecore+0x5e>
  hp = (Header*)p;
 705:	8b 45 f4             	mov    -0xc(%ebp),%eax
 708:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 70b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 70e:	8b 55 08             	mov    0x8(%ebp),%edx
 711:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 714:	8b 45 f0             	mov    -0x10(%ebp),%eax
 717:	83 c0 08             	add    $0x8,%eax
 71a:	83 ec 0c             	sub    $0xc,%esp
 71d:	50                   	push   %eax
 71e:	e8 c8 fe ff ff       	call   5eb <free>
 723:	83 c4 10             	add    $0x10,%esp
  return freep;
 726:	a1 c8 0b 00 00       	mov    0xbc8,%eax
}
 72b:	c9                   	leave  
 72c:	c3                   	ret    

0000072d <malloc>:

void*
malloc(uint nbytes)
{
 72d:	55                   	push   %ebp
 72e:	89 e5                	mov    %esp,%ebp
 730:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 733:	8b 45 08             	mov    0x8(%ebp),%eax
 736:	83 c0 07             	add    $0x7,%eax
 739:	c1 e8 03             	shr    $0x3,%eax
 73c:	83 c0 01             	add    $0x1,%eax
 73f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 742:	a1 c8 0b 00 00       	mov    0xbc8,%eax
 747:	89 45 f0             	mov    %eax,-0x10(%ebp)
 74a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 74e:	75 23                	jne    773 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 750:	c7 45 f0 c0 0b 00 00 	movl   $0xbc0,-0x10(%ebp)
 757:	8b 45 f0             	mov    -0x10(%ebp),%eax
 75a:	a3 c8 0b 00 00       	mov    %eax,0xbc8
 75f:	a1 c8 0b 00 00       	mov    0xbc8,%eax
 764:	a3 c0 0b 00 00       	mov    %eax,0xbc0
    base.s.size = 0;
 769:	c7 05 c4 0b 00 00 00 	movl   $0x0,0xbc4
 770:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 773:	8b 45 f0             	mov    -0x10(%ebp),%eax
 776:	8b 00                	mov    (%eax),%eax
 778:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 77b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 77e:	8b 40 04             	mov    0x4(%eax),%eax
 781:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 784:	77 4d                	ja     7d3 <malloc+0xa6>
      if(p->s.size == nunits)
 786:	8b 45 f4             	mov    -0xc(%ebp),%eax
 789:	8b 40 04             	mov    0x4(%eax),%eax
 78c:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 78f:	75 0c                	jne    79d <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 791:	8b 45 f4             	mov    -0xc(%ebp),%eax
 794:	8b 10                	mov    (%eax),%edx
 796:	8b 45 f0             	mov    -0x10(%ebp),%eax
 799:	89 10                	mov    %edx,(%eax)
 79b:	eb 26                	jmp    7c3 <malloc+0x96>
      else {
        p->s.size -= nunits;
 79d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a0:	8b 40 04             	mov    0x4(%eax),%eax
 7a3:	2b 45 ec             	sub    -0x14(%ebp),%eax
 7a6:	89 c2                	mov    %eax,%edx
 7a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ab:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b1:	8b 40 04             	mov    0x4(%eax),%eax
 7b4:	c1 e0 03             	shl    $0x3,%eax
 7b7:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7bd:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7c0:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7c6:	a3 c8 0b 00 00       	mov    %eax,0xbc8
      return (void*)(p + 1);
 7cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ce:	83 c0 08             	add    $0x8,%eax
 7d1:	eb 3b                	jmp    80e <malloc+0xe1>
    }
    if(p == freep)
 7d3:	a1 c8 0b 00 00       	mov    0xbc8,%eax
 7d8:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7db:	75 1e                	jne    7fb <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 7dd:	83 ec 0c             	sub    $0xc,%esp
 7e0:	ff 75 ec             	pushl  -0x14(%ebp)
 7e3:	e8 e5 fe ff ff       	call   6cd <morecore>
 7e8:	83 c4 10             	add    $0x10,%esp
 7eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7ee:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7f2:	75 07                	jne    7fb <malloc+0xce>
        return 0;
 7f4:	b8 00 00 00 00       	mov    $0x0,%eax
 7f9:	eb 13                	jmp    80e <malloc+0xe1>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7fe:	89 45 f0             	mov    %eax,-0x10(%ebp)
 801:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804:	8b 00                	mov    (%eax),%eax
 806:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 809:	e9 6d ff ff ff       	jmp    77b <malloc+0x4e>
  }
}
 80e:	c9                   	leave  
 80f:	c3                   	ret    

00000810 <hufs_thread_create>:

int thread_num = 0;


int hufs_thread_create(void *func(), void *args)
{
 810:	55                   	push   %ebp
 811:	89 e5                	mov    %esp,%ebp
 813:	83 ec 18             	sub    $0x18,%esp
	void *stack; 
	int pid;

	stack = malloc(4096);
 816:	83 ec 0c             	sub    $0xc,%esp
 819:	68 00 10 00 00       	push   $0x1000
 81e:	e8 0a ff ff ff       	call   72d <malloc>
 823:	83 c4 10             	add    $0x10,%esp
 826:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (stack==0) return -1;
 829:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 82d:	75 07                	jne    836 <hufs_thread_create+0x26>
 82f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 834:	eb 42                	jmp    878 <hufs_thread_create+0x68>

	pid = clone(func, args, stack); 
 836:	83 ec 04             	sub    $0x4,%esp
 839:	ff 75 f4             	pushl  -0xc(%ebp)
 83c:	ff 75 0c             	pushl  0xc(%ebp)
 83f:	ff 75 08             	pushl  0x8(%ebp)
 842:	e8 30 fb ff ff       	call   377 <clone>
 847:	83 c4 10             	add    $0x10,%esp
 84a:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (pid==-1) {
 84d:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 851:	75 15                	jne    868 <hufs_thread_create+0x58>
		free(stack);
 853:	83 ec 0c             	sub    $0xc,%esp
 856:	ff 75 f4             	pushl  -0xc(%ebp)
 859:	e8 8d fd ff ff       	call   5eb <free>
 85e:	83 c4 10             	add    $0x10,%esp
		return -1;
 861:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 866:	eb 10                	jmp    878 <hufs_thread_create+0x68>
	}

	thread_info[pid].stack = stack; 
 868:	8b 45 f0             	mov    -0x10(%ebp),%eax
 86b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 86e:	89 14 85 e0 0b 00 00 	mov    %edx,0xbe0(,%eax,4)

	return pid; 
 875:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 878:	c9                   	leave  
 879:	c3                   	ret    

0000087a <hufs_thread_join>:

int hufs_thread_join(int pid)
{
 87a:	55                   	push   %ebp
 87b:	89 e5                	mov    %esp,%ebp
 87d:	83 ec 18             	sub    $0x18,%esp
	void *stack = thread_info[pid].stack;
 880:	8b 45 08             	mov    0x8(%ebp),%eax
 883:	8b 04 85 e0 0b 00 00 	mov    0xbe0(,%eax,4),%eax
 88a:	89 45 f4             	mov    %eax,-0xc(%ebp)

	if (stack==0) return -1;
 88d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 891:	75 07                	jne    89a <hufs_thread_join+0x20>
 893:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 898:	eb 28                	jmp    8c2 <hufs_thread_join+0x48>

	join(&thread_info[pid].stack);	
 89a:	8b 45 08             	mov    0x8(%ebp),%eax
 89d:	c1 e0 02             	shl    $0x2,%eax
 8a0:	05 e0 0b 00 00       	add    $0xbe0,%eax
 8a5:	83 ec 0c             	sub    $0xc,%esp
 8a8:	50                   	push   %eax
 8a9:	e8 d1 fa ff ff       	call   37f <join>
 8ae:	83 c4 10             	add    $0x10,%esp
	free(stack);
 8b1:	83 ec 0c             	sub    $0xc,%esp
 8b4:	ff 75 f4             	pushl  -0xc(%ebp)
 8b7:	e8 2f fd ff ff       	call   5eb <free>
 8bc:	83 c4 10             	add    $0x10,%esp

	return pid;
 8bf:	8b 45 08             	mov    0x8(%ebp),%eax
}
 8c2:	c9                   	leave  
 8c3:	c3                   	ret    

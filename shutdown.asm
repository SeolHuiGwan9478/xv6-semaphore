
_shutdown:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
	halt();
  11:	e8 fc 02 00 00       	call   312 <halt>
	exit();
  16:	e8 57 02 00 00       	call   272 <exit>

0000001b <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  1b:	55                   	push   %ebp
  1c:	89 e5                	mov    %esp,%ebp
  1e:	57                   	push   %edi
  1f:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  20:	8b 4d 08             	mov    0x8(%ebp),%ecx
  23:	8b 55 10             	mov    0x10(%ebp),%edx
  26:	8b 45 0c             	mov    0xc(%ebp),%eax
  29:	89 cb                	mov    %ecx,%ebx
  2b:	89 df                	mov    %ebx,%edi
  2d:	89 d1                	mov    %edx,%ecx
  2f:	fc                   	cld    
  30:	f3 aa                	rep stos %al,%es:(%edi)
  32:	89 ca                	mov    %ecx,%edx
  34:	89 fb                	mov    %edi,%ebx
  36:	89 5d 08             	mov    %ebx,0x8(%ebp)
  39:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  3c:	90                   	nop
  3d:	5b                   	pop    %ebx
  3e:	5f                   	pop    %edi
  3f:	5d                   	pop    %ebp
  40:	c3                   	ret    

00000041 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  41:	55                   	push   %ebp
  42:	89 e5                	mov    %esp,%ebp
  44:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  47:	8b 45 08             	mov    0x8(%ebp),%eax
  4a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  4d:	90                   	nop
  4e:	8b 55 0c             	mov    0xc(%ebp),%edx
  51:	8d 42 01             	lea    0x1(%edx),%eax
  54:	89 45 0c             	mov    %eax,0xc(%ebp)
  57:	8b 45 08             	mov    0x8(%ebp),%eax
  5a:	8d 48 01             	lea    0x1(%eax),%ecx
  5d:	89 4d 08             	mov    %ecx,0x8(%ebp)
  60:	0f b6 12             	movzbl (%edx),%edx
  63:	88 10                	mov    %dl,(%eax)
  65:	0f b6 00             	movzbl (%eax),%eax
  68:	84 c0                	test   %al,%al
  6a:	75 e2                	jne    4e <strcpy+0xd>
    ;
  return os;
  6c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  6f:	c9                   	leave  
  70:	c3                   	ret    

00000071 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  71:	55                   	push   %ebp
  72:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  74:	eb 08                	jmp    7e <strcmp+0xd>
    p++, q++;
  76:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  7a:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  7e:	8b 45 08             	mov    0x8(%ebp),%eax
  81:	0f b6 00             	movzbl (%eax),%eax
  84:	84 c0                	test   %al,%al
  86:	74 10                	je     98 <strcmp+0x27>
  88:	8b 45 08             	mov    0x8(%ebp),%eax
  8b:	0f b6 10             	movzbl (%eax),%edx
  8e:	8b 45 0c             	mov    0xc(%ebp),%eax
  91:	0f b6 00             	movzbl (%eax),%eax
  94:	38 c2                	cmp    %al,%dl
  96:	74 de                	je     76 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  98:	8b 45 08             	mov    0x8(%ebp),%eax
  9b:	0f b6 00             	movzbl (%eax),%eax
  9e:	0f b6 d0             	movzbl %al,%edx
  a1:	8b 45 0c             	mov    0xc(%ebp),%eax
  a4:	0f b6 00             	movzbl (%eax),%eax
  a7:	0f b6 c0             	movzbl %al,%eax
  aa:	29 c2                	sub    %eax,%edx
  ac:	89 d0                	mov    %edx,%eax
}
  ae:	5d                   	pop    %ebp
  af:	c3                   	ret    

000000b0 <strlen>:

uint
strlen(char *s)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  b6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  bd:	eb 04                	jmp    c3 <strlen+0x13>
  bf:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  c3:	8b 55 fc             	mov    -0x4(%ebp),%edx
  c6:	8b 45 08             	mov    0x8(%ebp),%eax
  c9:	01 d0                	add    %edx,%eax
  cb:	0f b6 00             	movzbl (%eax),%eax
  ce:	84 c0                	test   %al,%al
  d0:	75 ed                	jne    bf <strlen+0xf>
    ;
  return n;
  d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  d5:	c9                   	leave  
  d6:	c3                   	ret    

000000d7 <memset>:

void*
memset(void *dst, int c, uint n)
{
  d7:	55                   	push   %ebp
  d8:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
  da:	8b 45 10             	mov    0x10(%ebp),%eax
  dd:	50                   	push   %eax
  de:	ff 75 0c             	pushl  0xc(%ebp)
  e1:	ff 75 08             	pushl  0x8(%ebp)
  e4:	e8 32 ff ff ff       	call   1b <stosb>
  e9:	83 c4 0c             	add    $0xc,%esp
  return dst;
  ec:	8b 45 08             	mov    0x8(%ebp),%eax
}
  ef:	c9                   	leave  
  f0:	c3                   	ret    

000000f1 <strchr>:

char*
strchr(const char *s, char c)
{
  f1:	55                   	push   %ebp
  f2:	89 e5                	mov    %esp,%ebp
  f4:	83 ec 04             	sub    $0x4,%esp
  f7:	8b 45 0c             	mov    0xc(%ebp),%eax
  fa:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
  fd:	eb 14                	jmp    113 <strchr+0x22>
    if(*s == c)
  ff:	8b 45 08             	mov    0x8(%ebp),%eax
 102:	0f b6 00             	movzbl (%eax),%eax
 105:	38 45 fc             	cmp    %al,-0x4(%ebp)
 108:	75 05                	jne    10f <strchr+0x1e>
      return (char*)s;
 10a:	8b 45 08             	mov    0x8(%ebp),%eax
 10d:	eb 13                	jmp    122 <strchr+0x31>
  for(; *s; s++)
 10f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 113:	8b 45 08             	mov    0x8(%ebp),%eax
 116:	0f b6 00             	movzbl (%eax),%eax
 119:	84 c0                	test   %al,%al
 11b:	75 e2                	jne    ff <strchr+0xe>
  return 0;
 11d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 122:	c9                   	leave  
 123:	c3                   	ret    

00000124 <gets>:

char*
gets(char *buf, int max)
{
 124:	55                   	push   %ebp
 125:	89 e5                	mov    %esp,%ebp
 127:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 12a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 131:	eb 42                	jmp    175 <gets+0x51>
    cc = read(0, &c, 1);
 133:	83 ec 04             	sub    $0x4,%esp
 136:	6a 01                	push   $0x1
 138:	8d 45 ef             	lea    -0x11(%ebp),%eax
 13b:	50                   	push   %eax
 13c:	6a 00                	push   $0x0
 13e:	e8 47 01 00 00       	call   28a <read>
 143:	83 c4 10             	add    $0x10,%esp
 146:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 149:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 14d:	7e 33                	jle    182 <gets+0x5e>
      break;
    buf[i++] = c;
 14f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 152:	8d 50 01             	lea    0x1(%eax),%edx
 155:	89 55 f4             	mov    %edx,-0xc(%ebp)
 158:	89 c2                	mov    %eax,%edx
 15a:	8b 45 08             	mov    0x8(%ebp),%eax
 15d:	01 c2                	add    %eax,%edx
 15f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 163:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 165:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 169:	3c 0a                	cmp    $0xa,%al
 16b:	74 16                	je     183 <gets+0x5f>
 16d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 171:	3c 0d                	cmp    $0xd,%al
 173:	74 0e                	je     183 <gets+0x5f>
  for(i=0; i+1 < max; ){
 175:	8b 45 f4             	mov    -0xc(%ebp),%eax
 178:	83 c0 01             	add    $0x1,%eax
 17b:	39 45 0c             	cmp    %eax,0xc(%ebp)
 17e:	7f b3                	jg     133 <gets+0xf>
 180:	eb 01                	jmp    183 <gets+0x5f>
      break;
 182:	90                   	nop
      break;
  }
  buf[i] = '\0';
 183:	8b 55 f4             	mov    -0xc(%ebp),%edx
 186:	8b 45 08             	mov    0x8(%ebp),%eax
 189:	01 d0                	add    %edx,%eax
 18b:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 18e:	8b 45 08             	mov    0x8(%ebp),%eax
}
 191:	c9                   	leave  
 192:	c3                   	ret    

00000193 <stat>:

int
stat(char *n, struct stat *st)
{
 193:	55                   	push   %ebp
 194:	89 e5                	mov    %esp,%ebp
 196:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 199:	83 ec 08             	sub    $0x8,%esp
 19c:	6a 00                	push   $0x0
 19e:	ff 75 08             	pushl  0x8(%ebp)
 1a1:	e8 0c 01 00 00       	call   2b2 <open>
 1a6:	83 c4 10             	add    $0x10,%esp
 1a9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1ac:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1b0:	79 07                	jns    1b9 <stat+0x26>
    return -1;
 1b2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1b7:	eb 25                	jmp    1de <stat+0x4b>
  r = fstat(fd, st);
 1b9:	83 ec 08             	sub    $0x8,%esp
 1bc:	ff 75 0c             	pushl  0xc(%ebp)
 1bf:	ff 75 f4             	pushl  -0xc(%ebp)
 1c2:	e8 03 01 00 00       	call   2ca <fstat>
 1c7:	83 c4 10             	add    $0x10,%esp
 1ca:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1cd:	83 ec 0c             	sub    $0xc,%esp
 1d0:	ff 75 f4             	pushl  -0xc(%ebp)
 1d3:	e8 c2 00 00 00       	call   29a <close>
 1d8:	83 c4 10             	add    $0x10,%esp
  return r;
 1db:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1de:	c9                   	leave  
 1df:	c3                   	ret    

000001e0 <atoi>:

int
atoi(const char *s)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 1e6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 1ed:	eb 25                	jmp    214 <atoi+0x34>
    n = n*10 + *s++ - '0';
 1ef:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1f2:	89 d0                	mov    %edx,%eax
 1f4:	c1 e0 02             	shl    $0x2,%eax
 1f7:	01 d0                	add    %edx,%eax
 1f9:	01 c0                	add    %eax,%eax
 1fb:	89 c1                	mov    %eax,%ecx
 1fd:	8b 45 08             	mov    0x8(%ebp),%eax
 200:	8d 50 01             	lea    0x1(%eax),%edx
 203:	89 55 08             	mov    %edx,0x8(%ebp)
 206:	0f b6 00             	movzbl (%eax),%eax
 209:	0f be c0             	movsbl %al,%eax
 20c:	01 c8                	add    %ecx,%eax
 20e:	83 e8 30             	sub    $0x30,%eax
 211:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 214:	8b 45 08             	mov    0x8(%ebp),%eax
 217:	0f b6 00             	movzbl (%eax),%eax
 21a:	3c 2f                	cmp    $0x2f,%al
 21c:	7e 0a                	jle    228 <atoi+0x48>
 21e:	8b 45 08             	mov    0x8(%ebp),%eax
 221:	0f b6 00             	movzbl (%eax),%eax
 224:	3c 39                	cmp    $0x39,%al
 226:	7e c7                	jle    1ef <atoi+0xf>
  return n;
 228:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 22b:	c9                   	leave  
 22c:	c3                   	ret    

0000022d <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 22d:	55                   	push   %ebp
 22e:	89 e5                	mov    %esp,%ebp
 230:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 233:	8b 45 08             	mov    0x8(%ebp),%eax
 236:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 239:	8b 45 0c             	mov    0xc(%ebp),%eax
 23c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 23f:	eb 17                	jmp    258 <memmove+0x2b>
    *dst++ = *src++;
 241:	8b 55 f8             	mov    -0x8(%ebp),%edx
 244:	8d 42 01             	lea    0x1(%edx),%eax
 247:	89 45 f8             	mov    %eax,-0x8(%ebp)
 24a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 24d:	8d 48 01             	lea    0x1(%eax),%ecx
 250:	89 4d fc             	mov    %ecx,-0x4(%ebp)
 253:	0f b6 12             	movzbl (%edx),%edx
 256:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 258:	8b 45 10             	mov    0x10(%ebp),%eax
 25b:	8d 50 ff             	lea    -0x1(%eax),%edx
 25e:	89 55 10             	mov    %edx,0x10(%ebp)
 261:	85 c0                	test   %eax,%eax
 263:	7f dc                	jg     241 <memmove+0x14>
  return vdst;
 265:	8b 45 08             	mov    0x8(%ebp),%eax
}
 268:	c9                   	leave  
 269:	c3                   	ret    

0000026a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 26a:	b8 01 00 00 00       	mov    $0x1,%eax
 26f:	cd 40                	int    $0x40
 271:	c3                   	ret    

00000272 <exit>:
SYSCALL(exit)
 272:	b8 02 00 00 00       	mov    $0x2,%eax
 277:	cd 40                	int    $0x40
 279:	c3                   	ret    

0000027a <wait>:
SYSCALL(wait)
 27a:	b8 03 00 00 00       	mov    $0x3,%eax
 27f:	cd 40                	int    $0x40
 281:	c3                   	ret    

00000282 <pipe>:
SYSCALL(pipe)
 282:	b8 04 00 00 00       	mov    $0x4,%eax
 287:	cd 40                	int    $0x40
 289:	c3                   	ret    

0000028a <read>:
SYSCALL(read)
 28a:	b8 05 00 00 00       	mov    $0x5,%eax
 28f:	cd 40                	int    $0x40
 291:	c3                   	ret    

00000292 <write>:
SYSCALL(write)
 292:	b8 10 00 00 00       	mov    $0x10,%eax
 297:	cd 40                	int    $0x40
 299:	c3                   	ret    

0000029a <close>:
SYSCALL(close)
 29a:	b8 15 00 00 00       	mov    $0x15,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret    

000002a2 <kill>:
SYSCALL(kill)
 2a2:	b8 06 00 00 00       	mov    $0x6,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <exec>:
SYSCALL(exec)
 2aa:	b8 07 00 00 00       	mov    $0x7,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <open>:
SYSCALL(open)
 2b2:	b8 0f 00 00 00       	mov    $0xf,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <mknod>:
SYSCALL(mknod)
 2ba:	b8 11 00 00 00       	mov    $0x11,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <unlink>:
SYSCALL(unlink)
 2c2:	b8 12 00 00 00       	mov    $0x12,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <fstat>:
SYSCALL(fstat)
 2ca:	b8 08 00 00 00       	mov    $0x8,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <link>:
SYSCALL(link)
 2d2:	b8 13 00 00 00       	mov    $0x13,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <mkdir>:
SYSCALL(mkdir)
 2da:	b8 14 00 00 00       	mov    $0x14,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <chdir>:
SYSCALL(chdir)
 2e2:	b8 09 00 00 00       	mov    $0x9,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <dup>:
SYSCALL(dup)
 2ea:	b8 0a 00 00 00       	mov    $0xa,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <getpid>:
SYSCALL(getpid)
 2f2:	b8 0b 00 00 00       	mov    $0xb,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <sbrk>:
SYSCALL(sbrk)
 2fa:	b8 0c 00 00 00       	mov    $0xc,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <sleep>:
SYSCALL(sleep)
 302:	b8 0d 00 00 00       	mov    $0xd,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <uptime>:
SYSCALL(uptime)
 30a:	b8 0e 00 00 00       	mov    $0xe,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <halt>:
SYSCALL(halt)
 312:	b8 16 00 00 00       	mov    $0x16,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <getnp>:
SYSCALL(getnp)
 31a:	b8 17 00 00 00       	mov    $0x17,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <sem_create>:
SYSCALL(sem_create)
 322:	b8 18 00 00 00       	mov    $0x18,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <sem_destroy>:
SYSCALL(sem_destroy)
 32a:	b8 19 00 00 00       	mov    $0x19,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <sem_wait>:
SYSCALL(sem_wait)
 332:	b8 1a 00 00 00       	mov    $0x1a,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <sem_signal>:
SYSCALL(sem_signal)
 33a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <clone>:
SYSCALL(clone)
 342:	b8 1c 00 00 00       	mov    $0x1c,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <join>:
SYSCALL(join)
 34a:	b8 1d 00 00 00       	mov    $0x1d,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 352:	55                   	push   %ebp
 353:	89 e5                	mov    %esp,%ebp
 355:	83 ec 18             	sub    $0x18,%esp
 358:	8b 45 0c             	mov    0xc(%ebp),%eax
 35b:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 35e:	83 ec 04             	sub    $0x4,%esp
 361:	6a 01                	push   $0x1
 363:	8d 45 f4             	lea    -0xc(%ebp),%eax
 366:	50                   	push   %eax
 367:	ff 75 08             	pushl  0x8(%ebp)
 36a:	e8 23 ff ff ff       	call   292 <write>
 36f:	83 c4 10             	add    $0x10,%esp
}
 372:	90                   	nop
 373:	c9                   	leave  
 374:	c3                   	ret    

00000375 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 375:	55                   	push   %ebp
 376:	89 e5                	mov    %esp,%ebp
 378:	83 ec 28             	sub    $0x28,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 37b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 382:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 386:	74 17                	je     39f <printint+0x2a>
 388:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 38c:	79 11                	jns    39f <printint+0x2a>
    neg = 1;
 38e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 395:	8b 45 0c             	mov    0xc(%ebp),%eax
 398:	f7 d8                	neg    %eax
 39a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 39d:	eb 06                	jmp    3a5 <printint+0x30>
  } else {
    x = xx;
 39f:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3a5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3ac:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3af:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3b2:	ba 00 00 00 00       	mov    $0x0,%edx
 3b7:	f7 f1                	div    %ecx
 3b9:	89 d1                	mov    %edx,%ecx
 3bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3be:	8d 50 01             	lea    0x1(%eax),%edx
 3c1:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3c4:	0f b6 91 1c 0b 00 00 	movzbl 0xb1c(%ecx),%edx
 3cb:	88 54 05 dc          	mov    %dl,-0x24(%ebp,%eax,1)
  }while((x /= base) != 0);
 3cf:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3d5:	ba 00 00 00 00       	mov    $0x0,%edx
 3da:	f7 f1                	div    %ecx
 3dc:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3df:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3e3:	75 c7                	jne    3ac <printint+0x37>
  if(neg)
 3e5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3e9:	74 2d                	je     418 <printint+0xa3>
    buf[i++] = '-';
 3eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3ee:	8d 50 01             	lea    0x1(%eax),%edx
 3f1:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3f4:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 3f9:	eb 1d                	jmp    418 <printint+0xa3>
    putc(fd, buf[i]);
 3fb:	8d 55 dc             	lea    -0x24(%ebp),%edx
 3fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
 401:	01 d0                	add    %edx,%eax
 403:	0f b6 00             	movzbl (%eax),%eax
 406:	0f be c0             	movsbl %al,%eax
 409:	83 ec 08             	sub    $0x8,%esp
 40c:	50                   	push   %eax
 40d:	ff 75 08             	pushl  0x8(%ebp)
 410:	e8 3d ff ff ff       	call   352 <putc>
 415:	83 c4 10             	add    $0x10,%esp
  while(--i >= 0)
 418:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 41c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 420:	79 d9                	jns    3fb <printint+0x86>
}
 422:	90                   	nop
 423:	c9                   	leave  
 424:	c3                   	ret    

00000425 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 425:	55                   	push   %ebp
 426:	89 e5                	mov    %esp,%ebp
 428:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 42b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 432:	8d 45 0c             	lea    0xc(%ebp),%eax
 435:	83 c0 04             	add    $0x4,%eax
 438:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 43b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 442:	e9 59 01 00 00       	jmp    5a0 <printf+0x17b>
    c = fmt[i] & 0xff;
 447:	8b 55 0c             	mov    0xc(%ebp),%edx
 44a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 44d:	01 d0                	add    %edx,%eax
 44f:	0f b6 00             	movzbl (%eax),%eax
 452:	0f be c0             	movsbl %al,%eax
 455:	25 ff 00 00 00       	and    $0xff,%eax
 45a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 45d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 461:	75 2c                	jne    48f <printf+0x6a>
      if(c == '%'){
 463:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 467:	75 0c                	jne    475 <printf+0x50>
        state = '%';
 469:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 470:	e9 27 01 00 00       	jmp    59c <printf+0x177>
      } else {
        putc(fd, c);
 475:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 478:	0f be c0             	movsbl %al,%eax
 47b:	83 ec 08             	sub    $0x8,%esp
 47e:	50                   	push   %eax
 47f:	ff 75 08             	pushl  0x8(%ebp)
 482:	e8 cb fe ff ff       	call   352 <putc>
 487:	83 c4 10             	add    $0x10,%esp
 48a:	e9 0d 01 00 00       	jmp    59c <printf+0x177>
      }
    } else if(state == '%'){
 48f:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 493:	0f 85 03 01 00 00    	jne    59c <printf+0x177>
      if(c == 'd'){
 499:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 49d:	75 1e                	jne    4bd <printf+0x98>
        printint(fd, *ap, 10, 1);
 49f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4a2:	8b 00                	mov    (%eax),%eax
 4a4:	6a 01                	push   $0x1
 4a6:	6a 0a                	push   $0xa
 4a8:	50                   	push   %eax
 4a9:	ff 75 08             	pushl  0x8(%ebp)
 4ac:	e8 c4 fe ff ff       	call   375 <printint>
 4b1:	83 c4 10             	add    $0x10,%esp
        ap++;
 4b4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4b8:	e9 d8 00 00 00       	jmp    595 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 4bd:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4c1:	74 06                	je     4c9 <printf+0xa4>
 4c3:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4c7:	75 1e                	jne    4e7 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 4c9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4cc:	8b 00                	mov    (%eax),%eax
 4ce:	6a 00                	push   $0x0
 4d0:	6a 10                	push   $0x10
 4d2:	50                   	push   %eax
 4d3:	ff 75 08             	pushl  0x8(%ebp)
 4d6:	e8 9a fe ff ff       	call   375 <printint>
 4db:	83 c4 10             	add    $0x10,%esp
        ap++;
 4de:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4e2:	e9 ae 00 00 00       	jmp    595 <printf+0x170>
      } else if(c == 's'){
 4e7:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 4eb:	75 43                	jne    530 <printf+0x10b>
        s = (char*)*ap;
 4ed:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4f0:	8b 00                	mov    (%eax),%eax
 4f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 4f5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 4f9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4fd:	75 25                	jne    524 <printf+0xff>
          s = "(null)";
 4ff:	c7 45 f4 8f 08 00 00 	movl   $0x88f,-0xc(%ebp)
        while(*s != 0){
 506:	eb 1c                	jmp    524 <printf+0xff>
          putc(fd, *s);
 508:	8b 45 f4             	mov    -0xc(%ebp),%eax
 50b:	0f b6 00             	movzbl (%eax),%eax
 50e:	0f be c0             	movsbl %al,%eax
 511:	83 ec 08             	sub    $0x8,%esp
 514:	50                   	push   %eax
 515:	ff 75 08             	pushl  0x8(%ebp)
 518:	e8 35 fe ff ff       	call   352 <putc>
 51d:	83 c4 10             	add    $0x10,%esp
          s++;
 520:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 524:	8b 45 f4             	mov    -0xc(%ebp),%eax
 527:	0f b6 00             	movzbl (%eax),%eax
 52a:	84 c0                	test   %al,%al
 52c:	75 da                	jne    508 <printf+0xe3>
 52e:	eb 65                	jmp    595 <printf+0x170>
        }
      } else if(c == 'c'){
 530:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 534:	75 1d                	jne    553 <printf+0x12e>
        putc(fd, *ap);
 536:	8b 45 e8             	mov    -0x18(%ebp),%eax
 539:	8b 00                	mov    (%eax),%eax
 53b:	0f be c0             	movsbl %al,%eax
 53e:	83 ec 08             	sub    $0x8,%esp
 541:	50                   	push   %eax
 542:	ff 75 08             	pushl  0x8(%ebp)
 545:	e8 08 fe ff ff       	call   352 <putc>
 54a:	83 c4 10             	add    $0x10,%esp
        ap++;
 54d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 551:	eb 42                	jmp    595 <printf+0x170>
      } else if(c == '%'){
 553:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 557:	75 17                	jne    570 <printf+0x14b>
        putc(fd, c);
 559:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 55c:	0f be c0             	movsbl %al,%eax
 55f:	83 ec 08             	sub    $0x8,%esp
 562:	50                   	push   %eax
 563:	ff 75 08             	pushl  0x8(%ebp)
 566:	e8 e7 fd ff ff       	call   352 <putc>
 56b:	83 c4 10             	add    $0x10,%esp
 56e:	eb 25                	jmp    595 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 570:	83 ec 08             	sub    $0x8,%esp
 573:	6a 25                	push   $0x25
 575:	ff 75 08             	pushl  0x8(%ebp)
 578:	e8 d5 fd ff ff       	call   352 <putc>
 57d:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 580:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 583:	0f be c0             	movsbl %al,%eax
 586:	83 ec 08             	sub    $0x8,%esp
 589:	50                   	push   %eax
 58a:	ff 75 08             	pushl  0x8(%ebp)
 58d:	e8 c0 fd ff ff       	call   352 <putc>
 592:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 595:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 59c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5a0:	8b 55 0c             	mov    0xc(%ebp),%edx
 5a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5a6:	01 d0                	add    %edx,%eax
 5a8:	0f b6 00             	movzbl (%eax),%eax
 5ab:	84 c0                	test   %al,%al
 5ad:	0f 85 94 fe ff ff    	jne    447 <printf+0x22>
    }
  }
}
 5b3:	90                   	nop
 5b4:	c9                   	leave  
 5b5:	c3                   	ret    

000005b6 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5b6:	55                   	push   %ebp
 5b7:	89 e5                	mov    %esp,%ebp
 5b9:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5bc:	8b 45 08             	mov    0x8(%ebp),%eax
 5bf:	83 e8 08             	sub    $0x8,%eax
 5c2:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5c5:	a1 48 0b 00 00       	mov    0xb48,%eax
 5ca:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5cd:	eb 24                	jmp    5f3 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5d2:	8b 00                	mov    (%eax),%eax
 5d4:	39 45 fc             	cmp    %eax,-0x4(%ebp)
 5d7:	72 12                	jb     5eb <free+0x35>
 5d9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5dc:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5df:	77 24                	ja     605 <free+0x4f>
 5e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5e4:	8b 00                	mov    (%eax),%eax
 5e6:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 5e9:	72 1a                	jb     605 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5ee:	8b 00                	mov    (%eax),%eax
 5f0:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5f3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5f6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5f9:	76 d4                	jbe    5cf <free+0x19>
 5fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5fe:	8b 00                	mov    (%eax),%eax
 600:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 603:	73 ca                	jae    5cf <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 605:	8b 45 f8             	mov    -0x8(%ebp),%eax
 608:	8b 40 04             	mov    0x4(%eax),%eax
 60b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 612:	8b 45 f8             	mov    -0x8(%ebp),%eax
 615:	01 c2                	add    %eax,%edx
 617:	8b 45 fc             	mov    -0x4(%ebp),%eax
 61a:	8b 00                	mov    (%eax),%eax
 61c:	39 c2                	cmp    %eax,%edx
 61e:	75 24                	jne    644 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 620:	8b 45 f8             	mov    -0x8(%ebp),%eax
 623:	8b 50 04             	mov    0x4(%eax),%edx
 626:	8b 45 fc             	mov    -0x4(%ebp),%eax
 629:	8b 00                	mov    (%eax),%eax
 62b:	8b 40 04             	mov    0x4(%eax),%eax
 62e:	01 c2                	add    %eax,%edx
 630:	8b 45 f8             	mov    -0x8(%ebp),%eax
 633:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 636:	8b 45 fc             	mov    -0x4(%ebp),%eax
 639:	8b 00                	mov    (%eax),%eax
 63b:	8b 10                	mov    (%eax),%edx
 63d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 640:	89 10                	mov    %edx,(%eax)
 642:	eb 0a                	jmp    64e <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 644:	8b 45 fc             	mov    -0x4(%ebp),%eax
 647:	8b 10                	mov    (%eax),%edx
 649:	8b 45 f8             	mov    -0x8(%ebp),%eax
 64c:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 64e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 651:	8b 40 04             	mov    0x4(%eax),%eax
 654:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 65b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 65e:	01 d0                	add    %edx,%eax
 660:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 663:	75 20                	jne    685 <free+0xcf>
    p->s.size += bp->s.size;
 665:	8b 45 fc             	mov    -0x4(%ebp),%eax
 668:	8b 50 04             	mov    0x4(%eax),%edx
 66b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 66e:	8b 40 04             	mov    0x4(%eax),%eax
 671:	01 c2                	add    %eax,%edx
 673:	8b 45 fc             	mov    -0x4(%ebp),%eax
 676:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 679:	8b 45 f8             	mov    -0x8(%ebp),%eax
 67c:	8b 10                	mov    (%eax),%edx
 67e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 681:	89 10                	mov    %edx,(%eax)
 683:	eb 08                	jmp    68d <free+0xd7>
  } else
    p->s.ptr = bp;
 685:	8b 45 fc             	mov    -0x4(%ebp),%eax
 688:	8b 55 f8             	mov    -0x8(%ebp),%edx
 68b:	89 10                	mov    %edx,(%eax)
  freep = p;
 68d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 690:	a3 48 0b 00 00       	mov    %eax,0xb48
}
 695:	90                   	nop
 696:	c9                   	leave  
 697:	c3                   	ret    

00000698 <morecore>:

static Header*
morecore(uint nu)
{
 698:	55                   	push   %ebp
 699:	89 e5                	mov    %esp,%ebp
 69b:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 69e:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6a5:	77 07                	ja     6ae <morecore+0x16>
    nu = 4096;
 6a7:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6ae:	8b 45 08             	mov    0x8(%ebp),%eax
 6b1:	c1 e0 03             	shl    $0x3,%eax
 6b4:	83 ec 0c             	sub    $0xc,%esp
 6b7:	50                   	push   %eax
 6b8:	e8 3d fc ff ff       	call   2fa <sbrk>
 6bd:	83 c4 10             	add    $0x10,%esp
 6c0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6c3:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6c7:	75 07                	jne    6d0 <morecore+0x38>
    return 0;
 6c9:	b8 00 00 00 00       	mov    $0x0,%eax
 6ce:	eb 26                	jmp    6f6 <morecore+0x5e>
  hp = (Header*)p;
 6d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 6d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6d9:	8b 55 08             	mov    0x8(%ebp),%edx
 6dc:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 6df:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6e2:	83 c0 08             	add    $0x8,%eax
 6e5:	83 ec 0c             	sub    $0xc,%esp
 6e8:	50                   	push   %eax
 6e9:	e8 c8 fe ff ff       	call   5b6 <free>
 6ee:	83 c4 10             	add    $0x10,%esp
  return freep;
 6f1:	a1 48 0b 00 00       	mov    0xb48,%eax
}
 6f6:	c9                   	leave  
 6f7:	c3                   	ret    

000006f8 <malloc>:

void*
malloc(uint nbytes)
{
 6f8:	55                   	push   %ebp
 6f9:	89 e5                	mov    %esp,%ebp
 6fb:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6fe:	8b 45 08             	mov    0x8(%ebp),%eax
 701:	83 c0 07             	add    $0x7,%eax
 704:	c1 e8 03             	shr    $0x3,%eax
 707:	83 c0 01             	add    $0x1,%eax
 70a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 70d:	a1 48 0b 00 00       	mov    0xb48,%eax
 712:	89 45 f0             	mov    %eax,-0x10(%ebp)
 715:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 719:	75 23                	jne    73e <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 71b:	c7 45 f0 40 0b 00 00 	movl   $0xb40,-0x10(%ebp)
 722:	8b 45 f0             	mov    -0x10(%ebp),%eax
 725:	a3 48 0b 00 00       	mov    %eax,0xb48
 72a:	a1 48 0b 00 00       	mov    0xb48,%eax
 72f:	a3 40 0b 00 00       	mov    %eax,0xb40
    base.s.size = 0;
 734:	c7 05 44 0b 00 00 00 	movl   $0x0,0xb44
 73b:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 73e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 741:	8b 00                	mov    (%eax),%eax
 743:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 746:	8b 45 f4             	mov    -0xc(%ebp),%eax
 749:	8b 40 04             	mov    0x4(%eax),%eax
 74c:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 74f:	77 4d                	ja     79e <malloc+0xa6>
      if(p->s.size == nunits)
 751:	8b 45 f4             	mov    -0xc(%ebp),%eax
 754:	8b 40 04             	mov    0x4(%eax),%eax
 757:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 75a:	75 0c                	jne    768 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 75c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 75f:	8b 10                	mov    (%eax),%edx
 761:	8b 45 f0             	mov    -0x10(%ebp),%eax
 764:	89 10                	mov    %edx,(%eax)
 766:	eb 26                	jmp    78e <malloc+0x96>
      else {
        p->s.size -= nunits;
 768:	8b 45 f4             	mov    -0xc(%ebp),%eax
 76b:	8b 40 04             	mov    0x4(%eax),%eax
 76e:	2b 45 ec             	sub    -0x14(%ebp),%eax
 771:	89 c2                	mov    %eax,%edx
 773:	8b 45 f4             	mov    -0xc(%ebp),%eax
 776:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 779:	8b 45 f4             	mov    -0xc(%ebp),%eax
 77c:	8b 40 04             	mov    0x4(%eax),%eax
 77f:	c1 e0 03             	shl    $0x3,%eax
 782:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 785:	8b 45 f4             	mov    -0xc(%ebp),%eax
 788:	8b 55 ec             	mov    -0x14(%ebp),%edx
 78b:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 78e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 791:	a3 48 0b 00 00       	mov    %eax,0xb48
      return (void*)(p + 1);
 796:	8b 45 f4             	mov    -0xc(%ebp),%eax
 799:	83 c0 08             	add    $0x8,%eax
 79c:	eb 3b                	jmp    7d9 <malloc+0xe1>
    }
    if(p == freep)
 79e:	a1 48 0b 00 00       	mov    0xb48,%eax
 7a3:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7a6:	75 1e                	jne    7c6 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 7a8:	83 ec 0c             	sub    $0xc,%esp
 7ab:	ff 75 ec             	pushl  -0x14(%ebp)
 7ae:	e8 e5 fe ff ff       	call   698 <morecore>
 7b3:	83 c4 10             	add    $0x10,%esp
 7b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7b9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7bd:	75 07                	jne    7c6 <malloc+0xce>
        return 0;
 7bf:	b8 00 00 00 00       	mov    $0x0,%eax
 7c4:	eb 13                	jmp    7d9 <malloc+0xe1>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c9:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7cf:	8b 00                	mov    (%eax),%eax
 7d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7d4:	e9 6d ff ff ff       	jmp    746 <malloc+0x4e>
  }
}
 7d9:	c9                   	leave  
 7da:	c3                   	ret    

000007db <hufs_thread_create>:

int thread_num = 0;


int hufs_thread_create(void *func(), void *args)
{
 7db:	55                   	push   %ebp
 7dc:	89 e5                	mov    %esp,%ebp
 7de:	83 ec 18             	sub    $0x18,%esp
	void *stack; 
	int pid;

	stack = malloc(4096);
 7e1:	83 ec 0c             	sub    $0xc,%esp
 7e4:	68 00 10 00 00       	push   $0x1000
 7e9:	e8 0a ff ff ff       	call   6f8 <malloc>
 7ee:	83 c4 10             	add    $0x10,%esp
 7f1:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (stack==0) return -1;
 7f4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7f8:	75 07                	jne    801 <hufs_thread_create+0x26>
 7fa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 7ff:	eb 42                	jmp    843 <hufs_thread_create+0x68>

	pid = clone(func, args, stack); 
 801:	83 ec 04             	sub    $0x4,%esp
 804:	ff 75 f4             	pushl  -0xc(%ebp)
 807:	ff 75 0c             	pushl  0xc(%ebp)
 80a:	ff 75 08             	pushl  0x8(%ebp)
 80d:	e8 30 fb ff ff       	call   342 <clone>
 812:	83 c4 10             	add    $0x10,%esp
 815:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (pid==-1) {
 818:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 81c:	75 15                	jne    833 <hufs_thread_create+0x58>
		free(stack);
 81e:	83 ec 0c             	sub    $0xc,%esp
 821:	ff 75 f4             	pushl  -0xc(%ebp)
 824:	e8 8d fd ff ff       	call   5b6 <free>
 829:	83 c4 10             	add    $0x10,%esp
		return -1;
 82c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 831:	eb 10                	jmp    843 <hufs_thread_create+0x68>
	}

	thread_info[pid].stack = stack; 
 833:	8b 45 f0             	mov    -0x10(%ebp),%eax
 836:	8b 55 f4             	mov    -0xc(%ebp),%edx
 839:	89 14 85 60 0b 00 00 	mov    %edx,0xb60(,%eax,4)

	return pid; 
 840:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 843:	c9                   	leave  
 844:	c3                   	ret    

00000845 <hufs_thread_join>:

int hufs_thread_join(int pid)
{
 845:	55                   	push   %ebp
 846:	89 e5                	mov    %esp,%ebp
 848:	83 ec 18             	sub    $0x18,%esp
	void *stack = thread_info[pid].stack;
 84b:	8b 45 08             	mov    0x8(%ebp),%eax
 84e:	8b 04 85 60 0b 00 00 	mov    0xb60(,%eax,4),%eax
 855:	89 45 f4             	mov    %eax,-0xc(%ebp)

	if (stack==0) return -1;
 858:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 85c:	75 07                	jne    865 <hufs_thread_join+0x20>
 85e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 863:	eb 28                	jmp    88d <hufs_thread_join+0x48>

	join(&thread_info[pid].stack);	
 865:	8b 45 08             	mov    0x8(%ebp),%eax
 868:	c1 e0 02             	shl    $0x2,%eax
 86b:	05 60 0b 00 00       	add    $0xb60,%eax
 870:	83 ec 0c             	sub    $0xc,%esp
 873:	50                   	push   %eax
 874:	e8 d1 fa ff ff       	call   34a <join>
 879:	83 c4 10             	add    $0x10,%esp
	free(stack);
 87c:	83 ec 0c             	sub    $0xc,%esp
 87f:	ff 75 f4             	pushl  -0xc(%ebp)
 882:	e8 2f fd ff ff       	call   5b6 <free>
 887:	83 c4 10             	add    $0x10,%esp

	return pid;
 88a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 88d:	c9                   	leave  
 88e:	c3                   	ret    

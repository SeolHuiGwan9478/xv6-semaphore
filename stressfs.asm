
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	81 ec 24 02 00 00    	sub    $0x224,%esp
  int fd, i;
  char path[] = "stressfs0";
  14:	c7 45 e6 73 74 72 65 	movl   $0x65727473,-0x1a(%ebp)
  1b:	c7 45 ea 73 73 66 73 	movl   $0x73667373,-0x16(%ebp)
  22:	66 c7 45 ee 30 00    	movw   $0x30,-0x12(%ebp)
  char data[512];

  printf(1, "stressfs starting\n");
  28:	83 ec 08             	sub    $0x8,%esp
  2b:	68 c6 09 00 00       	push   $0x9c6
  30:	6a 01                	push   $0x1
  32:	e8 25 05 00 00       	call   55c <printf>
  37:	83 c4 10             	add    $0x10,%esp
  memset(data, 'a', sizeof(data));
  3a:	83 ec 04             	sub    $0x4,%esp
  3d:	68 00 02 00 00       	push   $0x200
  42:	6a 61                	push   $0x61
  44:	8d 85 e6 fd ff ff    	lea    -0x21a(%ebp),%eax
  4a:	50                   	push   %eax
  4b:	e8 be 01 00 00       	call   20e <memset>
  50:	83 c4 10             	add    $0x10,%esp

  for(i = 0; i < 4; i++)
  53:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  5a:	eb 0d                	jmp    69 <main+0x69>
    if(fork() > 0)
  5c:	e8 40 03 00 00       	call   3a1 <fork>
  61:	85 c0                	test   %eax,%eax
  63:	7f 0c                	jg     71 <main+0x71>
  for(i = 0; i < 4; i++)
  65:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  69:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
  6d:	7e ed                	jle    5c <main+0x5c>
  6f:	eb 01                	jmp    72 <main+0x72>
      break;
  71:	90                   	nop

  printf(1, "write %d\n", i);
  72:	83 ec 04             	sub    $0x4,%esp
  75:	ff 75 f4             	pushl  -0xc(%ebp)
  78:	68 d9 09 00 00       	push   $0x9d9
  7d:	6a 01                	push   $0x1
  7f:	e8 d8 04 00 00       	call   55c <printf>
  84:	83 c4 10             	add    $0x10,%esp

  path[8] += i;
  87:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
  8b:	89 c2                	mov    %eax,%edx
  8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  90:	01 d0                	add    %edx,%eax
  92:	88 45 ee             	mov    %al,-0x12(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  95:	83 ec 08             	sub    $0x8,%esp
  98:	68 02 02 00 00       	push   $0x202
  9d:	8d 45 e6             	lea    -0x1a(%ebp),%eax
  a0:	50                   	push   %eax
  a1:	e8 43 03 00 00       	call   3e9 <open>
  a6:	83 c4 10             	add    $0x10,%esp
  a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(i = 0; i < 20; i++)
  ac:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  b3:	eb 1e                	jmp    d3 <main+0xd3>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  b5:	83 ec 04             	sub    $0x4,%esp
  b8:	68 00 02 00 00       	push   $0x200
  bd:	8d 85 e6 fd ff ff    	lea    -0x21a(%ebp),%eax
  c3:	50                   	push   %eax
  c4:	ff 75 f0             	pushl  -0x10(%ebp)
  c7:	e8 fd 02 00 00       	call   3c9 <write>
  cc:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 20; i++)
  cf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  d3:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
  d7:	7e dc                	jle    b5 <main+0xb5>
  close(fd);
  d9:	83 ec 0c             	sub    $0xc,%esp
  dc:	ff 75 f0             	pushl  -0x10(%ebp)
  df:	e8 ed 02 00 00       	call   3d1 <close>
  e4:	83 c4 10             	add    $0x10,%esp

  printf(1, "read\n");
  e7:	83 ec 08             	sub    $0x8,%esp
  ea:	68 e3 09 00 00       	push   $0x9e3
  ef:	6a 01                	push   $0x1
  f1:	e8 66 04 00 00       	call   55c <printf>
  f6:	83 c4 10             	add    $0x10,%esp

  fd = open(path, O_RDONLY);
  f9:	83 ec 08             	sub    $0x8,%esp
  fc:	6a 00                	push   $0x0
  fe:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 101:	50                   	push   %eax
 102:	e8 e2 02 00 00       	call   3e9 <open>
 107:	83 c4 10             	add    $0x10,%esp
 10a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for (i = 0; i < 20; i++)
 10d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 114:	eb 1e                	jmp    134 <main+0x134>
    read(fd, data, sizeof(data));
 116:	83 ec 04             	sub    $0x4,%esp
 119:	68 00 02 00 00       	push   $0x200
 11e:	8d 85 e6 fd ff ff    	lea    -0x21a(%ebp),%eax
 124:	50                   	push   %eax
 125:	ff 75 f0             	pushl  -0x10(%ebp)
 128:	e8 94 02 00 00       	call   3c1 <read>
 12d:	83 c4 10             	add    $0x10,%esp
  for (i = 0; i < 20; i++)
 130:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 134:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
 138:	7e dc                	jle    116 <main+0x116>
  close(fd);
 13a:	83 ec 0c             	sub    $0xc,%esp
 13d:	ff 75 f0             	pushl  -0x10(%ebp)
 140:	e8 8c 02 00 00       	call   3d1 <close>
 145:	83 c4 10             	add    $0x10,%esp

  wait();
 148:	e8 64 02 00 00       	call   3b1 <wait>
  
  exit();
 14d:	e8 57 02 00 00       	call   3a9 <exit>

00000152 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 152:	55                   	push   %ebp
 153:	89 e5                	mov    %esp,%ebp
 155:	57                   	push   %edi
 156:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 157:	8b 4d 08             	mov    0x8(%ebp),%ecx
 15a:	8b 55 10             	mov    0x10(%ebp),%edx
 15d:	8b 45 0c             	mov    0xc(%ebp),%eax
 160:	89 cb                	mov    %ecx,%ebx
 162:	89 df                	mov    %ebx,%edi
 164:	89 d1                	mov    %edx,%ecx
 166:	fc                   	cld    
 167:	f3 aa                	rep stos %al,%es:(%edi)
 169:	89 ca                	mov    %ecx,%edx
 16b:	89 fb                	mov    %edi,%ebx
 16d:	89 5d 08             	mov    %ebx,0x8(%ebp)
 170:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 173:	90                   	nop
 174:	5b                   	pop    %ebx
 175:	5f                   	pop    %edi
 176:	5d                   	pop    %ebp
 177:	c3                   	ret    

00000178 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 178:	55                   	push   %ebp
 179:	89 e5                	mov    %esp,%ebp
 17b:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 17e:	8b 45 08             	mov    0x8(%ebp),%eax
 181:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 184:	90                   	nop
 185:	8b 55 0c             	mov    0xc(%ebp),%edx
 188:	8d 42 01             	lea    0x1(%edx),%eax
 18b:	89 45 0c             	mov    %eax,0xc(%ebp)
 18e:	8b 45 08             	mov    0x8(%ebp),%eax
 191:	8d 48 01             	lea    0x1(%eax),%ecx
 194:	89 4d 08             	mov    %ecx,0x8(%ebp)
 197:	0f b6 12             	movzbl (%edx),%edx
 19a:	88 10                	mov    %dl,(%eax)
 19c:	0f b6 00             	movzbl (%eax),%eax
 19f:	84 c0                	test   %al,%al
 1a1:	75 e2                	jne    185 <strcpy+0xd>
    ;
  return os;
 1a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1a6:	c9                   	leave  
 1a7:	c3                   	ret    

000001a8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1a8:	55                   	push   %ebp
 1a9:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 1ab:	eb 08                	jmp    1b5 <strcmp+0xd>
    p++, q++;
 1ad:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1b1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 1b5:	8b 45 08             	mov    0x8(%ebp),%eax
 1b8:	0f b6 00             	movzbl (%eax),%eax
 1bb:	84 c0                	test   %al,%al
 1bd:	74 10                	je     1cf <strcmp+0x27>
 1bf:	8b 45 08             	mov    0x8(%ebp),%eax
 1c2:	0f b6 10             	movzbl (%eax),%edx
 1c5:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c8:	0f b6 00             	movzbl (%eax),%eax
 1cb:	38 c2                	cmp    %al,%dl
 1cd:	74 de                	je     1ad <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 1cf:	8b 45 08             	mov    0x8(%ebp),%eax
 1d2:	0f b6 00             	movzbl (%eax),%eax
 1d5:	0f b6 d0             	movzbl %al,%edx
 1d8:	8b 45 0c             	mov    0xc(%ebp),%eax
 1db:	0f b6 00             	movzbl (%eax),%eax
 1de:	0f b6 c0             	movzbl %al,%eax
 1e1:	29 c2                	sub    %eax,%edx
 1e3:	89 d0                	mov    %edx,%eax
}
 1e5:	5d                   	pop    %ebp
 1e6:	c3                   	ret    

000001e7 <strlen>:

uint
strlen(char *s)
{
 1e7:	55                   	push   %ebp
 1e8:	89 e5                	mov    %esp,%ebp
 1ea:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1ed:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1f4:	eb 04                	jmp    1fa <strlen+0x13>
 1f6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1fa:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1fd:	8b 45 08             	mov    0x8(%ebp),%eax
 200:	01 d0                	add    %edx,%eax
 202:	0f b6 00             	movzbl (%eax),%eax
 205:	84 c0                	test   %al,%al
 207:	75 ed                	jne    1f6 <strlen+0xf>
    ;
  return n;
 209:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 20c:	c9                   	leave  
 20d:	c3                   	ret    

0000020e <memset>:

void*
memset(void *dst, int c, uint n)
{
 20e:	55                   	push   %ebp
 20f:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 211:	8b 45 10             	mov    0x10(%ebp),%eax
 214:	50                   	push   %eax
 215:	ff 75 0c             	pushl  0xc(%ebp)
 218:	ff 75 08             	pushl  0x8(%ebp)
 21b:	e8 32 ff ff ff       	call   152 <stosb>
 220:	83 c4 0c             	add    $0xc,%esp
  return dst;
 223:	8b 45 08             	mov    0x8(%ebp),%eax
}
 226:	c9                   	leave  
 227:	c3                   	ret    

00000228 <strchr>:

char*
strchr(const char *s, char c)
{
 228:	55                   	push   %ebp
 229:	89 e5                	mov    %esp,%ebp
 22b:	83 ec 04             	sub    $0x4,%esp
 22e:	8b 45 0c             	mov    0xc(%ebp),%eax
 231:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 234:	eb 14                	jmp    24a <strchr+0x22>
    if(*s == c)
 236:	8b 45 08             	mov    0x8(%ebp),%eax
 239:	0f b6 00             	movzbl (%eax),%eax
 23c:	38 45 fc             	cmp    %al,-0x4(%ebp)
 23f:	75 05                	jne    246 <strchr+0x1e>
      return (char*)s;
 241:	8b 45 08             	mov    0x8(%ebp),%eax
 244:	eb 13                	jmp    259 <strchr+0x31>
  for(; *s; s++)
 246:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 24a:	8b 45 08             	mov    0x8(%ebp),%eax
 24d:	0f b6 00             	movzbl (%eax),%eax
 250:	84 c0                	test   %al,%al
 252:	75 e2                	jne    236 <strchr+0xe>
  return 0;
 254:	b8 00 00 00 00       	mov    $0x0,%eax
}
 259:	c9                   	leave  
 25a:	c3                   	ret    

0000025b <gets>:

char*
gets(char *buf, int max)
{
 25b:	55                   	push   %ebp
 25c:	89 e5                	mov    %esp,%ebp
 25e:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 261:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 268:	eb 42                	jmp    2ac <gets+0x51>
    cc = read(0, &c, 1);
 26a:	83 ec 04             	sub    $0x4,%esp
 26d:	6a 01                	push   $0x1
 26f:	8d 45 ef             	lea    -0x11(%ebp),%eax
 272:	50                   	push   %eax
 273:	6a 00                	push   $0x0
 275:	e8 47 01 00 00       	call   3c1 <read>
 27a:	83 c4 10             	add    $0x10,%esp
 27d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 280:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 284:	7e 33                	jle    2b9 <gets+0x5e>
      break;
    buf[i++] = c;
 286:	8b 45 f4             	mov    -0xc(%ebp),%eax
 289:	8d 50 01             	lea    0x1(%eax),%edx
 28c:	89 55 f4             	mov    %edx,-0xc(%ebp)
 28f:	89 c2                	mov    %eax,%edx
 291:	8b 45 08             	mov    0x8(%ebp),%eax
 294:	01 c2                	add    %eax,%edx
 296:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 29a:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 29c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2a0:	3c 0a                	cmp    $0xa,%al
 2a2:	74 16                	je     2ba <gets+0x5f>
 2a4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2a8:	3c 0d                	cmp    $0xd,%al
 2aa:	74 0e                	je     2ba <gets+0x5f>
  for(i=0; i+1 < max; ){
 2ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2af:	83 c0 01             	add    $0x1,%eax
 2b2:	39 45 0c             	cmp    %eax,0xc(%ebp)
 2b5:	7f b3                	jg     26a <gets+0xf>
 2b7:	eb 01                	jmp    2ba <gets+0x5f>
      break;
 2b9:	90                   	nop
      break;
  }
  buf[i] = '\0';
 2ba:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2bd:	8b 45 08             	mov    0x8(%ebp),%eax
 2c0:	01 d0                	add    %edx,%eax
 2c2:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2c5:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c8:	c9                   	leave  
 2c9:	c3                   	ret    

000002ca <stat>:

int
stat(char *n, struct stat *st)
{
 2ca:	55                   	push   %ebp
 2cb:	89 e5                	mov    %esp,%ebp
 2cd:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2d0:	83 ec 08             	sub    $0x8,%esp
 2d3:	6a 00                	push   $0x0
 2d5:	ff 75 08             	pushl  0x8(%ebp)
 2d8:	e8 0c 01 00 00       	call   3e9 <open>
 2dd:	83 c4 10             	add    $0x10,%esp
 2e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2e3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2e7:	79 07                	jns    2f0 <stat+0x26>
    return -1;
 2e9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2ee:	eb 25                	jmp    315 <stat+0x4b>
  r = fstat(fd, st);
 2f0:	83 ec 08             	sub    $0x8,%esp
 2f3:	ff 75 0c             	pushl  0xc(%ebp)
 2f6:	ff 75 f4             	pushl  -0xc(%ebp)
 2f9:	e8 03 01 00 00       	call   401 <fstat>
 2fe:	83 c4 10             	add    $0x10,%esp
 301:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 304:	83 ec 0c             	sub    $0xc,%esp
 307:	ff 75 f4             	pushl  -0xc(%ebp)
 30a:	e8 c2 00 00 00       	call   3d1 <close>
 30f:	83 c4 10             	add    $0x10,%esp
  return r;
 312:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 315:	c9                   	leave  
 316:	c3                   	ret    

00000317 <atoi>:

int
atoi(const char *s)
{
 317:	55                   	push   %ebp
 318:	89 e5                	mov    %esp,%ebp
 31a:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 31d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 324:	eb 25                	jmp    34b <atoi+0x34>
    n = n*10 + *s++ - '0';
 326:	8b 55 fc             	mov    -0x4(%ebp),%edx
 329:	89 d0                	mov    %edx,%eax
 32b:	c1 e0 02             	shl    $0x2,%eax
 32e:	01 d0                	add    %edx,%eax
 330:	01 c0                	add    %eax,%eax
 332:	89 c1                	mov    %eax,%ecx
 334:	8b 45 08             	mov    0x8(%ebp),%eax
 337:	8d 50 01             	lea    0x1(%eax),%edx
 33a:	89 55 08             	mov    %edx,0x8(%ebp)
 33d:	0f b6 00             	movzbl (%eax),%eax
 340:	0f be c0             	movsbl %al,%eax
 343:	01 c8                	add    %ecx,%eax
 345:	83 e8 30             	sub    $0x30,%eax
 348:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 34b:	8b 45 08             	mov    0x8(%ebp),%eax
 34e:	0f b6 00             	movzbl (%eax),%eax
 351:	3c 2f                	cmp    $0x2f,%al
 353:	7e 0a                	jle    35f <atoi+0x48>
 355:	8b 45 08             	mov    0x8(%ebp),%eax
 358:	0f b6 00             	movzbl (%eax),%eax
 35b:	3c 39                	cmp    $0x39,%al
 35d:	7e c7                	jle    326 <atoi+0xf>
  return n;
 35f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 362:	c9                   	leave  
 363:	c3                   	ret    

00000364 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 364:	55                   	push   %ebp
 365:	89 e5                	mov    %esp,%ebp
 367:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 36a:	8b 45 08             	mov    0x8(%ebp),%eax
 36d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 370:	8b 45 0c             	mov    0xc(%ebp),%eax
 373:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 376:	eb 17                	jmp    38f <memmove+0x2b>
    *dst++ = *src++;
 378:	8b 55 f8             	mov    -0x8(%ebp),%edx
 37b:	8d 42 01             	lea    0x1(%edx),%eax
 37e:	89 45 f8             	mov    %eax,-0x8(%ebp)
 381:	8b 45 fc             	mov    -0x4(%ebp),%eax
 384:	8d 48 01             	lea    0x1(%eax),%ecx
 387:	89 4d fc             	mov    %ecx,-0x4(%ebp)
 38a:	0f b6 12             	movzbl (%edx),%edx
 38d:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 38f:	8b 45 10             	mov    0x10(%ebp),%eax
 392:	8d 50 ff             	lea    -0x1(%eax),%edx
 395:	89 55 10             	mov    %edx,0x10(%ebp)
 398:	85 c0                	test   %eax,%eax
 39a:	7f dc                	jg     378 <memmove+0x14>
  return vdst;
 39c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 39f:	c9                   	leave  
 3a0:	c3                   	ret    

000003a1 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3a1:	b8 01 00 00 00       	mov    $0x1,%eax
 3a6:	cd 40                	int    $0x40
 3a8:	c3                   	ret    

000003a9 <exit>:
SYSCALL(exit)
 3a9:	b8 02 00 00 00       	mov    $0x2,%eax
 3ae:	cd 40                	int    $0x40
 3b0:	c3                   	ret    

000003b1 <wait>:
SYSCALL(wait)
 3b1:	b8 03 00 00 00       	mov    $0x3,%eax
 3b6:	cd 40                	int    $0x40
 3b8:	c3                   	ret    

000003b9 <pipe>:
SYSCALL(pipe)
 3b9:	b8 04 00 00 00       	mov    $0x4,%eax
 3be:	cd 40                	int    $0x40
 3c0:	c3                   	ret    

000003c1 <read>:
SYSCALL(read)
 3c1:	b8 05 00 00 00       	mov    $0x5,%eax
 3c6:	cd 40                	int    $0x40
 3c8:	c3                   	ret    

000003c9 <write>:
SYSCALL(write)
 3c9:	b8 10 00 00 00       	mov    $0x10,%eax
 3ce:	cd 40                	int    $0x40
 3d0:	c3                   	ret    

000003d1 <close>:
SYSCALL(close)
 3d1:	b8 15 00 00 00       	mov    $0x15,%eax
 3d6:	cd 40                	int    $0x40
 3d8:	c3                   	ret    

000003d9 <kill>:
SYSCALL(kill)
 3d9:	b8 06 00 00 00       	mov    $0x6,%eax
 3de:	cd 40                	int    $0x40
 3e0:	c3                   	ret    

000003e1 <exec>:
SYSCALL(exec)
 3e1:	b8 07 00 00 00       	mov    $0x7,%eax
 3e6:	cd 40                	int    $0x40
 3e8:	c3                   	ret    

000003e9 <open>:
SYSCALL(open)
 3e9:	b8 0f 00 00 00       	mov    $0xf,%eax
 3ee:	cd 40                	int    $0x40
 3f0:	c3                   	ret    

000003f1 <mknod>:
SYSCALL(mknod)
 3f1:	b8 11 00 00 00       	mov    $0x11,%eax
 3f6:	cd 40                	int    $0x40
 3f8:	c3                   	ret    

000003f9 <unlink>:
SYSCALL(unlink)
 3f9:	b8 12 00 00 00       	mov    $0x12,%eax
 3fe:	cd 40                	int    $0x40
 400:	c3                   	ret    

00000401 <fstat>:
SYSCALL(fstat)
 401:	b8 08 00 00 00       	mov    $0x8,%eax
 406:	cd 40                	int    $0x40
 408:	c3                   	ret    

00000409 <link>:
SYSCALL(link)
 409:	b8 13 00 00 00       	mov    $0x13,%eax
 40e:	cd 40                	int    $0x40
 410:	c3                   	ret    

00000411 <mkdir>:
SYSCALL(mkdir)
 411:	b8 14 00 00 00       	mov    $0x14,%eax
 416:	cd 40                	int    $0x40
 418:	c3                   	ret    

00000419 <chdir>:
SYSCALL(chdir)
 419:	b8 09 00 00 00       	mov    $0x9,%eax
 41e:	cd 40                	int    $0x40
 420:	c3                   	ret    

00000421 <dup>:
SYSCALL(dup)
 421:	b8 0a 00 00 00       	mov    $0xa,%eax
 426:	cd 40                	int    $0x40
 428:	c3                   	ret    

00000429 <getpid>:
SYSCALL(getpid)
 429:	b8 0b 00 00 00       	mov    $0xb,%eax
 42e:	cd 40                	int    $0x40
 430:	c3                   	ret    

00000431 <sbrk>:
SYSCALL(sbrk)
 431:	b8 0c 00 00 00       	mov    $0xc,%eax
 436:	cd 40                	int    $0x40
 438:	c3                   	ret    

00000439 <sleep>:
SYSCALL(sleep)
 439:	b8 0d 00 00 00       	mov    $0xd,%eax
 43e:	cd 40                	int    $0x40
 440:	c3                   	ret    

00000441 <uptime>:
SYSCALL(uptime)
 441:	b8 0e 00 00 00       	mov    $0xe,%eax
 446:	cd 40                	int    $0x40
 448:	c3                   	ret    

00000449 <halt>:
SYSCALL(halt)
 449:	b8 16 00 00 00       	mov    $0x16,%eax
 44e:	cd 40                	int    $0x40
 450:	c3                   	ret    

00000451 <getnp>:
SYSCALL(getnp)
 451:	b8 17 00 00 00       	mov    $0x17,%eax
 456:	cd 40                	int    $0x40
 458:	c3                   	ret    

00000459 <sem_create>:
SYSCALL(sem_create)
 459:	b8 18 00 00 00       	mov    $0x18,%eax
 45e:	cd 40                	int    $0x40
 460:	c3                   	ret    

00000461 <sem_destroy>:
SYSCALL(sem_destroy)
 461:	b8 19 00 00 00       	mov    $0x19,%eax
 466:	cd 40                	int    $0x40
 468:	c3                   	ret    

00000469 <sem_wait>:
SYSCALL(sem_wait)
 469:	b8 1a 00 00 00       	mov    $0x1a,%eax
 46e:	cd 40                	int    $0x40
 470:	c3                   	ret    

00000471 <sem_signal>:
SYSCALL(sem_signal)
 471:	b8 1b 00 00 00       	mov    $0x1b,%eax
 476:	cd 40                	int    $0x40
 478:	c3                   	ret    

00000479 <clone>:
SYSCALL(clone)
 479:	b8 1c 00 00 00       	mov    $0x1c,%eax
 47e:	cd 40                	int    $0x40
 480:	c3                   	ret    

00000481 <join>:
SYSCALL(join)
 481:	b8 1d 00 00 00       	mov    $0x1d,%eax
 486:	cd 40                	int    $0x40
 488:	c3                   	ret    

00000489 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 489:	55                   	push   %ebp
 48a:	89 e5                	mov    %esp,%ebp
 48c:	83 ec 18             	sub    $0x18,%esp
 48f:	8b 45 0c             	mov    0xc(%ebp),%eax
 492:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 495:	83 ec 04             	sub    $0x4,%esp
 498:	6a 01                	push   $0x1
 49a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 49d:	50                   	push   %eax
 49e:	ff 75 08             	pushl  0x8(%ebp)
 4a1:	e8 23 ff ff ff       	call   3c9 <write>
 4a6:	83 c4 10             	add    $0x10,%esp
}
 4a9:	90                   	nop
 4aa:	c9                   	leave  
 4ab:	c3                   	ret    

000004ac <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4ac:	55                   	push   %ebp
 4ad:	89 e5                	mov    %esp,%ebp
 4af:	83 ec 28             	sub    $0x28,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4b2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4b9:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4bd:	74 17                	je     4d6 <printint+0x2a>
 4bf:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4c3:	79 11                	jns    4d6 <printint+0x2a>
    neg = 1;
 4c5:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4cc:	8b 45 0c             	mov    0xc(%ebp),%eax
 4cf:	f7 d8                	neg    %eax
 4d1:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4d4:	eb 06                	jmp    4dc <printint+0x30>
  } else {
    x = xx;
 4d6:	8b 45 0c             	mov    0xc(%ebp),%eax
 4d9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4dc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4e3:	8b 4d 10             	mov    0x10(%ebp),%ecx
 4e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4e9:	ba 00 00 00 00       	mov    $0x0,%edx
 4ee:	f7 f1                	div    %ecx
 4f0:	89 d1                	mov    %edx,%ecx
 4f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4f5:	8d 50 01             	lea    0x1(%eax),%edx
 4f8:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4fb:	0f b6 91 74 0c 00 00 	movzbl 0xc74(%ecx),%edx
 502:	88 54 05 dc          	mov    %dl,-0x24(%ebp,%eax,1)
  }while((x /= base) != 0);
 506:	8b 4d 10             	mov    0x10(%ebp),%ecx
 509:	8b 45 ec             	mov    -0x14(%ebp),%eax
 50c:	ba 00 00 00 00       	mov    $0x0,%edx
 511:	f7 f1                	div    %ecx
 513:	89 45 ec             	mov    %eax,-0x14(%ebp)
 516:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 51a:	75 c7                	jne    4e3 <printint+0x37>
  if(neg)
 51c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 520:	74 2d                	je     54f <printint+0xa3>
    buf[i++] = '-';
 522:	8b 45 f4             	mov    -0xc(%ebp),%eax
 525:	8d 50 01             	lea    0x1(%eax),%edx
 528:	89 55 f4             	mov    %edx,-0xc(%ebp)
 52b:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 530:	eb 1d                	jmp    54f <printint+0xa3>
    putc(fd, buf[i]);
 532:	8d 55 dc             	lea    -0x24(%ebp),%edx
 535:	8b 45 f4             	mov    -0xc(%ebp),%eax
 538:	01 d0                	add    %edx,%eax
 53a:	0f b6 00             	movzbl (%eax),%eax
 53d:	0f be c0             	movsbl %al,%eax
 540:	83 ec 08             	sub    $0x8,%esp
 543:	50                   	push   %eax
 544:	ff 75 08             	pushl  0x8(%ebp)
 547:	e8 3d ff ff ff       	call   489 <putc>
 54c:	83 c4 10             	add    $0x10,%esp
  while(--i >= 0)
 54f:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 553:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 557:	79 d9                	jns    532 <printint+0x86>
}
 559:	90                   	nop
 55a:	c9                   	leave  
 55b:	c3                   	ret    

0000055c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 55c:	55                   	push   %ebp
 55d:	89 e5                	mov    %esp,%ebp
 55f:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 562:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 569:	8d 45 0c             	lea    0xc(%ebp),%eax
 56c:	83 c0 04             	add    $0x4,%eax
 56f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 572:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 579:	e9 59 01 00 00       	jmp    6d7 <printf+0x17b>
    c = fmt[i] & 0xff;
 57e:	8b 55 0c             	mov    0xc(%ebp),%edx
 581:	8b 45 f0             	mov    -0x10(%ebp),%eax
 584:	01 d0                	add    %edx,%eax
 586:	0f b6 00             	movzbl (%eax),%eax
 589:	0f be c0             	movsbl %al,%eax
 58c:	25 ff 00 00 00       	and    $0xff,%eax
 591:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 594:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 598:	75 2c                	jne    5c6 <printf+0x6a>
      if(c == '%'){
 59a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 59e:	75 0c                	jne    5ac <printf+0x50>
        state = '%';
 5a0:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5a7:	e9 27 01 00 00       	jmp    6d3 <printf+0x177>
      } else {
        putc(fd, c);
 5ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5af:	0f be c0             	movsbl %al,%eax
 5b2:	83 ec 08             	sub    $0x8,%esp
 5b5:	50                   	push   %eax
 5b6:	ff 75 08             	pushl  0x8(%ebp)
 5b9:	e8 cb fe ff ff       	call   489 <putc>
 5be:	83 c4 10             	add    $0x10,%esp
 5c1:	e9 0d 01 00 00       	jmp    6d3 <printf+0x177>
      }
    } else if(state == '%'){
 5c6:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5ca:	0f 85 03 01 00 00    	jne    6d3 <printf+0x177>
      if(c == 'd'){
 5d0:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5d4:	75 1e                	jne    5f4 <printf+0x98>
        printint(fd, *ap, 10, 1);
 5d6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5d9:	8b 00                	mov    (%eax),%eax
 5db:	6a 01                	push   $0x1
 5dd:	6a 0a                	push   $0xa
 5df:	50                   	push   %eax
 5e0:	ff 75 08             	pushl  0x8(%ebp)
 5e3:	e8 c4 fe ff ff       	call   4ac <printint>
 5e8:	83 c4 10             	add    $0x10,%esp
        ap++;
 5eb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5ef:	e9 d8 00 00 00       	jmp    6cc <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 5f4:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5f8:	74 06                	je     600 <printf+0xa4>
 5fa:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5fe:	75 1e                	jne    61e <printf+0xc2>
        printint(fd, *ap, 16, 0);
 600:	8b 45 e8             	mov    -0x18(%ebp),%eax
 603:	8b 00                	mov    (%eax),%eax
 605:	6a 00                	push   $0x0
 607:	6a 10                	push   $0x10
 609:	50                   	push   %eax
 60a:	ff 75 08             	pushl  0x8(%ebp)
 60d:	e8 9a fe ff ff       	call   4ac <printint>
 612:	83 c4 10             	add    $0x10,%esp
        ap++;
 615:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 619:	e9 ae 00 00 00       	jmp    6cc <printf+0x170>
      } else if(c == 's'){
 61e:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 622:	75 43                	jne    667 <printf+0x10b>
        s = (char*)*ap;
 624:	8b 45 e8             	mov    -0x18(%ebp),%eax
 627:	8b 00                	mov    (%eax),%eax
 629:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 62c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 630:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 634:	75 25                	jne    65b <printf+0xff>
          s = "(null)";
 636:	c7 45 f4 e9 09 00 00 	movl   $0x9e9,-0xc(%ebp)
        while(*s != 0){
 63d:	eb 1c                	jmp    65b <printf+0xff>
          putc(fd, *s);
 63f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 642:	0f b6 00             	movzbl (%eax),%eax
 645:	0f be c0             	movsbl %al,%eax
 648:	83 ec 08             	sub    $0x8,%esp
 64b:	50                   	push   %eax
 64c:	ff 75 08             	pushl  0x8(%ebp)
 64f:	e8 35 fe ff ff       	call   489 <putc>
 654:	83 c4 10             	add    $0x10,%esp
          s++;
 657:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 65b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 65e:	0f b6 00             	movzbl (%eax),%eax
 661:	84 c0                	test   %al,%al
 663:	75 da                	jne    63f <printf+0xe3>
 665:	eb 65                	jmp    6cc <printf+0x170>
        }
      } else if(c == 'c'){
 667:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 66b:	75 1d                	jne    68a <printf+0x12e>
        putc(fd, *ap);
 66d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 670:	8b 00                	mov    (%eax),%eax
 672:	0f be c0             	movsbl %al,%eax
 675:	83 ec 08             	sub    $0x8,%esp
 678:	50                   	push   %eax
 679:	ff 75 08             	pushl  0x8(%ebp)
 67c:	e8 08 fe ff ff       	call   489 <putc>
 681:	83 c4 10             	add    $0x10,%esp
        ap++;
 684:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 688:	eb 42                	jmp    6cc <printf+0x170>
      } else if(c == '%'){
 68a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 68e:	75 17                	jne    6a7 <printf+0x14b>
        putc(fd, c);
 690:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 693:	0f be c0             	movsbl %al,%eax
 696:	83 ec 08             	sub    $0x8,%esp
 699:	50                   	push   %eax
 69a:	ff 75 08             	pushl  0x8(%ebp)
 69d:	e8 e7 fd ff ff       	call   489 <putc>
 6a2:	83 c4 10             	add    $0x10,%esp
 6a5:	eb 25                	jmp    6cc <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6a7:	83 ec 08             	sub    $0x8,%esp
 6aa:	6a 25                	push   $0x25
 6ac:	ff 75 08             	pushl  0x8(%ebp)
 6af:	e8 d5 fd ff ff       	call   489 <putc>
 6b4:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 6b7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6ba:	0f be c0             	movsbl %al,%eax
 6bd:	83 ec 08             	sub    $0x8,%esp
 6c0:	50                   	push   %eax
 6c1:	ff 75 08             	pushl  0x8(%ebp)
 6c4:	e8 c0 fd ff ff       	call   489 <putc>
 6c9:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 6cc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 6d3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6d7:	8b 55 0c             	mov    0xc(%ebp),%edx
 6da:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6dd:	01 d0                	add    %edx,%eax
 6df:	0f b6 00             	movzbl (%eax),%eax
 6e2:	84 c0                	test   %al,%al
 6e4:	0f 85 94 fe ff ff    	jne    57e <printf+0x22>
    }
  }
}
 6ea:	90                   	nop
 6eb:	c9                   	leave  
 6ec:	c3                   	ret    

000006ed <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6ed:	55                   	push   %ebp
 6ee:	89 e5                	mov    %esp,%ebp
 6f0:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6f3:	8b 45 08             	mov    0x8(%ebp),%eax
 6f6:	83 e8 08             	sub    $0x8,%eax
 6f9:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6fc:	a1 a8 0c 00 00       	mov    0xca8,%eax
 701:	89 45 fc             	mov    %eax,-0x4(%ebp)
 704:	eb 24                	jmp    72a <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 706:	8b 45 fc             	mov    -0x4(%ebp),%eax
 709:	8b 00                	mov    (%eax),%eax
 70b:	39 45 fc             	cmp    %eax,-0x4(%ebp)
 70e:	72 12                	jb     722 <free+0x35>
 710:	8b 45 f8             	mov    -0x8(%ebp),%eax
 713:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 716:	77 24                	ja     73c <free+0x4f>
 718:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71b:	8b 00                	mov    (%eax),%eax
 71d:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 720:	72 1a                	jb     73c <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 722:	8b 45 fc             	mov    -0x4(%ebp),%eax
 725:	8b 00                	mov    (%eax),%eax
 727:	89 45 fc             	mov    %eax,-0x4(%ebp)
 72a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 72d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 730:	76 d4                	jbe    706 <free+0x19>
 732:	8b 45 fc             	mov    -0x4(%ebp),%eax
 735:	8b 00                	mov    (%eax),%eax
 737:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 73a:	73 ca                	jae    706 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 73c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 73f:	8b 40 04             	mov    0x4(%eax),%eax
 742:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 749:	8b 45 f8             	mov    -0x8(%ebp),%eax
 74c:	01 c2                	add    %eax,%edx
 74e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 751:	8b 00                	mov    (%eax),%eax
 753:	39 c2                	cmp    %eax,%edx
 755:	75 24                	jne    77b <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 757:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75a:	8b 50 04             	mov    0x4(%eax),%edx
 75d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 760:	8b 00                	mov    (%eax),%eax
 762:	8b 40 04             	mov    0x4(%eax),%eax
 765:	01 c2                	add    %eax,%edx
 767:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76a:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 76d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 770:	8b 00                	mov    (%eax),%eax
 772:	8b 10                	mov    (%eax),%edx
 774:	8b 45 f8             	mov    -0x8(%ebp),%eax
 777:	89 10                	mov    %edx,(%eax)
 779:	eb 0a                	jmp    785 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 77b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77e:	8b 10                	mov    (%eax),%edx
 780:	8b 45 f8             	mov    -0x8(%ebp),%eax
 783:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 785:	8b 45 fc             	mov    -0x4(%ebp),%eax
 788:	8b 40 04             	mov    0x4(%eax),%eax
 78b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 792:	8b 45 fc             	mov    -0x4(%ebp),%eax
 795:	01 d0                	add    %edx,%eax
 797:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 79a:	75 20                	jne    7bc <free+0xcf>
    p->s.size += bp->s.size;
 79c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79f:	8b 50 04             	mov    0x4(%eax),%edx
 7a2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a5:	8b 40 04             	mov    0x4(%eax),%eax
 7a8:	01 c2                	add    %eax,%edx
 7aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ad:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7b0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b3:	8b 10                	mov    (%eax),%edx
 7b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b8:	89 10                	mov    %edx,(%eax)
 7ba:	eb 08                	jmp    7c4 <free+0xd7>
  } else
    p->s.ptr = bp;
 7bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bf:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7c2:	89 10                	mov    %edx,(%eax)
  freep = p;
 7c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c7:	a3 a8 0c 00 00       	mov    %eax,0xca8
}
 7cc:	90                   	nop
 7cd:	c9                   	leave  
 7ce:	c3                   	ret    

000007cf <morecore>:

static Header*
morecore(uint nu)
{
 7cf:	55                   	push   %ebp
 7d0:	89 e5                	mov    %esp,%ebp
 7d2:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7d5:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7dc:	77 07                	ja     7e5 <morecore+0x16>
    nu = 4096;
 7de:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7e5:	8b 45 08             	mov    0x8(%ebp),%eax
 7e8:	c1 e0 03             	shl    $0x3,%eax
 7eb:	83 ec 0c             	sub    $0xc,%esp
 7ee:	50                   	push   %eax
 7ef:	e8 3d fc ff ff       	call   431 <sbrk>
 7f4:	83 c4 10             	add    $0x10,%esp
 7f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7fa:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7fe:	75 07                	jne    807 <morecore+0x38>
    return 0;
 800:	b8 00 00 00 00       	mov    $0x0,%eax
 805:	eb 26                	jmp    82d <morecore+0x5e>
  hp = (Header*)p;
 807:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 80d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 810:	8b 55 08             	mov    0x8(%ebp),%edx
 813:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 816:	8b 45 f0             	mov    -0x10(%ebp),%eax
 819:	83 c0 08             	add    $0x8,%eax
 81c:	83 ec 0c             	sub    $0xc,%esp
 81f:	50                   	push   %eax
 820:	e8 c8 fe ff ff       	call   6ed <free>
 825:	83 c4 10             	add    $0x10,%esp
  return freep;
 828:	a1 a8 0c 00 00       	mov    0xca8,%eax
}
 82d:	c9                   	leave  
 82e:	c3                   	ret    

0000082f <malloc>:

void*
malloc(uint nbytes)
{
 82f:	55                   	push   %ebp
 830:	89 e5                	mov    %esp,%ebp
 832:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 835:	8b 45 08             	mov    0x8(%ebp),%eax
 838:	83 c0 07             	add    $0x7,%eax
 83b:	c1 e8 03             	shr    $0x3,%eax
 83e:	83 c0 01             	add    $0x1,%eax
 841:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 844:	a1 a8 0c 00 00       	mov    0xca8,%eax
 849:	89 45 f0             	mov    %eax,-0x10(%ebp)
 84c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 850:	75 23                	jne    875 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 852:	c7 45 f0 a0 0c 00 00 	movl   $0xca0,-0x10(%ebp)
 859:	8b 45 f0             	mov    -0x10(%ebp),%eax
 85c:	a3 a8 0c 00 00       	mov    %eax,0xca8
 861:	a1 a8 0c 00 00       	mov    0xca8,%eax
 866:	a3 a0 0c 00 00       	mov    %eax,0xca0
    base.s.size = 0;
 86b:	c7 05 a4 0c 00 00 00 	movl   $0x0,0xca4
 872:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 875:	8b 45 f0             	mov    -0x10(%ebp),%eax
 878:	8b 00                	mov    (%eax),%eax
 87a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 87d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 880:	8b 40 04             	mov    0x4(%eax),%eax
 883:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 886:	77 4d                	ja     8d5 <malloc+0xa6>
      if(p->s.size == nunits)
 888:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88b:	8b 40 04             	mov    0x4(%eax),%eax
 88e:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 891:	75 0c                	jne    89f <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 893:	8b 45 f4             	mov    -0xc(%ebp),%eax
 896:	8b 10                	mov    (%eax),%edx
 898:	8b 45 f0             	mov    -0x10(%ebp),%eax
 89b:	89 10                	mov    %edx,(%eax)
 89d:	eb 26                	jmp    8c5 <malloc+0x96>
      else {
        p->s.size -= nunits;
 89f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a2:	8b 40 04             	mov    0x4(%eax),%eax
 8a5:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8a8:	89 c2                	mov    %eax,%edx
 8aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ad:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b3:	8b 40 04             	mov    0x4(%eax),%eax
 8b6:	c1 e0 03             	shl    $0x3,%eax
 8b9:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8bf:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8c2:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c8:	a3 a8 0c 00 00       	mov    %eax,0xca8
      return (void*)(p + 1);
 8cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d0:	83 c0 08             	add    $0x8,%eax
 8d3:	eb 3b                	jmp    910 <malloc+0xe1>
    }
    if(p == freep)
 8d5:	a1 a8 0c 00 00       	mov    0xca8,%eax
 8da:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8dd:	75 1e                	jne    8fd <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 8df:	83 ec 0c             	sub    $0xc,%esp
 8e2:	ff 75 ec             	pushl  -0x14(%ebp)
 8e5:	e8 e5 fe ff ff       	call   7cf <morecore>
 8ea:	83 c4 10             	add    $0x10,%esp
 8ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8f0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8f4:	75 07                	jne    8fd <malloc+0xce>
        return 0;
 8f6:	b8 00 00 00 00       	mov    $0x0,%eax
 8fb:	eb 13                	jmp    910 <malloc+0xe1>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 900:	89 45 f0             	mov    %eax,-0x10(%ebp)
 903:	8b 45 f4             	mov    -0xc(%ebp),%eax
 906:	8b 00                	mov    (%eax),%eax
 908:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 90b:	e9 6d ff ff ff       	jmp    87d <malloc+0x4e>
  }
}
 910:	c9                   	leave  
 911:	c3                   	ret    

00000912 <hufs_thread_create>:

int thread_num = 0;


int hufs_thread_create(void *func(), void *args)
{
 912:	55                   	push   %ebp
 913:	89 e5                	mov    %esp,%ebp
 915:	83 ec 18             	sub    $0x18,%esp
	void *stack; 
	int pid;

	stack = malloc(4096);
 918:	83 ec 0c             	sub    $0xc,%esp
 91b:	68 00 10 00 00       	push   $0x1000
 920:	e8 0a ff ff ff       	call   82f <malloc>
 925:	83 c4 10             	add    $0x10,%esp
 928:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if (stack==0) return -1;
 92b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 92f:	75 07                	jne    938 <hufs_thread_create+0x26>
 931:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 936:	eb 42                	jmp    97a <hufs_thread_create+0x68>

	pid = clone(func, args, stack); 
 938:	83 ec 04             	sub    $0x4,%esp
 93b:	ff 75 f4             	pushl  -0xc(%ebp)
 93e:	ff 75 0c             	pushl  0xc(%ebp)
 941:	ff 75 08             	pushl  0x8(%ebp)
 944:	e8 30 fb ff ff       	call   479 <clone>
 949:	83 c4 10             	add    $0x10,%esp
 94c:	89 45 f0             	mov    %eax,-0x10(%ebp)
	if (pid==-1) {
 94f:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 953:	75 15                	jne    96a <hufs_thread_create+0x58>
		free(stack);
 955:	83 ec 0c             	sub    $0xc,%esp
 958:	ff 75 f4             	pushl  -0xc(%ebp)
 95b:	e8 8d fd ff ff       	call   6ed <free>
 960:	83 c4 10             	add    $0x10,%esp
		return -1;
 963:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 968:	eb 10                	jmp    97a <hufs_thread_create+0x68>
	}

	thread_info[pid].stack = stack; 
 96a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 96d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 970:	89 14 85 c0 0c 00 00 	mov    %edx,0xcc0(,%eax,4)

	return pid; 
 977:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 97a:	c9                   	leave  
 97b:	c3                   	ret    

0000097c <hufs_thread_join>:

int hufs_thread_join(int pid)
{
 97c:	55                   	push   %ebp
 97d:	89 e5                	mov    %esp,%ebp
 97f:	83 ec 18             	sub    $0x18,%esp
	void *stack = thread_info[pid].stack;
 982:	8b 45 08             	mov    0x8(%ebp),%eax
 985:	8b 04 85 c0 0c 00 00 	mov    0xcc0(,%eax,4),%eax
 98c:	89 45 f4             	mov    %eax,-0xc(%ebp)

	if (stack==0) return -1;
 98f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 993:	75 07                	jne    99c <hufs_thread_join+0x20>
 995:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 99a:	eb 28                	jmp    9c4 <hufs_thread_join+0x48>

	join(&thread_info[pid].stack);	
 99c:	8b 45 08             	mov    0x8(%ebp),%eax
 99f:	c1 e0 02             	shl    $0x2,%eax
 9a2:	05 c0 0c 00 00       	add    $0xcc0,%eax
 9a7:	83 ec 0c             	sub    $0xc,%esp
 9aa:	50                   	push   %eax
 9ab:	e8 d1 fa ff ff       	call   481 <join>
 9b0:	83 c4 10             	add    $0x10,%esp
	free(stack);
 9b3:	83 ec 0c             	sub    $0xc,%esp
 9b6:	ff 75 f4             	pushl  -0xc(%ebp)
 9b9:	e8 2f fd ff ff       	call   6ed <free>
 9be:	83 c4 10             	add    $0x10,%esp

	return pid;
 9c1:	8b 45 08             	mov    0x8(%ebp),%eax
}
 9c4:	c9                   	leave  
 9c5:	c3                   	ret    

n = 4

a = []
for i in range(n):
    b = []
    for j in range(i*n,i*n+n):
        b.append(j)
    a.append(b[:])
print(a)
print()
for e in a:
    print(e)
x = []

if False:
    c = 1
    n -= 1
else:
    c = 2

for i in range(0,n,c):
    y = []
    for j in range(0,n,c):
        y.append(a[i][j]+a[i][j+1]+a[i+1][j]+a[i+1][j+1])
    x.append(y[:])
for t in x:
    print(t)
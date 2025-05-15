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
    c = 1

for i in range(0,n-1,c):
    y = []
    for j in range(0,n-1,c):
        y.append(a[i][j]+a[i][j+1]+a[i+1][j]+a[i+1][j+1])
    x.append(y[:])

print()
for t in x:
    print(t)

# 4*4 16
# 3*3 9 n^2+(n-1)^2 = n^2+n^2-2n+1 = 2*n^2 -2n +1
# 2*2 4 n^2+(n/2)^2 = n^2+n^2/4    = 1.25*n^2
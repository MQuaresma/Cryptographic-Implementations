︠43c9b9a0-c1b3-47c0-98a0-66f194c5beads︠
class RSA:
    def __init__(self, l):
        p = random_prime(2^(floor(l/2)))
        q = random_prime(2^(floor(l/2)))
        n = p*q
        m = (p-1)*(q-1)
        e = randint(2,n)
        while gcd(m,e)!=1:
            e = randint(2,m)
        d = power_mod(e,-1,m)
        self.pubkey = (n,e)
        self.privkey = d

    def cifra(self,x):
        n,e = self.pubkey
        y = power_mod(x,e,n)
        return y

    def decifra(self, y):
        d = self.privkey
        n,_=self.pubkey
        z = power_mod(y,d,n)
        return z

    def assina(self,x):
        y = power_mod(x,self.privkey,self.pubkey[0])
        return y

    def verifica(self,x, sig):
        x_k = power_mod(sig,self.pubkey[1],self.pubkey[0])
        return (x_k == x)
︡5cbca266-1ce2-41ed-a72c-7b0c9dbf1659︡{"done":true}
︠3ff41435-0604-4052-bff0-65fdec37f89es︠
R = RSA(16);
msg = 1234
criptograma = R.cifra(msg)
︡714c6433-8252-4e13-b097-64c0fff124d5︡{"done":true}
︠eca697ea-0899-4f4d-b0cf-7ced8cd1d282s︠
R.decifra(criptograma)
︡5bc552b6-bc6e-46bb-9a93-c65c632a5f8a︡{"stdout":"1234\n"}︡{"done":true}
︠3530c4f6-70f6-48c7-abdd-61d9c9b7c7e2s︠
sig = R.assina(msg); R.verifica(msg,sig)
︡0cc456f3-793d-44f1-a410-7b705920e6a3︡{"stdout":"True\n"}︡{"done":true}
︠19722d25-2014-4ad9-b03f-96b84ff1f517︠











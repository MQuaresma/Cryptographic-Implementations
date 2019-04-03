︠baa7f9fa-a58b-4531-9298-510458c4644fs︠
def __init__(n):
    K = GF(2^n);
    while True:
        b = K.random_element()
        E = EllipticCurve(K,[1,1,0,0,b]);
        m = E.order()
        lista_factores= list(factor(m))
        l = len(lista_factores)
        N = lista_factores[l-1][0]
        if N >= 2^(n-1):
            while True:
                P = E.random_element()
                Pord = P.order()
                if Pord > N:
                    h = Pord/N
                    Q = h * P
                    return P,Q
︡a9d5b6f6-447f-4c9b-9dcf-d0cb82133548︡{"done":true}
︠653f3c2c-cc67-4b8c-bed5-7051a1d276d3s︠
__init__(1)
︡dbc59c59-e04a-43d2-88c3-f572f6f4ec87︡{"stderr":"Error in lines 1-1\n"}︡{"stderr":"Traceback (most recent call last):\n  File \"/cocalc/lib/python2.7/site-packages/smc_sagews/sage_server.py\", line 1188, in execute\n    flags=compile_flags) in namespace, locals\n  File \"\", line 1, in <module>\n  File \"\", line 13, in __init__\n  File \"/ext/sage/sage-8.6_1804/local/lib/python2.7/site-packages/sage/schemes/elliptic_curves/ell_point.py\", line 3551, in order\n    return Integer(E.pari_curve().ellorder(self, ord))\n  File \"cypari2/auto_gen.pxi\", line 7504, in cypari2.gen.Gen_auto.ellorder\n  File \"cypari2/gen.pyx\", line 4996, in cypari2.gen.objtogen\n  File \"/ext/sage/sage-8.6_1804/local/lib/python2.7/site-packages/sage/schemes/elliptic_curves/ell_point.py\", line 431, in __pari__\n    return pari([self[0]/self[2], self[1]/self[2]])\n  File \"cypari2/pari_instance.pyx\", line 839, in cypari2.pari_instance.Pari.__call__\n  File \"cypari2/gen.pyx\", line 5028, in cypari2.gen.objtogen\n  File \"cypari2/gen.pyx\", line 4996, in cypari2.gen.objtogen\n  File \"sage/rings/finite_rings/integer_mod.pyx\", line 514, in sage.rings.finite_rings.integer_mod.IntegerMod_abstract.__pari__ (build/cythonized/sage/rings/finite_rings/integer_mod.c:7233)\n    return self.lift().__pari__().Mod(self.__modulus.sageInteger)\n  File \"cypari2/auto_gen.pxi\", line 196, in cypari2.gen.Gen_auto.Mod\nKeyboardInterrupt\n"}︡{"done":true}
︠89972b76-9a81-42e4-8627-ab68b9fadfd1︠
QQ.<x,y> = PolynomialRing(QQ,2)
phi = y^2 + x*y + x^3 + x^2 +b
︡0c368909-39e9-4120-bba7-ea26e5eed0d4︡{"done":true}
︠424633bf-0976-4114-9e90-b62a3aa697f5︠

︡c3967973-843f-473d-8553-7b963a7bfbca︡
︠853418fd-ac32-419c-a3aa-5549ee29bfc8︠
︡fe94a9e0-4aec-41b1-8403-6a3343f974f3︡
︠ce6e1b8c-b62e-47a6-80f3-ca0ea60fa6b3︠
P = E.random_point();P
︡805d7aa9-771f-4c31-95f1-0e8c8f991cb7︡{"stdout":"(571609279 : 1105047225 : 1)\n"}︡{"done":true}
︠aa9207cb-cb6d-4cff-8cad-49e53d7c76dcs︠
P.order()
︡e44917ad-8c36-4fa4-9f9c-42531fb13928︡{"stdout":"3992316807\n"}︡{"done":true}
︠54f342a1-09b5-4303-93d5-6dff5eac6a85s︠
# Alice escolhe kA
kA = randint(1,P.order());kA
︡e44fba3b-d9ec-42dd-a005-b2aeac49d6d8︡{"stdout":"1586766385\n"}︡{"done":true}
︠68c358ee-621c-420a-b0fc-a34d7a968871s︠
# Bob escolhe kB
kB = randint(1,P.order());kB
︡92cadf25-482d-4357-a103-e2272f16fa27︡{"stdout":"1697896763\n"}︡{"done":true}
︠8fc09575-0062-4638-9638-d78e7656e724s︠
# Alice calcula PA=kA*P; Bob calcula PB=kB*P
PA = kA*P
PB = kB*P
︡a75dbddc-31d4-4707-85fd-0739f2df6a13︡{"done":true}
︠06c083c0-a966-4d9d-8252-065d5b7e1007s︠
PA,PB
︡82668cda-9347-43c3-8621-cbb492fe5cff︡{"stdout":"((1296560852 : 547176082 : 1), (3823815818 : 3114464332 : 1))\n"}︡{"done":true}
︠22344a23-4c20-4476-8c3e-d1557d3b1b3as︠
#Alice calcula KA*PB; Bob calcula KB*PA
kA*PB == kB*PA
︡99bd941a-56e8-4cdc-a74e-41b8bff2e489︡{"stdout":"True\n"}︡{"done":true}
︠368befbb-d8b4-48ae-97ec-342935d426d3︠











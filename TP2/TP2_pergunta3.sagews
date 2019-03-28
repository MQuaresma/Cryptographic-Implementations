︠0a56b4c6-1a7c-4b05-ba53-4a2e46b83bacs︠
n = ZZ.random_element(0,256);n
︡cbc6cd4f-d245-47e1-b311-a8908f5b8273︡{"stdout":"134\n"}︡{"done":true}
︠66503811-a67b-4910-b1c9-c91a8d13f66ds︠
K = GF(2^n);K
︡f8d9adab-a4a4-4ef6-b873-fa30734d2e68︡{"stdout":"Finite Field in z134 of size 2^134"}︡{"stdout":"\n"}︡{"done":true}
︠619b4184-66a9-460f-a508-de2d72be5fdcs︠
b = 5
E = EllipticCurve(GF(2^n),[1,1,0,0,b]); E
︡712ec852-597e-4b04-849e-a9ff570f0ceb︡{"stdout":"Elliptic Curve defined by y^2 + x*y = x^3 + x^2 + 1 over Finite Field in z134 of size 2^134\n"}︡{"done":true}
︠ae7c4a26-30c7-401e-acc6-8183fa073809s︠
QQ.<x,y> = PolynomialRing(QQ,2)
phi = y^2 + x*y + x^3 + x^2 +b
︡0c368909-39e9-4120-bba7-ea26e5eed0d4︡{"done":true}
︠424633bf-0976-4114-9e90-b62a3aa697f5︠

︡c3967973-843f-473d-8553-7b963a7bfbca︡
︠853418fd-ac32-419c-a3aa-5549ee29bfc8s︠
E.order()
︡57c27faf-ff7e-440a-8fb7-3020fe2b01f7︡{"stdout":"3992316807\n"}︡{"done":true}
︠ce6e1b8c-b62e-47a6-80f3-ca0ea60fa6b3s︠
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










{\rtf1\ansi\ansicpg1252\cocoartf1671\cocoasubrtf200
{\fonttbl\f0\fmodern\fcharset0 Courier;\f1\fswiss\fcharset0 Helvetica;\f2\fnil\fcharset0 Menlo-Regular;
}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red27\green31\blue34;\red244\green246\blue249;
}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;\cssrgb\c14118\c16078\c18039;\cssrgb\c96471\c97255\c98039;
}
\paperw11900\paperh16840\margl1440\margr1440\vieww12300\viewh10640\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs26 \cf0 \expnd0\expndtw0\kerning0
# Aula TP - 11/Fev/2019\
\
Segue-se as respostas \'e0s perguntas dos exerc\'edcios propostos na aula que decorreu no dia 11 de Fevereiro de 2019.\
\
## Exerc\'edcios\
\
### 1\\. N\'fameros aleat\'f3rios/pseudoaleat\'f3rios\
\
\
#### Resposta \'e0 pergunta P1.1\
\
Ap\'f3s testar os comandos pedidos destaca-se, primeiramente, a diferen\'e7a entre os comandos `head -c 1024 /dev/random | openssl enc -base64` e `head -c 1024 /dev/urandom | openssl enc -base64`. \
\kerning1\expnd0\expndtw0 \
\expnd0\expndtw0\kerning0
\
Ao executar o primeiro comando notou-se que este n\'e3o mostra qualquer output no terminal. Ap\'f3s alguma pesquisa, verificou-se que tal deve-se \'e0 falta de entropia dispon\'edvel no sistema. Assim, quando o pool de entropia est\'e1 vazio, opera\'e7\'f5es de leitura s\'e3o bloqueadas at\'e9 que seja captado algum ru\'eddo adicional do ambiente, ficando o dispositivo at\'e9 l\'e1 \'e0 espera.\
\
J\'e1 o comando `head -c 1024 /dev/urandom | openssl enc -base64` n\'e3o \'e9 bloquedo, respondendo de forma imediata, pois o mesmo reutiliza o pool interno para produzir mais bits pseudo-aleat\'f3rios, o que \'e9 menos seguro, podendo este ser vulner\'e1vel a ataques criptogr\'e1ficos, contudo \'e9 bastante mais r\'e1pido que o anterior.\
\
\pard\pardeftab720\partightenfactor0
\cf0 Deste modo, apesar do `/dev/urandom` ser criptograficamente seguro, apenas deve ser considerado quando o desempenho obtido com o uso do `/dev/random/` n\'e3o satisfizer os requisitos pretendidos pela aplica\'e7\'e3o em causa.\
\pard\pardeftab720\partightenfactor0
\cf0 \
\pard\pardeftab708\ri182\partightenfactor0
\cf0 \kerning1\expnd0\expndtw0 Em rela\'e7\'e3o aos comandos em faltam, detentores de tamanhos de chaves menores que o primeiro comando aqui apresentado, observa-se que na execu\'e7\'e3o dos mesmos j\'e1 se obteve output. Note-se ainda que quanto maior o n\'famero de bytes que forem pedidos maior \'e9 a quantidade de tempo necess\'e1ria para gerar o valor pedido.\'a0\
\pard\pardeftab720\partightenfactor0
\cf0 \expnd0\expndtw0\kerning0
\
\
#### Resposta \'e0 pergunta P1.2\
\
O haveged - <http://www.issihosts.com/haveged/index.html> - \'e9 um daemon de entropia adaptado do algoritmo HAVEGE (_HArdware Volatile Entropy Gathering and Expansion_) - <http://www.irisa.fr/caps/projects/hipsor/> -, cujo objetivo passa por corrigir condi\'e7\'f5es de baixa entropia no dispositivo aleat\'f3rio do Linux. O uso do mesmo aumenta assim a entropia do gerador usando fontes adicionais baseadas em caracter\'edsticas do hardware atual.\
\
Com a instala\'e7\'e3o da a package haveged e ap\'f3s testar novamente os comandos `head -c 1024 /dev/random | openssl enc -base64` e `head -c 1024 /dev/urandom | openssl enc -base64`, observa-se que comando `/dev/random` j\'e1 apresenta output e que o tempo de execu\'e7\'e3o do outro comando diminui.\
\
#### Resposta \'e0 pergunta P1.3\
\
###1.\
\
Ao analisar o ficheiro *generateSecret-app.py* baseado no m\'f3dulo eVotUM.Cripto (https://gitlab.com/eVotUM/Cripto-py) observa-se que a fun\'e7\'e3o generateSecret recorre ao m\'f3dulo shamirsecret.py, e que  inicializa-se com um ciclo, seguido-se a gera\'e7\'e3o de \kerning1\expnd0\expndtw0 uma sequ\'eancia de\'a0bytes pseudoaleat\'f3rios. Depois, a mesma verifica se cada um dos\'a0bytes\'a0\'e9 uma letra (string.ascii_letters) ou d\'edgito (string.digits). Enquanto a condi\'e7\'e3o de inicializa\'e7\'e3o do ciclo for satisfeita, este processo repete-se. Quando o mesmo for interrompido procede-se \'e0 concatena\'e7\'e3o o\'a0byte\'a0com o segredo.\
\pard\pardeftab720\partightenfactor0
\cf0 \expnd0\expndtw0\kerning0
\
Deste modo, facilmente se justifica o facto de o segredo gerado ser composto apenas por letras e n\'fameros, pois a fun\'e7\'e3o referida filtra os valores obtidos para que o segredo contenha apenas caracteres pertencentes a string.ascii_letters e string.digits.\
\pard\pardeftab720\partightenfactor0
\cf0 \
\
###2. \
\
Para n\'e3o limitar o output a letras e d\'edgitos obrigatoriamente \'e9 necess\'e1rio modificar o c\'f3digo descrito acima\
\
ACABARRR\
\
\
\
\
\
\
\
### 2\\. Partilha/Divis\'e3o de segredo (Secret Sharing/Splitting)\
\
#### Resposta \'e0 pergunta P2.1\
\
##A.\
\
\pard\pardeftab708\ri182\partightenfactor0
\cf0 \kerning1\expnd0\expndtw0 O ficheiro\'a0createSharedSecret-app.py\'a0permite fazer a divis\'e3o de um segredo por um grupo. Cada entidade do mesmo recebe parte de um \'93c\'f3digo\'94 que e quando se efectua a reuni\'e3o de algumas das partes ou mesmo de todas, \'e9 capaz de reconstruir o segredo. Assim, o input deste programa \'e9 constitu\'eddo por quatro argumentos: o n\'famero de partes em que se vai dividir o segredo, o n\'famero de partes suficientes para a reconstru\'e7\'e3o do segredo, o identificador do segredo e a chave privada em base 64.\
\
Posto isto, para efectuar a divis\'e3o pretendida come\'e7ou-se por gerar a chave privada, atrav\'e9s do seguinte comando:\
\
\pard\pardeftab720\partightenfactor0
\cf0 \expnd0\expndtw0\kerning0
`openssl gearas -aes128 -out key.pem 1024`
\f1\fs24 \kerning1\expnd0\expndtw0 \
\pard\pardeftab720\partightenfactor0

\f0\fs26 \cf0 \expnd0\expndtw0\kerning0
\
Por conseguinte, procedeu-se \'e0 divis\'e3o do segredo:\
\
\
Depois, foi executado o comando para a chave gerada: \
\pard\pardeftab720\partightenfactor0
\cf0 `python createSharedSecret-app.py  \
\
???\
\
\
\
##B.\
\
Antes de mais, comece-se por construir o certificado, que ser\'e1 \'fatil na recupera\'e7\'e3o do segredo, associado \'e0 chave privada gerada, recorrendo ao comando:\
\pard\pardeftab720\partightenfactor0

\f2\fs27\fsmilli13600 \cf3 \cb4 \
\
\pard\pardeftab720\partightenfactor0

\f0\fs26 \cf0 \cb1 `openssl req -key key.pem -new -x509 -days 365 -out key.cert`
\f2\fs27\fsmilli13600 \cf3 \cb4 \
\pard\pardeftab720\partightenfactor0

\f0\fs26 \cf0 \cb1 \
Posto isto, pode-se ent\'e3o executar os programas *recoverSecretFromComponents-app.py* e *recoverSecretFromAllComponents-app.py*, registando-se o obtido para cada um deles:\
\
- *recoverSecretFromComponents-app.py* :\
\
\
\
\
-*recoverSecretFromAllComponents-app.py*:\
\
\
\
Efectuando v\'e1rias tentativas chegou-se \'e0 conclus\'e3o que o \kerning1\expnd0\expndtw0 programa\'a0recoverSecretFromAllComponents-app.py precisa que se adicione o valor correspondente ao n\'famero de partes pelo qual o segredo foi dividido, n\'e3o sendo capaz de recuperar o segredo se apenas lhe forem fornecidas as partes relativas ao quorum.\
\
\
\pard\pardeftab708\ri182\partightenfactor0
\cf0 Assim, enquanto o programa\'a0recoverSecretFromComponents-app.py\'a0para reconstruir o segredo exige, no m\'ednimo, a quantidade definida como sendo o\'a0quorum, o outro programa em estudo necessita de todas as partes para reconstruir o mesmo.\
\
Deste modo poder\'e1 ser \'fatil utilizar\'a0recoverSecretFromAllComponents-app.py\'a0em vez de\'a0recoverSecretFromComponents-app.py, uma vez que os esquemas de partilha/divis\'e3o de segredo permitem alcan\'e7ar altos n\'edveis de confidencialidade e confiabilidade, de acordo com as necessidades do segredo em causa.\
\
Aquando se pretender n\'edveis quase absolutos de confidencialidade e confiabilidade \'e9 logicamente mais \'fatil recorrer ao programa recoverSecretFromAllComponents-app.py.\
\pard\pardeftab720\partightenfactor0
\cf0 \expnd0\expndtw0\kerning0
\
\
\
### 3\\. Authenticated Encryption\
\
\
\
#### Resposta \'e0 p ergunta P3.1\
\
Antes de passar ao algoritmo pretendido, seguem-se as fun\'e7\'f5es necess\'e1rias e respetivos input\'92s e output\'92s necess\'e1rio \'e0 elabora\'e7\'e3o do mesmo.\
\
#Fun\'e7\'f5es pr\'e9-definidas:\
\
- getID: fun\'e7\'e3o que recebe o identificador \'93ano.mes.dia\'94 e retorna a chave privada associada ao mesmo\
-getcomponets: fun\'e7\'e3o que retornou o lbl, o criptografia e o identificador\
Seja a etiqueta associada ao segredo denotada por \'93lbl\'94\
-cifra: fun\'e7\'e3o respons\'e1vel pela cifragem propriamente dita\
-decifra: fun\'e7\'e3o respons\'e1vel pela decifrarem propriamente dita\
- gethmac:\
\
\
def cipher(ptxt,lbl):\
	ctxt = cifra(ptxt)\
	id = getTd()\
	res = hmac(id, lbl + ctxt) + lbl + ctxt\
	return res\
\
\
\
def decipher(ctxt):\
r_hmac = gethmac(ctxt)\
id, lbl, ctxt = getcomponents(ctxt)\
	if emac (id, lbl + ctxt) == r_hmac:\
		decifra(ctxt,id)\
	else:\
		return \'91Erro\'92\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
### 4\\. Algoritmos e tamanhos de chaves\
\
Consultou-se o site https://webgate.ec.europa.eu/tl-browser/, com o objetivo de identificar os algoritmos e tamanhos de chave utilizados nos certificados das Entidades de Certifica\'e7\'e3o (EC) que emitem certificados digitais qualificados da Cro\'e1cia, nomeadamente nas EC\'92s AKD d.o.o (https://webgate.ec.europa.eu/tl-browser/#/tl/HR/1/0) e Financijska agencija (https://webgate.ec.europa.eu/tl-browser/#/tl/HR/0/0).\
\
- EC AKD d.o.o\
\
Esta entidade certificadora emite o certificado [HR electronic IDentity](https://webgate.ec.europa.eu/tl-browser/#/tl/HR/1/0).\
\
Seguindo o procedimento pedido chega-se facilmente \'e0s informa\'e7\'f5es pretendidas, nomeadamente que o algoritmo utilizado \'e9 o SHA-256 com cifragem RSA e que o tamanho da chave \'e9 4096 bits.\
\
- EC Financijska agencija \
Esta entidade certificadora emite o certificado [FINA Digital Certificate Registry -QC](https://webgate.ec.europa.eu/tl-browser/#/tl/HR/0/0)\
\
\pard\pardeftab720\partightenfactor0
\cf0 Analogamente obt\'e9m-se facilmente as informa\'e7\'f5es pretendidas, i.e, que  algoritmo utilizado \'e9 o \
\
\
\
 e que o tamanho da chave \'e9 \
\
\
\pard\pardeftab720\partightenfactor0
\cf0 \
\
\
\
\pard\pardeftab720\partightenfactor0
\cf0 \
}
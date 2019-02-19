# Aula TP - 11/Fev/2019

Segue-se as respostas às perguntas dos exercícios propostos na aula que decorreu no dia 11 de Fevereiro de 2019.

## Exercícios

### 1\. Números aleatórios/pseudoaleatórios


#### Resposta à pergunta P1.1

Após testar os comandos pedidos destaca-se, primeiramente, a diferença entre os comandos `head -c 1024 /dev/random | openssl enc -base64` e `head -c 1024 /dev/urandom | openssl enc -base64`. 


Ao executar o primeiro comando notou-se que este não mostra qualquer output no terminal. Após alguma pesquisa, verificou-se que tal deve-se à falta de entropia disponível no sistema. Assim, quando o pool de entropia está vazio, operações de leitura são bloqueadas até que seja captado algum ruído adicional do ambiente, ficando o dispositivo até lá à espera.

Já o comando `head -c 1024 /dev/urandom | openssl enc -base64` não é bloquedo, respondendo de forma imediata, pois o mesmo reutiliza o pool interno para produzir mais bits pseudo-aleatórios, o que é menos seguro, podendo este ser vulnerável a ataques criptográficos, contudo é bastante mais rápido que o anterior.

Deste modo, apesar do `/dev/urandom` ser criptograficamente seguro, apenas deve ser considerado quando o desempenho obtido com o uso do `/dev/random/` não satisfizer os requisitos pretendidos pela aplicação em causa.

Em relação aos comandos em faltam, detentores de tamanhos de chaves menores que o primeiro comando aqui apresentado, observa-se que na execução dos mesmos já se obteve output. Note-se ainda que quanto maior o número de bytes que forem pedidos maior é a quantidade de tempo necessária para gerar o valor pedido. 


#### Resposta à pergunta P1.2

O haveged - <http://www.issihosts.com/haveged/index.html> - é um daemon de entropia adaptado do algoritmo HAVEGE (_HArdware Volatile Entropy Gathering and Expansion_) - <http://www.irisa.fr/caps/projects/hipsor/> -, cujo objetivo passa por corrigir condições de baixa entropia no dispositivo aleatório do Linux. O uso do mesmo aumenta assim a entropia do gerador usando fontes adicionais baseadas em características do hardware atual.

Com a instalação da a package haveged e após testar novamente os comandos `head -c 1024 /dev/random | openssl enc -base64` e `head -c 1024 /dev/urandom | openssl enc -base64`, observa-se que comando `/dev/random` já apresenta output e que o tempo de execução do outro comando diminui.

#### Resposta à pergunta P1.3

###1.

Ao analisar o ficheiro *generateSecret-app.py* baseado no módulo eVotUM.Cripto (https://gitlab.com/eVotUM/Cripto-py) observa-se que a função generateSecret recorre ao módulo shamirsecret.py, e que  inicializa-se com um ciclo, seguido-se a geração de uma sequência de bytes pseudoaleatórios. Depois, a mesma verifica se cada um dos bytes é uma letra (string.ascii_letters) ou dígito (string.digits). Enquanto a condição de inicialização do ciclo for satisfeita, este processo repete-se. Quando o mesmo for interrompido procede-se à concatenação o byte com o segredo.

Deste modo, facilmente se justifica o facto de o segredo gerado ser composto apenas por letras e números, pois a função referida filtra os valores obtidos para que o segredo contenha apenas caracteres pertencentes a string.ascii_letters e string.digits.


###2. 

Para não limitar o output a letras e dígitos obrigatoriamente é necessário modificar o código descrito acima

ACABARRR







### 2\. Partilha/Divisão de segredo (Secret Sharing/Splitting)

#### Resposta à pergunta P2.1

##A.

O ficheiro createSharedSecret-app.py permite fazer a divisão de um segredo por um grupo. Cada entidade do mesmo recebe parte de um “código” que e quando se efectua a reunião de algumas das partes ou mesmo de todas, é capaz de reconstruir o segredo. Assim, o input deste programa é constituído por quatro argumentos: o número de partes em que se vai dividir o segredo, o número de partes suficientes para a reconstrução do segredo, o identificador do segredo e a chave privada em base 64.

Posto isto, para efectuar a divisão pretendida começou-se por gerar a chave privada, através do seguinte comando:

`openssl gearas -aes128 -out key.pem 1024`

Por conseguinte, procedeu-se à divisão do segredo:


Depois, foi executado o comando para a chave gerada: 
`python createSharedSecret-app.py  

???



##B.

Antes de mais, comece-se por construir o certificado, que será útil na recuperação do segredo, associado à chave privada gerada, recorrendo ao comando:


`openssl req -key key.pem -new -x509 -days 365 -out key.cert`

Posto isto, pode-se então executar os programas *recoverSecretFromComponents-app.py* e *recoverSecretFromAllComponents-app.py*, registando-se o obtido para cada um deles:

- *recoverSecretFromComponents-app.py* :




-*recoverSecretFromAllComponents-app.py*:



Efectuando várias tentativas chegou-se à conclusão que o programa recoverSecretFromAllComponents-app.py precisa que se adicione o valor correspondente ao número de partes pelo qual o segredo foi dividido, não sendo capaz de recuperar o segredo se apenas lhe forem fornecidas as partes relativas ao quorum.


Assim, enquanto o programa recoverSecretFromComponents-app.py para reconstruir o segredo exige, no mínimo, a quantidade definida como sendo o quorum, o outro programa em estudo necessita de todas as partes para reconstruir o mesmo.

Deste modo poderá ser útil utilizar recoverSecretFromAllComponents-app.py em vez de recoverSecretFromComponents-app.py, uma vez que os esquemas de partilha/divisão de segredo permitem alcançar altos níveis de confidencialidade e confiabilidade, de acordo com as necessidades do segredo em causa.

Aquando se pretender níveis quase absolutos de confidencialidade e confiabilidade é logicamente mais útil recorrer ao programa recoverSecretFromAllComponents-app.py.



### 3\. Authenticated Encryption



#### Resposta à p ergunta P3.1

Antes de passar ao algoritmo pretendido, seguem-se as funções necessárias e respetivos input’s e output’s necessário à elaboração do mesmo.

#Funções pré-definidas:

- getID: função que recebe o identificador “ano.mes.dia” e retorna a chave privada associada ao mesmo
-getcomponets: função que retornou o lbl, o criptografia e o identificador
Seja a etiqueta associada ao segredo denotada por “lbl”
-cifra: função responsável pela cifragem propriamente dita
-decifra: função responsável pela decifrarem propriamente dita
- gethmac:


def cipher(ptxt,lbl):
	ctxt = cifra(ptxt)
	id = getTd()
	res = hmac(id, lbl + ctxt) + lbl + ctxt
	return res



def decipher(ctxt):
r_hmac = gethmac(ctxt)
id, lbl, ctxt = getcomponents(ctxt)
	if emac (id, lbl + ctxt) == r_hmac:
		decifra(ctxt,id)
	else:
		return ‘Erro’
















### 4\. Algoritmos e tamanhos de chaves

Consultou-se o site https://webgate.ec.europa.eu/tl-browser/, com o objetivo de identificar os algoritmos e tamanhos de chave utilizados nos certificados das Entidades de Certificação (EC) que emitem certificados digitais qualificados da Croácia, nomeadamente nas EC’s AKD d.o.o (https://webgate.ec.europa.eu/tl-browser/#/tl/HR/1/0) e Financijska agencija (https://webgate.ec.europa.eu/tl-browser/#/tl/HR/0/0).

- EC AKD d.o.o

Esta entidade certificadora emite o certificado [HR electronic IDentity](https://webgate.ec.europa.eu/tl-browser/#/tl/HR/1/0).

Seguindo o procedimento pedido chega-se facilmente às informações pretendidas, nomeadamente que o algoritmo utilizado é o SHA-256 com cifragem RSA e que o tamanho da chave é 4096 bits.

- EC Financijska agencija 
Esta entidade certificadora emite o certificado [FINA Digital Certificate Registry -QC](https://webgate.ec.europa.eu/tl-browser/#/tl/HR/0/0)

Analogamente obtém-se facilmente as informações pretendidas, i.e, que  algoritmo utilizado é o 



 e que o tamanho da chave é 









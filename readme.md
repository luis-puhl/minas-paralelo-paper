# Uma Implementação Distribuída em Névoa do Algoritmo de Detecção de Novidade em Fluxos de Dados MINAS

## A distributed fog implementation of the data stream novelty detection algorithm MINAS

Repositório de documentos de dissertação e apresentação relativos ao mestrado
em redes e sistemas distribuídos de Luís Puhl.

## PDFs

- [Dissertação Atual](./00.ppgcc-2020.pdf)
- [Dissertação Qualificação](./DissertacaoQuali-LuisPuhl.pdf)
- [Apresentação Atual](./00.beamer.pdf)

## Resumo

Em um cenário de crescente número de dispositivos na Internet das Coisas (IoT),
gerando proporcional crescimento no volume dos fluxos de dados gerados, são
constantes e evolutivas as ameaças ativas e passivas aos recursos computacionais
e aos conteúdos transmitidos.\
Métodos para mineração de dados de forma robusta e contínua podem ser um
aliado à segurança nesses casos.\
Particularmente em ambientes distribuídos e nos quais busca-se manter os
fluxos de informação próximos a onde eles são gerados, como nas bordas das
redes IoT, e na computação em névoa de maneira geral, a detecção de ameaças é
essencial e não trivial.\
Além disso, a evolução constante dos tipos de dispositivos e de tráfegos
nessas redes favorece que as ferramentas de detecção de ameaças sejam
beneficiadas por algoritmos de detecção de novidades em fluxo de dados.\
MINAS é um exemplo de algoritmo de detecção de novidades em fluxos de dados
com potencial para aplicação na computação em névoa.\
No entanto, apesar de sua divisão em três partes semi-independentes, este
algoritmo ainda não foi adaptado para processar grandes volumes de fluxos
reais em ambiente de computação em névoa.\
O presente trabalho aborda essa lacuna, propondo um sistema que implementa o
algoritmo MINAS de maneira distribuída num contexto de detecção de intrusão e
computação em névoa e também avalia esta implementação.\
Os resultados obtidos mostram a viabilidade do modelo de detecção de
novidades distribuído em ambiente de computação em névoa.\
Mesmo em um cenário distribuído, o sistema apresentou eficácia equivalente ao
algoritmo original, ainda que executando em dispositivos de capacidade
computacional limitada, como é previsto em cenários de IoT.\

Detecção de Novidades; Detecção de Intrusão; Fluxos de Dados; Computação Distribuída; Computação em Névoa; Internet das Coisas;

## Abstract

The ongoing implementation of the Internet of Things (IoT) is sharply
increasing the number and variety of small devices on edge networks.\
Likewise, the attack opportunities for hostile agents also
increases, requiring more effort from network administrators and strategies
to detect and react to those threats.\
For a network security system to operate in the context of fog and
IoT, it has to comply with processing, storage, and energy
requirements alongside traditional requirements for stream and network
analysis like accuracy and scalability.\
Using a previously defined architecture (IDSA-IoT), we address the construction
and evaluation of a support mechanism for distributed Network Intrusion
Detection Systems (NIDS) based on the MINAS Data Stream Novelty Detection
algorithm.\
We discuss the algorithm steps, how it can be deployed in a distributed
environment, the impacts on the accuracy and evaluate performance and
scalability using a cluster of constrained devices commonly found in IoT
scenarios.\
The obtained results show equivalent metrics in the distributed version but
also a reduction in the execution time using low profile devices.\
Although not efficient, the parallel version showed to be viable as the
proposed granularity provides equivalent accuracy and same response times.\

Novelty Detection; Intrusion Detection; Data Streams; Distributed Computing; Fog Computing; IoT devices;
